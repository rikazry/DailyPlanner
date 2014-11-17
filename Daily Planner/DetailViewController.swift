//
//  DetailViewController.swift
//  Daily Planner
//
//  Created by Rika on 11/16/14.
//  Copyright (c) 2014 superz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    
    var data:NSDictionary = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTextField.userInteractionEnabled = false
        detailsTextView.userInteractionEnabled = false
        
        taskTextField.text = data.objectForKey("task") as String
        detailsTextView.text = data.objectForKey("details") as String

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteTaskTapped(sender: AnyObject) {
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListArray:NSMutableArray = userDefaults.objectForKey("list") as NSMutableArray
        
        var mutableItemList:NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray{
            mutableItemList.addObject(dict as NSDictionary)
        }
        
        mutableItemList.removeObject(data)
        
        userDefaults.removeObjectForKey("list")
        userDefaults.setObject(mutableItemList, forKey: "list")
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
