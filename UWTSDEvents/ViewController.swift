//
//  ViewController.swift
//  UWTSDEvents
//
//  Created by Sophie Novak on 09/05/2018.
//  Copyright © 2018 Sophie Novak. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBAction func unwindtoVC(segue: UIStoryboardSegue){
        
    }
    
    @IBOutlet weak var permissionButton: UIButton!
    @IBAction func notificationButton(_ sender: Any) {
        let reg=UNUserNotificationCenter.current()
        reg.requestAuthorization(options: [.alert, .badge, .sound]){ (granted,error)in
            if granted{
                self.permissionButton.isHidden=true
            
            }
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
