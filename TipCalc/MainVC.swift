//
//  MainVC.swift
//  TipCalc
//
//  Created by Reiss Zurbyk on 2016-01-09.
//  Copyright © 2016 Reiss Zurbyk. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var subtotalEntry: UITextField!
    @IBOutlet weak var percFromSlider: UILabel!
    @IBOutlet weak var sliderValue: UISlider!
    @IBOutlet weak var numOfPeople: UITextField!
    @IBOutlet weak var tipPerPerson: UILabel!
    @IBOutlet weak var perPersonText: UILabel!
    @IBOutlet weak var startOver: UIButton!
    
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view
        
        subtotalEntry.delegate = self
        numOfPeople.delegate = self
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sliderChanged(_ sender: UISlider) {
        
        // set value of slider
        let currentValue = Int(sliderValue.value)
        
        // update text with value
        percFromSlider.text = "\(currentValue)%"
        
    }
    
    @IBAction func calculateTipPressed(_ sender: AnyObject) {
        
        // check that fields are populated
        if subtotalEntry.text == nil {
            subtotalEntry.text = "0.00"
        }
        
        if numOfPeople.text == nil {
            numOfPeople.text = "1"
        }
        
        let subtotal = Float(subtotalEntry.text!)
        let split = Float(numOfPeople.text!)
        let perc = Int(sliderValue.value)
        
        // perform calculation
        tipPerPerson.text = "$" + String(subtotal! * (Float(perc)/100) / split!)
        
        // unhide
        tipPerPerson.isHidden = false
        perPersonText.isHidden = false
        startOver.isHidden = false
        
        // resign keyboards
        subtotalEntry.resignFirstResponder()
        numOfPeople.resignFirstResponder()
        
    }
    
    @IBAction func startOverPressed(_ sender: AnyObject) {
        
        // restore app settings
        tipPerPerson.isHidden = true
        perPersonText.isHidden = true
        startOver.isHidden = true
        subtotalEntry.text = nil
        sliderValue.value = 20
        percFromSlider.text = "20%"
        numOfPeople.text = nil
        tipPerPerson.text = nil
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        subtotalEntry.resignFirstResponder()
        numOfPeople.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        subtotalEntry.resignFirstResponder()
        numOfPeople.resignFirstResponder()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
