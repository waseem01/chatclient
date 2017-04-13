//
//  ChatViewController.swift
//  ChatClient
//
//  Created by Waseem Mohd on 4/12/17.
//  Copyright © 2017 Mohammed. All rights reserved.
//

import UIKit
import Parse


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var messages = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimerRefresh), userInfo: nil, repeats: true)
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
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        let m = messages[indexPath.row]
        cell.textLabel?.text = m["text"]
        
        return cell
    }
    
    func onTimerRefresh() {
        let query = PFQuery(className:"Message")
        query.findObjectsInBackground { (message, error) in
            if error == nil {
                for obj in message! {
                    if let m = obj["text"] {
                        self.messages.append(m as AnyObject)
                    }
                }
                
                self.messages.sort(by: {$0.text < $1.text})
                self.tableView.reloadData()
            } else {
                
            }
        }

    }
}
