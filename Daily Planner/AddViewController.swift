//
//  AddViewController.swift
//  Daily Planner
//
//  Created by Rika on 11/16/14.
//  Copyright (c) 2014 superz. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField! = UITextField()
    @IBOutlet weak var detailsTextView: UITextView! = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        println("button tapped")
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var itemList:NSMutableArray? = userDefaults.objectForKey("list") as? NSMutableArray

        var dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(taskTextField.text, forKey: "task")
        dataSet.setObject(detailsTextView.text, forKey: "details")
        
        if (itemList != nil){
            var newMutableList:NSMutableArray = NSMutableArray()
            for dict:AnyObject in itemList!{
                newMutableList.addObject(dict as NSDictionary)
            }
            userDefaults.removeObjectForKey("list")
            newMutableList.addObject(dataSet)
            userDefaults.setObject(newMutableList, forKey: "list")
        }else{
            itemList = NSMutableArray()
            itemList!.addObject(dataSet)
            userDefaults.setObject(itemList, forKey: "list")
        }
        
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
 
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
