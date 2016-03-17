//
//  memberVC.swift
//  smsrealtors
//
//  Created by Bill Banks on 3/17/16.
//  Copyright © 2016 Bill Banks. All rights reserved.
//

import UIKit

class memberVC: UIViewController {
    
    @IBOutlet var nameTXT: UITextField!
    
    @IBOutlet var cellTXT: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if  userdata.user_id == 0 {
            self.showerror("Login", message: "You must be logged in")
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    @IBAction func addBUT(sender: AnyObject) {
        
        if nameTXT.text != "" && cellTXT.text != "" {
                   let addmember = members(member_id: 0, user_id: userdata.user_id, name: nameTXT.text!
         , cell: cellTXT.text!, opin: 0)
            addmember.save(userdata)
                self.navigationController?.popViewControllerAnimated(true)
        } else {
            self.showerror("Bad Input", message: "Name and Cell must be entered")
            
        }
        
    }
    
    
    func showerror(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default,  handler: nil )
        alert.addAction(action)
        presentViewController(alert, animated: true, completion:  nil)
    }
    
    
    
}
