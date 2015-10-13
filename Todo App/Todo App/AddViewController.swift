//
//  ViewController.swift
//  Todo App
//
//  Created by Kelly Hong on 10/12/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addButtonTapped(sender: AnyObject) {
        
        let userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(titleTextField.text!, forKey: "itemTitle")
        dataSet.setObject(notesTextField.text, forKey: "itemNote")
        
        if ((itemList) != nil) { // data already available
            
            let newMutableList:NSMutableArray = NSMutableArray() // make a new list
            
            for dict:AnyObject in itemList! { // iterate through itemList
                newMutableList.addObject(dict as! NSDictionary) // add dictionaries to new list
            }
            
            userDefaults.removeObjectForKey("itemList") // remove the previous old itemList from userDefaults
            newMutableList.addObject(dataSet) // add the new dataset object to new mutable list
            userDefaults.setObject(newMutableList, forKey: "itemList") // save new mutable list to userdefaults
            
        } else { // first todo item on the list
            userDefaults.removeObjectForKey("itemList")
            itemList = NSMutableArray() // initiailize itemList
            itemList!.addObject(dataSet) // added dataset 
            userDefaults.setObject(itemList, forKey: "itemList")
        }
        
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
}

