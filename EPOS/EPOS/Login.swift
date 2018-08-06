//
//  Login.swift
//  EPOS
//
//  Created by Ratanak on 8/6/18.
//  Copyright © 2018 Ratanak. All rights reserved.
//

import UIKit
import RealmSwift

class Login: UIViewController {

    let admin = "admin"
    let adminPsw = "123456"
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var pswInput: UITextField!
    
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Realm DB: \(Realm.Configuration.defaultConfiguration.fileURL!)")
        realm = try! Realm()
        try! realm.write {
            realm.add(addUser)
        }
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if (userInput.text?.isEmpty)! || (pswInput.text?.isEmpty)! {
            return showAlert(title: "Login", message: "Please input Username and Password");
        }
    
        let user = realm.objects(User.self).filter("username = %@ AND password = %@",userInput.text!,pswInput.text!);
        if user.isEmpty {
            if userInput.text == admin && pswInput.text == adminPsw {
                isLogin()
            } else {
                showAlert(title: "Login", message: "Username and Password is incorrect")
            }
        } else {
            isLogin()
        }
    }
    
    @IBAction func forgetPsw(_ sender: Any) {
        
    }
    
    @IBAction func kh(_ sender: Any) {
    
    }
    
    @IBAction func eng(_ sender: Any) {
        
    }
    
    
    func isLogin() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated:true, completion: nil)
    }
    
     //Alert
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default) {action in})
        self.present(alertController, animated: true)
    }
}
