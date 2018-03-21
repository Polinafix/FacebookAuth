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
            case .success(grantedPermissions: _, declinedPermissions: _, token: _):
                
               // print(granted, declined, token)
                
                print("User logged in")
                self.getDetails()
                
            }
        }
    }
    
    //3. Once the user has successfully logged in
    func getDetails() {
        
        //check for the access token:
        guard let _ = AccessToken.current else{
            return
        }
        let params = ["fields":"name,email,gender,age_range"]
        
        let graphRequest = GraphRequest(graphPath: "me", parameters: params)
        graphRequest.start { (response, requestResult) in
            switch requestResult {
            case .failed(let error):
                print(error)
            case .success(response: let graphResponse):
                if let responseDictionary = graphResponse.dictionaryValue {
                    print(responseDictionary)
                }
            }
        }
    }
    
    

}

