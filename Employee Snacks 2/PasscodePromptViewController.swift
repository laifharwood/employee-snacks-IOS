//
//  PasscodePromptViewController.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/16/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit

class PasscodePromptViewController: UIViewController {

    @IBOutlet weak var numbersEnteredLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBAction func numberPadTapped(sender: AnyObject) {
        
        
        if sender.tag == 1{
            
            numberPressedTracker(1)
            
        }else if sender.tag == 2{
            
            numberPressedTracker(2)
            
        }else if sender.tag == 3{
            
            numberPressedTracker(3)
            
        }else if sender.tag == 4{
            
            numberPressedTracker(4)
            
        }else if sender.tag == 5{
            
            numberPressedTracker(5)
            
        }else if sender.tag == 6{
            
            numberPressedTracker(6)
            
        }else if sender.tag == 7{
            
            numberPressedTracker(7)
            
        }else if sender.tag == 8{
            
            numberPressedTracker(8)
            
        }else if sender.tag == 9{
            
            numberPressedTracker(9)
            
        }else if sender.tag == 10{
            
            numberPressedTracker(0)
            
        }
        
    }
    
    
    var numberOfButtonsPressed = 0
    var firstAttemptCode = ""
    
    
    func numberPressedTracker(num: Int){
        
        ++numberOfButtonsPressed
        
        
        if numberOfButtonsPressed == 1{
            
            numbersEnteredLabel.text = "X _ _ _"
            
            
                
                firstAttemptCode += "\(num)"
           
            
            
            
        }else if numberOfButtonsPressed == 2{
            
            numbersEnteredLabel.text = "X X _ _"
            
            
                
                firstAttemptCode += "\(num)"
            
                
            
        }else if numberOfButtonsPressed == 3{
            
            numbersEnteredLabel.text = "X X X _"
            
                
                firstAttemptCode += "\(num)"
            
        }else if numberOfButtonsPressed == 4{
            
                numbersEnteredLabel.text = "X X X X"
                firstAttemptCode += "\(num)"
            
            if firstAttemptCode == passcode{
                
                
                performSegueWithIdentifier("passcodeEntered", sender: self)
                
            }else{
                
            
                
                numbersEnteredLabel.text = "_ _ _ _"
                
                messageLabel.textColor = UIColor.redColor()
                
                messageLabel.text = "Incorrect Passcode Please Try Again"
            
                numberOfButtonsPressed = 0
                
                firstAttemptCode = ""
                
            
                
            }
        }
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
