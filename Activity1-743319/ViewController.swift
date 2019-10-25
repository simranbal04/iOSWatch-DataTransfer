//
//  ViewController.swift
//  Activity1-743319
//
//  Created by Simran Kaur Bal on 2019-10-25.
//  Copyright © 2019 Simran Kaur Bal. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate{
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    @IBOutlet weak var sendMsgOutputLabel: UILabel!
    
    @IBOutlet weak var connection: UILabel!
    
      var messageCounter:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" APP Is Working!")
        // Do any additional setup after loading the view.
    
        if (WCSession.isSupported() == true) {
            connection.text = "WC is supported!"
            
            // create a communication session with the watch
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            connection.text = "WC NOT supported!"
        }
    }
    
    
    @IBAction func sendMsgButton(_ sender: Any)
    {
        print("Sending Message to Watch")
        // code for sending message to WATCH
        if (WCSession.default.isReachable == true) {
            // Here is the message you want to send to the watch
            // All messages get sent as dictionaries
            let message = ["name":"pritesh","age":"20"] as [String : Any]
            
            // Send the message
            WCSession.default.sendMessage(message, replyHandler:nil)
            messageCounter = messageCounter + 1
            sendMsgOutputLabel.text = "Message Sent \(messageCounter)"
        }
            
        else {
            messageCounter = messageCounter + 1
            sendMsgOutputLabel.text = "Cannot reach watch! \(messageCounter)"
        }
        
    }
    

}

