//
//  ViewController.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/8/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addChargeTextField: UITextField!
    @IBAction func addChargeButton(sender: AnyObject) {
        
        
        var doubleCharge:Double = 0.0
        
        doubleCharge = (addChargeTextField.text as NSString).doubleValue
        
        if doubleCharge == 0.0 {
            println("error")
        } else{
            
          //println("\(periodTotals[0])")
        
        periodTotals[activeEmployee] =  periodTotals[activeEmployee] + doubleCharge
            
        periodTotalLabel.text = "\(periodTotals[activeEmployee])"
            
        addChargeTextField.text = ""
            
        //println("Employee \(employees[activeEmployee]) total period value is \(periodTotals[activeEmployee]) ")
            
        }
        
    }
    @IBOutlet weak var periodTotalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChargeTextField.delegate = self
        
        addChargeTextField.becomeFirstResponder()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = employees[activeEmployee]
        periodTotalLabel.text = "\(periodTotals[activeEmployee])"
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
    }


}

