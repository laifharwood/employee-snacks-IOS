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
        
        
        employees.append(self.addEmployeeTextField.text)
        periodTotals.append(0)
        
        //println(employees)
        
        
    }
    @IBOutlet weak var addEmployeeTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
