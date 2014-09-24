//
//  ResultController.swift
//  Bark
//
//  Created by Jatin Pandey on 9/18/14.
//  Copyright (c) 2014 Jatin Pandey. All rights reserved.
//

import UIKit

let yelpConsumerKey = "-VxR4WiC3nb2ukZYr2lKbg"
let yelpConsumerSecret = "ClqGh0jmfFo0p83pWoMY2djR02I"
let yelpToken = "E32oSJKHb_41EZ9hI6YT_Q8fIpGqo59b"
let yelpTokenSecret = "jm36oVfgK_R5bNSBV-YWJN12Tn0"

class ResultController: UITableViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet var resultTableView: UITableView!
    var client: YelpClient!
    var places: [NSDictionary]! = [] //[{"name": "Hi this is the name of the place super big place and place and place name restaurant"}]
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        var navSearchBar = UISearchBar()
        navSearchBar.delegate = self
        self.navigationItem.titleView = navSearchBar
        let filterButton = UIBarButtonItem()
        filterButton.title = "Filter"
        self.navigationItem.leftBarButtonItem = filterButton

        self.tableView.rowHeight = UITableViewAutomaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCellWithIdentifier("ResultCell") as ResultCell
        cell.layoutIfNeeded()

        //CGSize size = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)

        var size = cell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize)
        return size.height + 100
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        var query = searchBar.text
        println("Searching")
        client = YelpClient(consumerKey: yelpConsumerKey, consumerSecret: yelpConsumerSecret, accessToken: yelpToken, accessSecret: yelpTokenSecret)
        
        client.searchWithTerm(query, success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            //println(response["businesses"])
            self.places = response["businesses"] as [NSDictionary]

            }) { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                println(error)
        }
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    // MARK: - Table view data source
/*
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UILabel(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        
        headerView.backgroundColor = UIColor.blackColor()
        headerView.textColor = UIColor(white: 0.8, alpha: 0.8)
        headerView.text = "Dis is section \(section + 1)"
        headerView.textAlignment = NSTextAlignment.Center
        return headerView
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
*/  
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("Num rows")
        return places.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        println("row \(indexPath.row)")
        let cell = tableView.dequeueReusableCellWithIdentifier("ResultCell") as ResultCell
        var place = places[indexPath.row]
        let img_url = place["image_url"] as String
        cell.descLabel.text = place["name"] as? String
        cell.descLabel.text = "Hi this is the name of the place super big place and place and place name restaurant "
        cell.picture.setImageWithURL(NSURL(string: img_url))
        return cell
    }
    
    @IBAction func onSearch(sender: AnyObject) {
        resultTableView.reloadData()
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
