//
//  ViewController.swift
//  FBTest
//
//  Created by Ashwin Rajesh on 1/25/19.
//  Copyright © 2019 Ashwin Rajesh. All rights reserved.
//

import UIKit
import Firebase

var gUsername = ""
class ViewController: UIViewController {
    
    var login = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        login = true
        loginUsername.isHidden = true
    }
    
    var ref: DatabaseReference!

    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var loginUsername: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var invalid: UILabel!
    @IBOutlet weak var loginEmail: UITextField!
    
    @IBAction func changeSelect(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            viewTitle.text = "Login"
            login = true
            loginUsername.isHidden = true
        }
        if (sender.selectedSegmentIndex == 1) {
            viewTitle.text = "Signup"
            login = false
            loginUsername.isHidden = false
        }
    }
    
    
    @IBAction func next(_ sender: UIButton) {
        
        let email = loginEmail.text
        let username = loginUsername.text
        let pass = loginPassword.text
        
        if (login) {
            
            self.invalid.text = ""
            
            Auth.auth().signIn(withEmail: email!, password: pass!, completion: {user, error in
                if error == nil {
                    self.performSegue(withIdentifier: "goHome", sender: self)
                } else {
                    self.invalid.text = "Invalid email/password"
                }
            })
        
        } else {
            
            Auth.auth().createUser(withEmail: email!, password: pass!, completion: {user, error in
                if (error == nil) {
                    self.performSegue(withIdentifier: "goHome", sender: self)
                    /* self.ref = Database.database().reference()
                    self.ref.child("Users").child(username!).setValue(["Email": email!, "Password": pass!])
                    gUsername = username! */
                }
            })
        }
    }
    
}

