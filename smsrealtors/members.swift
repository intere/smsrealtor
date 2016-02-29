//
//  members.swift
//  smsrealtors
//
//  Created by Bill Banks on 2/26/16.
//  Copyright © 2016 Bill Banks. All rights reserved.
//

import Foundation
import MySqlSwiftNative

class members {
    
    var member_id: Int!
    var user_id: Int!
    var name: String!
    var cell: String!
    var opin: Int!
    
    init(member_id: Int, user_id: Int, name: String, cell: String, opin: Int) {
        self.member_id = member_id
        self.user_id = user_id
        self.name = name
        self.cell = cell
        self.opin = opin
        
    }
    
    func load() {
        opendb()
        do {
            let select_stmt = try conn.prepare("SELECT * FROM members WHERE member_id=?")
            let res =  try select_stmt.query([member_id])
            let row = try res.readRow()
            
            self.user_id = (row!["user_id"] as? Int)
            self.opin = (row!["optin"] as? Int)
            self.name = (row!["name"] as? String)
            self.cell = (row!["cell"] as? String)
        
        } catch (let err as NSError) {
            print(err.debugDescription)
        }
        closedb()
        
    }
    
    func save(usr: user) {
        opendb()
        
        do {
            if usr.user_id != 0 {
                // user is loged in
                if self.member_id == 0 {
                    // insert
                    let ins_smt = try conn.prepare("INSERT INTO members(name, cell, optin) VALUE (?,?,?)")
                    try ins_smt.exec([self.name, self.cell, self.opin])
                }
            }
            
        } catch (let err as NSError) {
            print(err.debugDescription)
        }
        
        closedb()
        
    }
    
}