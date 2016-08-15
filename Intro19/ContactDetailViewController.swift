//
//  ContactDetailViewController.swift
//  Intro19
//
//  Created by SwiftiCode on 15/8/16.
//  Copyright © 2016 SwiftiCode. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var contactNameTextField: UITextField!
    @IBOutlet weak var contactPhoneTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var detailContact: Contact?

    // MARK: Template
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Check if there is any contact pass from the table view 
        if let gotContactToEdit = detailContact {
            
            contactNameTextField.text = gotContactToEdit.name
            contactPhoneTextField.text = gotContactToEdit.phone
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if sender === saveButton {
            
            var myName: String
            
            let nameCheck = contactNameTextField.text ?? ""
            
            if nameCheck.isEmpty {
                
                myName = "No Name"
                
            } else {
                
                myName = nameCheck
                
            }
            
            
            let myPhone = contactPhoneTextField.text ?? ""
            
            detailContact = Contact(name: myName, phone: myPhone)
            
        }
        
        
    }
    

}
