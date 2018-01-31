//
//  ContactListTableViewController.swift
//  Intro19
//
//  Created by SwiftiCode on 15/8/16.
//  Copyright © 2016 SwiftiCode. All rights reserved.
//
 
import UIKit

class ContactListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        loadSampleContact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactListCell", for: indexPath)

        // Configure the cell...
        let myContact = contactList[indexPath.row]
        
        cell.textLabel?.text = myContact.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let editContactDetailViewController = segue.destination as! ContactDetailViewController
        
        // Pass the selected object to the new view controller.
        if let selectedCell = sender as? UITableViewCell {
            
            let selectedIndexPath = tableView.indexPath(for: selectedCell)!
            let selectedContact = contactList[selectedIndexPath.row]
            editContactDetailViewController.detailContact = selectedContact
            
        }
        
    }
    

    @IBAction func editContactUnwindToContactList(_ segue: UIStoryboardSegue) {
        
        if let editContactViewController = segue.source as? ContactDetailViewController {
            
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            contactList[selectedIndexPath.row] = editContactViewController.detailContact!
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
            
            
        }
        
    }
    
}
