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
        periodCharges.append(doubleCharge)
            
        let dateNow = NSDate()
            
        chargeDates.append(dateNow)
            
        var index:Int
        var periodIndex:Int
            
        index = charges.count - 1
        periodIndex = periodCharges.count - 1
            
        
            
        employeeDict["\(employees[activeEmployee])"]?.append(index)
        periodEmployeeDict["\(employees[activeEmployee])"]!.append(periodIndex)
            
            
        findPeriodTotal()
            
        addChargeTextField.text = ""
            
        /*
            
        let flags: NSCalendarUnit = NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear
        
        let startComponents = NSDateComponents()
            
        let nowComponents = NSCalendar.currentCalendar().components(flags, fromDate: dateNow)
            
        let nowDay = nowComponents.day
        let nowMonth = nowComponents.month
        let nowYear = nowComponents.year
        
        
            
            if nowDay >= 1 && nowDay < 16{
                
                startComponents.day = 1
                startComponents.month = nowComponents.month
                startComponents.year = nowComponents.year
                startComponents.hour = 0
                startComponents.minute = 0
                startComponents.second = 0
                
            }else{
                
                startComponents.day = 16
                startComponents.month = nowComponents.month
                startComponents.year = nowComponents.year
                startComponents.hour = 0
                startComponents.minute = 0
                startComponents.second = 0
                
            }
            
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let startTime = calendar!.dateFromComponents(startComponents)
            
        
            
        var tempIndexArray = [Int]()
        
            
        
        for dates in chargeDates{
                
            if(dates.isGreaterThanDate(startTime!))
            {
                
                var x = find(chargeDates, dates)
                tempIndexArray.append(x!)
                
                
            }
            
                
        }

            
            for indexes in tempIndexArray{
                
                if contains(activeEmployeeIndexes, indexes){
            
            
                }
            }
            
        
          */
        
            
        
            
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
        self.title = employees[activeEmployee]
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
        
        activeEmployeeIndexes = periodEmployeeDict["\(employees[activeEmployee])"]!
        
        var periodTotal = 0.0
        
        for indexes in activeEmployeeIndexes{
            
            periodTotal = periodTotal + periodCharges[indexes]
        }
        
        periodTotalLabel.text = "\(periodTotal)"
        
        
    }
    
    

}

