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

    }
    
    private func setupViewController (){
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
}

//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
//        print("Ok")
//        textField.resignFirstResponder()
//        return true
//    }
//}
