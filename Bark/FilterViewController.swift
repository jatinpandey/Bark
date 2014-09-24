//
//  FilterViewController.swift
//  Bark
//
//  Created by Jatin Pandey on 9/21/14.
//  Copyright (c) 2014 Jatin Pandey. All rights reserved.
//

import UIKit

class FilterViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    var showCategory = false
    var showRadius = false
    var showSort = false
    var showDrop = [false, false, false]
    let sectHeading = ["Deals", "Sort", "Radius", "Category"]

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if section == 0 {
            return 1
        }
        else if section <= 3 {
            if showDrop[section - 1] {
                return 3
            }
            else {
                return 0
            }
        }
        else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("Switcher") as SwitcherCell
            cell.switchLabel.text = "Deals"
            return cell
        }
        else if section == 1 {
            var cell = tableView.dequeueReusableCellWithIdentifier("Dropper") as DropperCell
            cell.dropLabel.text = "Sort"
            return cell
        }
        else if section == 2 {
            var cell = tableView.dequeueReusableCellWithIdentifier("Dropper") as DropperCell
            cell.dropLabel.text = "Radius"
            return cell
        }
        else if section == 3 {
                var cell = tableView.dequeueReusableCellWithIdentifier("Dropper") as DropperCell
                cell.dropLabel.text = "Category"
                return cell
        }
        else {
            return UITableViewCell()
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 100))
        
        headerView.backgroundColor = UIColor.blackColor()
        headerView.textColor = UIColor(white: 0.8, alpha: 0.8)
        headerView.text = sectHeading[section]
        headerView.textAlignment = NSTextAlignment.Center
        return headerView
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
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
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
