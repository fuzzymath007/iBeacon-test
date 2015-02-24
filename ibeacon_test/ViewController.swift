//
//  ViewController.swift
//  ibeacon_test
//
//  Created by Matthew Chess on 2/23/15.
//  Copyright (c) 2015 Matthew Chess. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "E2C56DB5-DFFB-48D2-B060-D0F5A71096E0"), major:1, minor:2 , identifier:"Number1")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
       
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startMonitoringForRegion(region)
        locationManager.startRangingBeaconsInRegion(region)
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        
        print(beacons.filter{ $0.proximity != CLProximity.Unknown })
       
        var message:String = ""
        
        if(beacons.count > 0){
            let nearestBeacon:CLBeacon = beacons[0] as CLBeacon
            
            switch nearestBeacon.proximity{
            case CLProximity.Far: message = "Even I can not find your keys"
            case CLProximity.Near: message = "You are close to your keys"
            case CLProximity.Immediate: message = "You have your keys"
            case CLProximity.Unknown:
                return
            }
        }else{
            message = "Even I can not find your keys"
        }
        
        print(message)
        
        sendLocalNotificationWithMessage(message)
        
    }
    
    func sendLocalNotificationWithMessage(message: String!){
        let notification:UILocalNotification = UILocalNotification()
        notification.alertBody = message
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }

}

