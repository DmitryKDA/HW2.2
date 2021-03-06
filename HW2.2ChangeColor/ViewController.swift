//
//  ViewController.swift
//  HW2.2ChangeColor
//
//  Created by Дмитрий Крутько on 4.01.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIImageView!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    @IBOutlet weak var brightnessSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var brightnessTextField: UITextField!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var brightnessLabel: UILabel!
    
    var redColor: Float?
    var greenColor: Float?
    var blueColor: Float?
    var brightness: Float?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        
        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
        addDoneButtonTo(brightnessTextField)
        
        
    }
    
    private func setupViewController (){
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        brightnessTextField.delegate = self
        view.backgroundColor = .secondarySystemBackground
        colorView.layer.cornerRadius = colorView.frame.height/10
        colorView.backgroundColor = .white
        
        redColorSlider.maximumValue = 1
        redColorSlider.minimumValue = 0
        redColorSlider.value = 1
        redColorSlider.minimumTrackTintColor = .red
        
        greenColorSlider.maximumValue = 1
        greenColorSlider.minimumValue = 0
        greenColorSlider.value = 1
        greenColorSlider.minimumTrackTintColor = .green
        
        blueColorSlider.maximumValue = 1
        blueColorSlider.minimumValue = 0
        blueColorSlider.value = 1
        
        brightnessSlider.maximumValue = 1
        brightnessSlider.minimumValue = 0
        brightnessSlider.value = 1
        brightnessSlider.minimumTrackTintColor = .white
    }
    
    private func changeColor (){
        colorView.backgroundColor = UIColor(
            displayP3Red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: CGFloat(brightnessSlider.value)
            )
    }
    
    private func roundByTwo (slider: UISlider) -> Float {
        return (slider.value*100).rounded(.toNearestOrEven)/100
    }
    
    private func changeValueForLables (){
        redLabel.text = String(roundByTwo(slider: redColorSlider))
        greenLabel.text = String(roundByTwo(slider: greenColorSlider))
        blueLabel.text = String(roundByTwo(slider: blueColorSlider))
        brightnessLabel.text = String(roundByTwo(slider: brightnessSlider))
    }
    
    private func changeValueForTextFields (){
        redTextField.text = String(roundByTwo(slider: redColorSlider))
        greenTextField.text = String(roundByTwo(slider: greenColorSlider))
        blueTextField.text = String(roundByTwo(slider: blueColorSlider))
        brightnessTextField.text = String(roundByTwo(slider: brightnessSlider))
    }
    
    @IBAction func SliderChanged() {
        changeValueForLables()
        changeValueForTextFields()
        changeColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event) // работает и без этой строки...
        
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard blueTextField.isFirstResponder || brightnessTextField.isFirstResponder else {
            return
        }
        self.view.frame.origin.y = -100
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard blueTextField.isFirstResponder || brightnessTextField.isFirstResponder else {
            return true
        }
        self.view.frame.origin.y = 0
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let text = textField.text,
              let textFloat = Float(text),
              textFloat <= 1,
              textFloat >= 0
        else {
            showAlert(title: "Wrong format", message: "enter value in 0 to 1")
            return
        }
        switch textField.tag {
        case 0: redColorSlider.value = textFloat
        case 1: greenColorSlider.value = textFloat
        case 2: blueColorSlider.value = textFloat
        case 3: brightnessSlider.value = textFloat
        default:
            return
        }
        changeValueForLables()
        changeValueForTextFields()
        changeColor()
    }
    
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    //objective C method
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
