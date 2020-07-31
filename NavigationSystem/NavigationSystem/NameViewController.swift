//
//  NameViewController.swift
//  NavigationSystem
//
//  Created by Chathura Wijekoon on 7/30/20.
//  Copyright © 2020 Chathura Wijekoon. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var fullName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.text = fullName?.components(separatedBy: " ")[0]
        lastNameTextField.text = fullName?.components(separatedBy: " ")[1]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
