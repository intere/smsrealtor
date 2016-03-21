//
//  registerVC.swift
//  smsrealtors
//
//  Created by Bill Banks on 3/21/16.
//  Copyright © 2016 Bill Banks. All rights reserved.
//

import UIKit

class registerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var fnameTXT: UITextField!
    @IBOutlet var lnameTXT: UITextField!
    @IBOutlet var passTXT: UITextField!
    @IBOutlet var companyTXT: UITextField!
    @IBOutlet var emailTXT: UITextField!
    @IBOutlet var addressTXT: UITextField!
    @IBOutlet var cityTXT: UITextField!
    @IBOutlet var stateTXT: UITextField!
    @IBOutlet var zipTXT: UITextField!
    @IBOutlet var phoneTXT: UITextField!
    @IBOutlet var cellTXT: UITextField!
    @IBOutlet var notifyPIC: UIPickerView!
    @IBOutlet var websiteTXT: UITextField!
    
    
    
    var notifydata = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        notifydata = ["None","Email","Cell","Both"]
        
        notifyPIC.dataSource = self
        notifyPIC.delegate = self
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidLoad()
        
        if userdata.user_id !=  0 {
            fnameTXT.text = userdata.firstname
            lnameTXT.text = userdata.lastname
            passTXT.text = userdata.pass
            companyTXT.text = userdata.company
            emailTXT.text = userdata.email
            addressTXT.text = userdata.address
            cityTXT.text = userdata.city
            stateTXT.text = userdata.state
            zipTXT.text = userdata.zip
            phoneTXT.text = userdata.phone
            cellTXT.text = userdata.cell
            websiteTXT.text = userdata.website
            
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return notifydata.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return notifydata[row]
    }
    
    @IBAction func signupBUT(sender: AnyObject) {
        if fnameTXT.text != "" && lnameTXT.text != "" && emailTXT.text != "" && passTXT.text != "" && phoneTXT.text != "" && cellTXT.text != "" {
            if userdata.user_id == 0 {
                userdata.firstname = fnameTXT.text
                userdata.lastname = lnameTXT.text
                userdata.pass = passTXT.text
                userdata.company = companyTXT.text
                userdata.email = emailTXT.text
                userdata.address = addressTXT.text
                userdata.city = cityTXT.text
                userdata.state = stateTXT.text
                userdata.zip = zipTXT.text
                userdata.phone = phoneTXT.text
                userdata.cell = cellTXT.text
                userdata.website = websiteTXT.text
                    if !userdata.save() {
                        self.showerror("Save error", message: "There is an error in saving. You are not registered.")
                    }  else {
                            self.navigationController?.popViewControllerAnimated(true)
                }
            }
        } else {
            self.showerror("BAD INPUT", message: "You must enter in *field")
        }
    }
    
    func showerror(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default,  handler: nil )
        alert.addAction(action)
        presentViewController(alert, animated: true, completion:  nil)
    }
    
    
}
