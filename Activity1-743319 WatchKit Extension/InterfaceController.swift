
//  InterfaceController.swift
//  Activity1-743319 WatchKit Extension
//
//  Created by Simran Kaur Bal on 2019-10-25.
//  Copyright © 2019 Simran Kaur Bal. All rights reserved.


import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate
{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?)
    {
        
    }
    
     var messageCounter1:Int = 0
    @IBOutlet weak var msgfromPhoneLabel: WKInterfaceLabel!
    
    @IBOutlet weak var newmsgfromPhoneLabel: WKInterfaceLabel!
    
    @IBOutlet weak var sendMsgOutputLabel1: WKInterfaceLabel!
    
  // code for watch to phone
    @IBAction func sendmsgtophone(_ sender: Any) {
        print("Sending Message to Phone")
        if (WCSession.default.isReachable == true)
        {
            let message1 = ["name":"banana","color":"Yellow"]
//                as [String : Any]
            
            // send the message
            WCSession.default.sendMessage(message1, replyHandler: nil)
            messageCounter1 = messageCounter1 + 1
            sendMsgOutputLabel1.setText("Message Sent")
            
        }
                
            else {
                messageCounter1 = messageCounter1 + 1
                sendMsgOutputLabel1.setText("Message Cannot be sent")
            }
            
            
        }
        
    
    // code to recieve data from phone in watch
    
    // Function to receive DICTIONARY from the watch
    func session(_ session: WCSession, didReceiveMessage message: [String : Any])
    {
        // Output message to terminal
        print("WATCH: I received a message: \(message)")
        
         let name = message["name"] as! String
         let age = message["age"] as! String
         msgfromPhoneLabel.setText(name)
         newmsgfromPhoneLabel.setText(age)
    }
    
    override func awake(withContext context: Any?)
    {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print("Watch Loaded")
        
        if (WCSession.isSupported() == true)
        {
            msgfromPhoneLabel.setText("")
            
            // create a communication session with the phone
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else
        {
            msgfromPhoneLabel.setText("")
        }
        
        
    }
    
    
    override func didDeactivate()
    {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

}
