//
//  WelcomeViewController.swift
//  FBTest
//
//  Created by Ashwin Rajesh on 2/19/19.
//  Copyright © 2019 Ashwin Rajesh. All rights reserved.
//

import UIKit
import Firebase

class WelcomeViewController: UIViewController {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var welcome: UILabel!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*ref = Database.database().reference()
        ref.child("Users").child(gUsername).observe(.value, with: {(data) in
            let user = data.value as! NSDictionary
            let userEmail = user["email"] as! String
            self.welcome.text = "Welcome " + gUsername
            //self.email.text = userEmail
        })*/
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
