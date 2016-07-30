//
//  LocationsTableViewController.swift
//  SwiftLocationTriviaDelegates
//
//  Created by Henry Dinhofer on 7/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

extension LocationsTableViewController: AddLocationViewControllerDelegate {
    
    
    //Since I am taking on the responbility of being a delegate, I (LTVC) will define the methods for VCDidCancel
    // Now I am controlling the fate of AddLocationVC
    func addLocationViewControllerDidCancel(viewController: AddLocationViewController) {
        print("did cancel")
        viewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addLocationViewController(viewController: AddLocationViewController, shouldAllowLocationNamed name: String) -> Bool {
        
        var shouldAllow = true
        for location in self.locations {
            if location.name == name {
                shouldAllow = false
            }
        }
        return shouldAllow
    }
    
    
    func addLocationViewConntroller(viewController: AddLocationViewController, didAddLocationNamed name: String) {
        
        self.locations.append(Location(name: name, trivia: []))
        tableView.reloadData()
        viewController.dismissViewControllerAnimated(true, completion: nil)
    
    }
    

}


class LocationsTableViewController: UITableViewController {

    var locations : [Location] = []
    
//    weak var delegate : AddLocationViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locations.append(Location(name: "New York", trivia: []))
        locations.append(Location(name: "Toronto", trivia: []))
        locations.append(Location(name: "Philadelphia", trivia: []))
        
        tableView.reloadData()
        
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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return locations.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = locations[indexPath.row].name

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destinationVC = segue.destinationViewController as? AddLocationViewController
        destinationVC?.delegate = self
        
        //If I dont set the delegate here, the delegate methods won't be called in HERE LTVC
        //I dont do ^^ I wont receive the message
    }
    

}
