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
        
        locationManager.startRangingBeaconsInRegion(region)
        locationManager.startUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        
        print(beacons.filter{ $0.proximity != CLProximity.Unknown })
        
        if((beacons.filter{ $0.proximity != CLProximity.Unknown }).count > 0 ){
            self.view.backgroundColor = UIColor(red: 0/255.0, green: 234/255.0, blue: 108/255.0, alpha: 1)
        }else{
           self.view.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
        }
    }

    
}

