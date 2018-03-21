//
//  ViewController.swift
//  FacebookAuth
//
//  Created by Polina Fiksson on 19/03/2018.
//  Copyright © 2018 PolinaFiksson. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class ViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginWithFacebook(_ sender: UIButton) {
        //1
        let loginManager = LoginManager()
        //2
        loginManager.logIn(readPermissions: [.publicProfile,.email, .userFriends], viewController: self) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("The user cancelled login")
            case .success(grantedPermissions:let granted, declinedPermissions:let declined, token: let token):
                
                print(granted, declined, token)
                
                print("User logged in")
                
            }
        }
    }
    

}

