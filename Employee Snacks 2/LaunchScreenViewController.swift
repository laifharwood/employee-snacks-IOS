//
//  LaunchScreenViewController.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/16/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }

        // Do any additional setup after loading the view.
    

    override func viewDidAppear(animated: Bool) {
        
        
        if passcode == ""{
            
            performSegueWithIdentifier("passcodeNotCreated", sender: self)
            
        }else{
            
            
            performSegueWithIdentifier("passcodeCreated", sender: self)
            
        }

    
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
