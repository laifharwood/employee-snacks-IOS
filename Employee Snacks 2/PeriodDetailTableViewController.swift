//
//  PeriodDetailTableViewController.swift
//  
//
//  Created by Laif Harwood on 5/8/15.
//
//

import UIKit
import MessageUI


var toRecipients = [String]()


class PeriodDetailTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    
    @IBAction func emailButton(sender: AnyObject) {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        var picker = MFMailComposeViewController()
        picker.mailComposeDelegate = self
        
        var subject = "Employee Snacks" + " " + formatter.stringFromDate(periodStartDates[activePeriod]) + " " + "-" + " " + formatter.stringFromDate(periodEndDates[activePeriod])
        
        var body = ""
        
        
        
        
        var datesIndexes = [Int]()
        var totals = [Double]()
        for dates in chargeDates{
            if (dates.isGreaterThanDate(periodStartDates[activePeriod])) && (dates.isLessThanDate(periodEndDates[activePeriod])){
                var x = find(chargeDates, dates)
                datesIndexes.append(x!)
            }
        }
        for employee in sortedEmployees{
            var employeeTotal = Double()
            var employeeIndexes = [Int]()
            employeeIndexes = employeeDict[employee] as [Int]!
            for indexes in datesIndexes{
                if contains(employeeIndexes, indexes){
                    employeeTotal = round(100 * (employeeTotal + charges[indexes])) / 100
                }
            }
            totals.append(employeeTotal)
            
            let returnNow = "\n"
            
            body += employee.capitalizedString + " " + "-" + " " + "\(employeeTotal)" + returnNow
            
        }
        
        picker.setSubject(subject)
        
        picker.setToRecipients(toRecipients)
        
        picker.setMessageBody(body, isHTML: false)
        
        presentViewController(picker, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkForNewPeriod()
        
        //subject.delegate = self
        //body.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return sortedEmployees.count
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("periodDetailCell", forIndexPath: indexPath) as! CustomCell

        // Configure the cell...
        
        cell.nameLabel.text = sortedEmployees[indexPath.row].capitalizedString
        
        var datesIndexes = [Int]()
        var totals = [Double]()
        for dates in chargeDates{
            if (dates.isGreaterThanDate(periodStartDates[activePeriod])) && (dates.isLessThanDate(periodEndDates[activePeriod])){
                var x = find(chargeDates, dates)
                datesIndexes.append(x!)
            }
        }
        for employee in sortedEmployees{
            var employeeTotal = Double()
            var employeeIndexes = [Int]()
            employeeIndexes = employeeDict[employee] as [Int]!
                for indexes in datesIndexes{
                    if contains(employeeIndexes, indexes){
                        employeeTotal = round(100 * (employeeTotal + charges[indexes])) / 100
                    }
                }
        totals.append(employeeTotal)
        }
        cell.totalLabel.text = "\(totals[indexPath.row])"
        return cell
    }
    

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
