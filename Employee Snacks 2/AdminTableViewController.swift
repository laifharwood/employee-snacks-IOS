//
//  AdminTableViewController.swift
//  Employee Snacks 2
//
//  Created by Laif Harwood on 5/8/15.
//  Copyright (c) 2015 LaifHarwood. All rights reserved.
//

import UIKit

class AdminTableViewController: UITableViewController {

    @IBOutlet weak var periodCell: UITableViewCell!
    @IBOutlet weak var emailCell: UITableViewCell!
    @IBOutlet weak var employeeEditCell: UITableViewCell!
    @IBOutlet weak var changePasscodeCell: UITableViewCell!
    @IBOutlet weak var deleteData: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForNewPeriod()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        periodCell.textLabel!.text = "Pay Period Reports"
        emailCell.textLabel!.text = "Add/Delete Reporting Emails"
        employeeEditCell.textLabel!.text = "Add/Delete Employees"
        changePasscodeCell.textLabel!.text = "Change Passcode"
        
        deleteData.textLabel!.text = "Delete Past Reporting Data"
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 4 && indexPath.row == 0{
            
            let actionSheetController: UIAlertController = UIAlertController(title: "Please Confirm", message: "Are you sure you want to delete past reporting data?", preferredStyle: .Alert)
            
            //Create and add the Cancel action
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
                //Do some stuff
            }
            actionSheetController.addAction(cancelAction)
            //Create and an option action
            let nextAction: UIAlertAction = UIAlertAction(title: "Confirm", style: .Default) { action -> Void in
                //Do some other stuff
                
                charges = periodCharges
                updateCharges()
                chargeDates = periodChargeDates
                updateChargeDates()
                
                employeeDict = periodEmployeeDict
                updateEmployeeDict()
                
                
                //println("Confirmed")
            }
            actionSheetController.addAction(nextAction)
            
            //Present the AlertController
            self.presentViewController(actionSheetController, animated: true, completion: nil)
            
            
            }
            
        
        }
            
    
    

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
