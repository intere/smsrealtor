//
//  loginVC.swift
//  smsrealtors
//
//  Created by Bill Banks on 2/24/16.
//  Copyright © 2016 Bill Banks. All rights reserved.
//

import UIKit

class loginVC: UIViewController {
    
    var usr: user!
    
    @IBOutlet var logonLB: UILabel!
    
    @IBOutlet var emailTXT: UITextField!
    
    @IBOutlet var passwordTXT: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func logon_click(sender: AnyObject) {
        if emailTXT.text != nil && passwordTXT.text != nil {
            usr = user(pass: passwordTXT.text!, emailx: emailTXT.text!)
            if usr.logon() {
              performSegueWithIdentifier("gohome", sender: usr)
            }
            
            
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "gohome" {
            
            if let homevc =  segue.destinationViewController as? ViewController {
                homevc.userdata = sender as! user
                
            }
            
        }
        
    }
    
    
}
