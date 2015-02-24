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
    
    
    let locationManager = CLLocationManager?()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "11111111-2222-3333-4444-555555555555"), major:1, minor:2 , identifier:"Number1")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager?.delegate = self
        if(CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse){
            locationManager?.requestWhenInUseAuthorization()
        }
        locationManager?.startRangingBeaconsInRegion(region)
        locationManager?.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        println("didRangeBeacon")
    }

    
}

