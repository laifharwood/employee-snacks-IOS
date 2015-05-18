//
//  PasscodeCreateViewController.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/16/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit

class PasscodeCreateViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var numbersEnteredLabel: UILabel!
    
    
    var firstAttemptCode = ""
    var secondAttemptCode = ""
    var attempt = 1
    var numberOfButtonsPressed = 0
    
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
    
    func numberPressedTracker(num: Int){
        
        ++numberOfButtonsPressed
        
        
        if numberOfButtonsPressed == 1{
            
            numbersEnteredLabel.text = "X _ _ _ _"
            
            if attempt == 1{
                
               firstAttemptCode += "\(num)"
            }else{
                
                secondAttemptCode += "\(num)"
            }
            
            
        }else if numberOfButtonsPressed == 2{
            
            numbersEnteredLabel.text = "X X _ _ _"
            
            if attempt == 1{
                
                firstAttemptCode += "\(num)"
            }else{
                
                secondAttemptCode += "\(num)"
            }
        }else if numberOfButtonsPressed == 3{
            
            numbersEnteredLabel.text = "X X X _ _"
            if attempt == 1{
                
                firstAttemptCode += "\(num)"
            }else{
                
                secondAttemptCode += "\(num)"
            }
        }else if numberOfButtonsPressed == 4{
            
            numbersEnteredLabel.text = "X X X X _"
            if attempt == 1{
                
                firstAttemptCode += "\(num)"
            }else{
                
                secondAttemptCode += "\(num)"
            }
        }else if numberOfButtonsPressed == 5{
            
            numbersEnteredLabel.text = "X X X X X"
            if attempt == 1{
                
                firstAttemptCode += "\(num)"
                
                numbersEnteredLabel.text = "_ _ _ _"
                
                messageLabel.textColor = UIColor.blackColor()
                messageLabel.text = "Please re-enter code"
                
                attempt = 2
                
                numberOfButtonsPressed = 0
                
                //println(numberOfButtonsPressed)
                
            }else{
                
                secondAttemptCode += "\(num)"
                
                if secondAttemptCode == firstAttemptCode{
                    
                    passcode = secondAttemptCode
                    NSUserDefaults.standardUserDefaults().setObject(passcode, forKey: "passcode")
                    println(passcode)
                    
                    performSegueWithIdentifier("passcodeCreated", sender: self)
                    
                    firstAttemptCode = ""
                    secondAttemptCode = ""
                    
                    
                }else{
                    
                   numbersEnteredLabel.text = "_ _ _ _ _"
                   messageLabel.text = "Entires Did Not Match, Please Try Again"
                    messageLabel.textColor = UIColor.redColor()
                    
                    firstAttemptCode = ""
                    secondAttemptCode = ""
                    
                    attempt = 1
                    
                    numberOfButtonsPressed = 0
                    
                    
                }
                
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
