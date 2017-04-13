//
//  LoginViewController.swift
//  ChatClient
//
//  Created by Utkarsh Sengar on 4/12/17.
//  Copyright © 2017 Mohammed. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBAction func onLogin(_ sender: Any) {
        login()
    }

    @IBAction func onSignUp(_ sender: Any) {
        signup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func signup() {
        var user = PFUser()

        user.password = passwordTextField.text
        user.email = emailTextField.text
        user.username = emailTextField.text

        user.signUpInBackground { (success, error) in
            if let error = error {
                let alertController = UIAlertController.init(title: "SignUp", message: "Dude Signup", preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
            } else {

            }
        }
    }

    func login() {

        PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if user != nil {
                let chatViewController = ChatViewController()
                self.performSegue(withIdentifier: "ChatViewController", sender: self)
            } else {
                //show alert again
            }
        }

    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
