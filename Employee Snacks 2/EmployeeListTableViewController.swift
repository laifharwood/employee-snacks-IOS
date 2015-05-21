//
//  EmployeeListTableViewController.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/8/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit

var passcode = ""

class EmployeeListTableViewController: UITableViewController{
    
    var sectionsDict = Dictionary<String, Array<String>>()
    var sectionString = ""
    var sectionIndex = [String]()
    //var sectionArray = [[String]]()
    
    var sectionArray = Array(count: 26, repeatedValue: [String]())
    
    
    
    
    @IBOutlet var currentTableView: UITableView!
    
    

    
    
    @IBAction func addEmployee(sender: AnyObject) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionString = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
        
        sectionIndex = sectionString.componentsSeparatedByString(" ")
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
        self.navigationItem.setHidesBackButton(true, animated: true)
        checkForNewPeriod()
        
        
        
       
        
        

        
        
        
        for employee in sortedEmployees{
          
            if employee[0] == "a" {
                sectionArray[0].append(employee)
            }else if employee[0] == "b" {
                
                sectionArray[1].append(employee)
            }else if employee[0] == "c" {
                
                sectionArray[2].append(employee)
            }else if employee[0] == "d" {
                
                sectionArray[3].append(employee)
            }else if employee[0] == "e" {
                
                sectionArray[4].append(employee)
            }else if employee[0] == "f" {
                
                sectionArray[5].append(employee)
            }else if employee[0] == "g" {
                
                sectionArray[6].append(employee)
            }else if employee[0] == "h" {
                
                sectionArray[7].append(employee)
            }else if employee[0] == "i" {
                
                sectionArray[8].append(employee)
            }else if employee[0] == "j" {
                
                sectionArray[9].append(employee)
            }else if employee[0] == "k" {
                
                sectionArray[10].append(employee)
            }else if employee[0] == "l" {
                
                sectionArray[11].append(employee)
            }else if employee[0] == "m" {
                
                sectionArray[12].append(employee)
            }else if employee[0] == "n" {
                
                sectionArray[13].append(employee)
            }else if employee[0] == "o" {
                
                sectionArray[14].append(employee)
            }else if employee[0] == "p" {
                
                sectionArray[15].append(employee)
            }else if employee[0] == "q" {
                
                sectionArray[16].append(employee)
            }else if employee[0] == "r" {
                
                sectionArray[17].append(employee)
            }else if employee[0] == "s" {
                
                sectionArray[18].append(employee)
            }else if employee[0] == "t" {
                
                sectionArray[19].append(employee)
            }else if employee[0] == "u" {
                
                sectionArray[20].append(employee)
            }else if employee[0] == "v" {
                
                sectionArray[21].append(employee)
            }else if employee[0] == "w" {
                
                sectionArray[22].append(employee)
            }else if employee[0] == "x" {
                
                sectionArray[23].append(employee)
            }else if employee[0] == "y" {
                
                sectionArray[24].append(employee)
            }else if employee[0] == "z" {
                
                sectionArray[25].append(employee)
            }
        
        
        
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return sectionIndex.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        var tempArray = sectionArray[section]
        
        return tempArray.count
    

    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionIndex[section]
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        
        
        return sectionIndex
        
    }
    
    override func tableView(tableView: UITableView, sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        return index
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        
        let cellBgColor: UIColor = UIColor(red: 54/255, green: 79/255, blue: 108/255, alpha: 1)
        
        cell.backgroundColor = cellBgColor
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        cell.textLabel?.font = UIFont (name: "HelveticaNeue-Light", size: 50)
        
        //cell.textLabel?.text = sortedEmployees[indexPath.row].capitalizedString
        
        var tempArray = [String]()
        
        tempArray = sectionArray[indexPath.section]
        
        cell.textLabel?.text = tempArray[indexPath.row].capitalizedString

        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        
        activeEmployee = returnPositionForThisIndexPath(indexPath, insideThisTable: currentTableView)
        
        return indexPath
    }
    
    func returnPositionForThisIndexPath(indexPath:NSIndexPath, insideThisTable theTable:UITableView)->Int{
        
        var i = 0
        var rowCount = 0
        
        while i < indexPath.section {
            
            rowCount += theTable.numberOfRowsInSection(i)
            
            i++
        }
        
        rowCount += indexPath.row
        
        return rowCount
    }
    

    
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
