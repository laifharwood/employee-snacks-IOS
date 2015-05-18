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
var periodChargeDates = [NSDate]()




class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var topRect: UIView!
    @IBOutlet weak var leftRect: UIView!
    @IBOutlet weak var rightRect: UIView!
    
    
    

    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var dashButton: UIButton!
    @IBOutlet weak var periodButton: UIButton!
    
    var padButtonArray: [UIButton] = [UIButton]()
    
    
    
    
    @IBOutlet weak var addButton: UIButton!
    
    
    
    @IBOutlet weak var pointThreeFiveButton: UIButton!
    @IBOutlet weak var pointFiveButton: UIButton!
    @IBOutlet weak var pointSixButton: UIButton!
    @IBOutlet weak var onePointZeroButton: UIButton!
    @IBOutlet weak var onePointFourButton: UIButton!
    @IBOutlet weak var onePointSevenButton: UIButton!
    @IBOutlet weak var twoPointZeroButton: UIButton!
    @IBOutlet weak var threePointTwoFiveButton: UIButton!
    
    @IBOutlet weak var clearButtonOutlet: UIButton!
    @IBAction func clearButtonAction(sender: AnyObject) {
        
        padTotalLabelString = ""
        padTotalLabel.text = "0.00"
        
    }
    var quickChargeButtonArray: [UIButton] = [UIButton]()
    
    var padTotalLabelString = ""
    
    //@IBOutlet weak var periodTotalLabel: UILabel!
    @IBOutlet weak var padTotalLabel: UILabel!
    
    @IBAction func addTappedButton(sender: AnyObject) {
        
        addCharge(padTotalLabelString)
        
        padTotalLabelString = ""
        padTotalLabel.text = "0.00"
        
        
        
    }
    
    @IBAction func keyPadButtons(sender: AnyObject) {
        
        if sender.tag == 1 {
            
            padTotalLabelString += "1"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 2{
            
            padTotalLabelString += "2"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 3{
            
            padTotalLabelString += "3"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 4{
            
            padTotalLabelString += "4"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 5{
            
            padTotalLabelString += "5"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 6{
            
            padTotalLabelString += "6"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 7{
            
            padTotalLabelString += "7"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 8{
            
            padTotalLabelString += "8"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 9{
            
            padTotalLabelString += "9"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 10{
            
            padTotalLabelString += "0"
            padTotalLabel.text = padTotalLabelString
            
        }else if sender.tag == 11{
            
            if padTotalLabelString == ""{
            
            padTotalLabelString += "-"
            padTotalLabel.text = padTotalLabelString
            }
            
        }else if sender.tag == 12{
            
            if contains(padTotalLabelString, "."){
                
            }else{
            
            padTotalLabelString += "."
            padTotalLabel.text = padTotalLabelString
        }
        
        }
        
        
        
        
        
    }
    
    @IBAction func quickChargeTapped(sender: AnyObject) {
        
        
        if sender.tag == 35 {
            
           addCharge("0.35")
            
        }else if sender.tag == 50{
            
            addCharge("0.50")
            
        }else if sender.tag == 60{
            
            addCharge("0.60")
            
        }else if sender.tag == 100{
            
            addCharge("1.00")
            
        }else if sender.tag == 140{
            
           addCharge("1.40")
            
        }else if sender.tag == 170{
            
           addCharge("1.70")
            
        }else if sender.tag == 200{
            
          addCharge("2.00")
            
        }else if sender.tag == 325{
            
          addCharge("3.25")
            
        }
        
        
        
        
        
    }
   
    
    //@IBOutlet weak var addChargeTextField: UITextField!
    func addCharge(numberString: String) {
        
        
        var doubleCharge:Double = 0.0
        
        doubleCharge = (numberString as NSString).doubleValue
        
        //println(doubleCharge)
        
        if doubleCharge == 0.0 {
            //println("error")
        } else{
            
        charges.append(doubleCharge)
        updateCharges()
        periodCharges.append(doubleCharge)
        updatePeriodCharges()
            
        let dateNow = NSDate()
            
        periodChargeDates.append(dateNow)
        updatePeriodCharges()
            
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
            
        //addChargeTextField.text = ""
            
            
        }
        
    }
    
    @IBOutlet weak var periodTotalLabel: UILabel!
    
    
    
    override func viewDidAppear(animated: Bool) {
        
       // println("ViewDidAppear")
        
    let timer = NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: "timedOut", userInfo: nil, repeats: false)
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // println("ViewDidLoad")
        
        //self.addChargeTextField.delegate = self
        
        //addChargeTextField.becomeFirstResponder()
        
        findPeriodTotal()
        
        self.padButtonArray = [self.oneButton, self.twoButton, self.threeButton, self.fourButton, self.fiveButton, self.sixButton, self.sevenButton, self.eightButton, self.nineButton, self.zeroButton, self.dashButton, self.periodButton, self.addButton, self.clearButtonOutlet]
        
        self.quickChargeButtonArray = [self.pointThreeFiveButton, self.pointFiveButton, self.pointSixButton, self.onePointZeroButton, self.onePointFourButton, self.onePointSevenButton, self.twoPointZeroButton, self.threePointTwoFiveButton]
        

        let padButtonColor : UIColor = UIColor(red: 255, green: 137/255, blue: 0, alpha: 1)
        let quickChargeButtonColor : UIColor = UIColor(red: 0, green: 131/255, blue: 255, alpha: 1)
        
        
        for button in padButtonArray{
            
            //button.backgroundColor = padButtonColor
            //button.layer.cornerRadius = oneButton.frame.width/2
            button.layer.borderWidth = 1
            button.layer.borderColor = padButtonColor.CGColor
            
        }
        
        
        for button in quickChargeButtonArray{
            
            button.backgroundColor = padButtonColor
            //button.layer.cornerRadius = oneButton.frame.width/4
            //button.layer.borderWidth = 1
            //button.layer.borderColor = quickChargeButtonColor.CGColor
            
        }
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = sortedEmployees[activeEmployee].capitalizedString
        
       
        
        checkForNewPeriod()
        
        
    }
    
   
    
   
    
    func findPeriodTotal(){
        
        var activeEmployeeIndexes = [Int]()
        
        activeEmployeeIndexes = periodEmployeeDict["\(sortedEmployees[activeEmployee])"]!
        
        var periodTotal = 0.0
        
        for indexes in activeEmployeeIndexes{
            
            periodTotal = round(100 * (periodTotal + periodCharges[indexes]))/100
        }
        
        periodTotalLabel.text = "\(periodTotal)"
        
        
    }
    
    
    
    func timedOut(){
        
        //println(timedOut)
        self.performSegueWithIdentifier("timedOut", sender: self)
    }
    
    

}

