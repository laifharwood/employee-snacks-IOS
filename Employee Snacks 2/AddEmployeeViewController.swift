//
//  AddEmployeeViewController.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/8/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit

class AddEmployeeViewController: UIViewController, UITextFieldDelegate {

    @IBAction func addEmployee(sender: AnyObject) {
       
        
        if addEmployeeTextField.text.isEmpty{
            
        }
        
        
        else {
            
       
        
        var employeeString = addEmployeeTextField.text.lowercaseString
        
        employees.append("\(employeeString)")
        updateEmployees()
        
            
        sortedEmployees = sorted(employees) {str1, str2 in str1 < str2}
        updateSortedEmployees()
        
        //println(sortedEmployees)
        
        
        
        employeeDict["\(employeeString)"] = []
        updateEmployeeDict()
        periodEmployeeDict["\(employeeString)"] = []
        updatePeriodEmployeeDict()
        //periodTotals.append(0)
        //println(employeeDict)
        //println(employees)
        
        addEmployeeTextField.text = ""
            
    }
        
        
    }
    @IBOutlet weak var addEmployeeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkForNewPeriod()
        
        self.addEmployeeTextField.delegate = self
        
        addEmployeeTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
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
