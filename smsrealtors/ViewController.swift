//
//  ViewController.swift
//  smsrealtors
//
//  Created by Bill Banks on 2/22/16.
//  Copyright © 2016 Bill Banks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userdata: user!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginclick(sender: AnyObject) {
             performSegueWithIdentifier("loadlogon", sender: nil)
    }

}

