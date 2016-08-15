//
//  ContactData.swift
//  Intro19
//
//  Created by SwiftiCode on 15/8/16.
//  Copyright © 2016 SwiftiCode. All rights reserved.
//

import Foundation

// MARK: Data Structure
struct Contact {
    var name: String
    var phone: String
}

// MARK: Data Variables
var contactList = [Contact]()


// MARK: Helper program to load sample data
func loadSampleContact() {
    
    let contact1 = Contact(name: "Name of Contact1", phone: "123")
    let contact2 = Contact(name: "Name of Contact2", phone: "456")
    let contact3 = Contact(name: "Name of Contact3", phone: "789")
    
    contactList += [contact1, contact2, contact3]
    
}
