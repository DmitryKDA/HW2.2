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
        view.backgroundColor = .secondarySystemBackground
        colorView.layer.cornerRadius = colorView.frame.height/10
        
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
        blueColorSlider.minimumTrackTintColor = .blue
        
        brightnessSlider.maximumValue = 1
        brightnessSlider.minimumValue = 0
        brightnessSlider.value = 1
        brightnessSlider.minimumTrackTintColor = .white

        colorView.backgroundColor = .white
        
        redTextField.layer.cornerRadius = redTextField.frame.height/10
        greenTextField.layer.cornerRadius = greenTextField.frame.height/10
        blueTextField.layer.cornerRadius = blueTextField.frame.height/10
        brightnessTextField.layer.cornerRadius = brightnessTextField.frame.height/10
    }
    
    func changeColorBySliders (){
        colorView.backgroundColor = UIColor(
            displayP3Red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: CGFloat(brightnessSlider.value)
            )
    }
    
    @IBAction func redSliderChange() {
        redColor = (redColorSlider.value*100).rounded(.toNearestOrEven)/100
        guard let redColor = redColor else {
            return
        }
        redLabel.text = String(redColor)
        redTextField.text = String(redColor)
        changeColorBySliders()
    }
    @IBAction func greenSliderChange() {
        greenColor = (greenColorSlider.value*100).rounded(.toNearestOrEven)/100
        guard let greenColor = greenColor else {
            return
        }
        greenLabel.text = String(greenColor)
        greenTextField.text = String(greenColor)
        changeColorBySliders()
    }
    @IBAction func blueSliderChange() {
        blueColor = (blueColorSlider.value*100).rounded(.toNearestOrEven)/100
        guard let blueColor = blueColor else {
            return
        }
        blueLabel.text = String(blueColor)
        blueTextField.text = String(blueColor)
        changeColorBySliders()

    }
    @IBAction func brightnessSliderChange() {
        brightness = (brightnessSlider.value*100).rounded(.toNearestOrEven)/100
        guard let brightness = brightness else {
            return
        }
        brightnessLabel.text = String(brightness)
        brightnessTextField.text = String(brightness)
        changeColorBySliders()
    }
    @IBAction func redTextFieldChanged() {
    }
    @IBAction func greenTextFieldChanged() {
    }
    @IBAction func blueTextFieldChanged() {
    }
    @IBAction func brightnessTextFieldChanged() {
    }
    
    
    
}

