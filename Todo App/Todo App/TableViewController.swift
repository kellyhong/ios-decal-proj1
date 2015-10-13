//
//  TableViewController.swift
//  Todo App
//
//  Created by Kelly Hong on 10/12/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var toDoItems:NSMutableArray = NSMutableArray();
    
    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)!
//    }
//    
//    override init(style: UITableViewStyle) {
//        super.init(style: style)
//    }
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        let itemListFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        if itemListFromUserDefaults != nil {
            toDoItems = itemListFromUserDefaults!
        }
        
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let toDoItem:NSDictionary = toDoItems.objectAtIndex(indexPath.row) as! NSDictionary
        cell.textLabel!.text = toDoItem.objectForKey("itemTitle") as? String
        
        // access the array by using the index of the row (indexPath) ->
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {

        if (segue != nil && segue!.identifier == "showDetail") {
            // create index path based on what was clicked
            let selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
            let detailViewController:DetailViewController = segue!.destinationViewController as! DetailViewController
            
            detailViewController.toDoData = toDoItems.objectAtIndex(selectedIndexPath.row) as! NSDictionary
            
        }
    }

}
