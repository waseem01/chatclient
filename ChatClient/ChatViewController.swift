//
//  ChatViewController.swift
//  ChatClient
//
//  Created by Waseem Mohd on 4/12/17.
//  Copyright © 2017 Mohammed. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var messageText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendMessage(_ sender: Any) {
        let message = PFObject(className: "Message")
        message["text"] = messageText.text

        message.saveInBackground { (success, error) in
            if success {
                print(message)
            } else {
                // error
            }
        }
    }

}
