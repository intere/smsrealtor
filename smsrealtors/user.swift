//
//  user.swift
//  smsrealtors
//
//  Created by Bill Banks on 2/23/16.
//  Copyright © 2016 Bill Banks. All rights reserved.
//

import Foundation
import MySqlSwiftNative

class user:NSObject, NSCoding {
    
    var user_id = 0
    var firstname: String!
    var lastname: String!
    var email: String!
    var pass: String!
    var cell, phone: String!
    var notfiy: Int!
    var company, address, city, state, zip, website: String!
    
    init(first: String, last: String, pass: String, emailx: String) {
        firstname = first
        lastname = last
        self.pass = pass
        self.email = emailx
    }
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.firstname = (aDecoder.decodeObjectForKey("firstnane") as? String)!
        self.lastname = (aDecoder.decodeObjectForKey("lastnane") as? String)!
         self.user_id = (aDecoder.decodeObjectForKey("user_id") as? Int)!
         self.pass = (aDecoder.decodeObjectForKey("pass") as? String)!
         self.email = (aDecoder.decodeObjectForKey("email") as? String)!
        self.notfiy = (aDecoder.decodeObjectForKey("notfiy") as? Int)!
        self.phone = (aDecoder.decodeObjectForKey("phone") as? String)!
        self.cell = (aDecoder.decodeObjectForKey("cell") as? String)!
        self.address = (aDecoder.decodeObjectForKey("address") as? String)!
        self.city = (aDecoder.decodeObjectForKey("city") as? String)!
        self.state = (aDecoder.decodeObjectForKey("state") as? String)!
        self.zip = (aDecoder.decodeObjectForKey("zip") as? String)!
        self.website = (aDecoder.decodeObjectForKey("website") as? String)!
        self.company = (aDecoder.decodeObjectForKey("company") as? String)!
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstname, forKey: "firstname")
        aCoder.encodeObject(self.lastname, forKey: "lastname")
        aCoder.encodeObject(self.pass, forKey: "pass")
        aCoder.encodeObject(self.email, forKey: "email")
        aCoder.encodeObject(self.user_id, forKey: "user_id")
        aCoder.encodeObject(self.phone, forKey: "phone")
        aCoder.encodeObject(self.cell, forKey: "cell")
        aCoder.encodeObject(self.notfiy, forKey: "notfiy")
        aCoder.encodeObject(self.address, forKey: "address")
        aCoder.encodeObject(self.city, forKey: "city")
        aCoder.encodeObject(self.state, forKey: "state")
        aCoder.encodeObject(self.zip, forKey: "zip")
        aCoder.encodeObject(self.website, forKey: "website")
        aCoder.encodeObject(self.company, forKey: "company")
    }
    
    func logon() -> Bool {
        
        opendb()
        
        do{
        let user = try conn.prepare("SELECT * FROM users WHERE email=? AND passwd=?")
            
            let res = try user.query([self.email, self.pass])
            let rowscount = try res.readRow()?.count
            if (rowscount != nil) {
                let row = try res.readRow()
                self.user_id  = (row!["user_id"] as? Int)!
                self.firstname = (row!["fname"] as? String)!
                self.lastname = (row!["lname"] as? String)!
                self.phone = (row!["phone"] as? String)!
                self.cell = (row!["cell"] as? String)!
                self.notfiy = (row!["notify"] as? Int)!
                self.address = (row!["address"] as? String)!
                self.city = (row!["city"] as? String)!
                self.state = (row!["state"] as? String)!
                self.zip = (row!["zip"] as? String)!
                self.website = (row!["website"] as? String)!
                self.company = (row!["company"] as? String)!

                
            }
        
        } catch (let err) {
            user_id = 0
        }
        return user_id != 0
    }
}