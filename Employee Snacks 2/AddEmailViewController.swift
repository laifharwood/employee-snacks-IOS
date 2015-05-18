//
//  AddEmailViewController.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/16/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit

class AddEmailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func addEmailAction(sender: AnyObject) {
        
        var emailString = textField.text.lowercaseString
        
        toRecipients.append(emailString)
        NSUserDefaults.standardUserDefaults().setObject(toRecipients, forKey: "toRecipients")
        
        textField.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.delegate = self
        
        textField.becomeFirstResponder()

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
