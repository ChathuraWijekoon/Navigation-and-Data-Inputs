//
//  ViewController.swift
//  NavigationSystem
//
//  Created by Chathura Wijekoon on 7/30/20.
//  Copyright © 2020 Chathura Wijekoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tblViewUsers: UITableView!
    var names = ["Brent Berg", "Cody Preston", "Kareem Dixon", "Xander Clark",
    "Francis Frederick", "Carson Hopkins", "Anthony Nguyen", "Dean Franklin",
    "Jeremy Davenport", "Rigel Bradford", "John Ball", "Zachery Norman",
    "Valentine Lindsey", "Slade Thornton", "Jelani Dickson", "Vance Hurley",
    "Wayne Ellison", "Kasimir Mueller", "Emery Pruitt", "Lucius Lawrence",
    "Kenneth Mendez"]
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNameControllerSegue" {
            let cell = sender as! UITableViewCell
            
            if let indexPath = tblViewUsers.indexPath(for: cell){
                let nameController = segue.destination as! NameViewController; nameController.fullName = names[indexPath.row]
                tblViewUsers.deselectRow(at: indexPath, animated: true)
                selectedIndexPath = indexPath
            }
        }
    }

    @IBAction func saveName(segue: UIStoryboardSegue){
        let nameContoller = segue.source as! NameViewController
        let name = nameContoller.firstNameTextField.text! + " " + nameContoller.lastNameTextField.text!
        
        if let indexPath = selectedIndexPath {
            names[indexPath.row] = name
            tblViewUsers.reloadRows(at: [indexPath], with:  .automatic)
            selectedIndexPath = nil
        }
    }
    
}

