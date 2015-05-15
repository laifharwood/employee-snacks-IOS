//
//  ViewController.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/8/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit

var charges = [Double]()
var chargeDates = [NSDate]()
var periodCharges = [Double]()
var employeeDict = Dictionary<String, Array<Int>>()
var periodEmployeeDict = Dictionary<String, Array<Int>>()
var employees = [String]()
var sortedEmployees = [String]()
var activeEmployee = -1
var referenceDate = NSDate()
var periodStartDates = [NSDate]()
var periodEndDates = [NSDate]()


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addChargeTextField: UITextField!
    @IBAction func addChargeButton(sender: AnyObject) {
        
        
        var doubleCharge:Double = 0.0
        
        doubleCharge = (addChargeTextField.text as NSString).doubleValue
        
        if doubleCharge == 0.0 {
            println("error")
        } else{
            
        charges.append(doubleCharge)
        updateCharges()
        periodCharges.append(doubleCharge)
        updatePeriodCharges()
            
        let dateNow = NSDate()
            
        chargeDates.append(dateNow)
        updateChargeDates()
            
        var index:Int
        var periodIndex:Int
            
        index = charges.count - 1
        periodIndex = periodCharges.count - 1
            
        
            
        employeeDict["\(sortedEmployees[activeEmployee])"]?.append(index)
        updateEmployeeDict()
        periodEmployeeDict["\(sortedEmployees[activeEmployee])"]!.append(periodIndex)
        updatePeriodEmployeeDict()
            
            
        findPeriodTotal()
            
        addChargeTextField.text = ""
            
            
        }
        
    }
    @IBOutlet weak var periodTotalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addChargeTextField.delegate = self
        
        addChargeTextField.becomeFirstResponder()
        
        findPeriodTotal()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = sortedEmployees[activeEmployee]
        checkForNewPeriod()
        //periodTotalLabel.text = "\(periodTotals[activeEmployee])"
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
    }
    
    func findPeriodTotal(){
        
        var activeEmployeeIndexes = [Int]()
        
        activeEmployeeIndexes = periodEmployeeDict["\(sortedEmployees[activeEmployee])"]!
        
        var periodTotal = 0.0
        
        for indexes in activeEmployeeIndexes{
            
            periodTotal = periodTotal + periodCharges[indexes]
        }
        
        periodTotalLabel.text = "\(periodTotal)"
        
        
    }
    
    

}

