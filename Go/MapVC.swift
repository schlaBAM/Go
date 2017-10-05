//
//  ViewController.swift
//  Go
//
//  Created by BAM on 2017-10-04.
//  Copyright © 2017 BAM. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var updateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            print("User allowed location")
            mapView.showsUserLocation = true
            locationManager.stopUpdatingLocation()

        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if updateCount < 3 {
            let region = MKCoordinateRegionMakeWithDistance((manager.location?.coordinate)!, 1000, 1000)
            mapView.setRegion(region, animated: false)
            updateCount += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("You got a memory issue mafucka")
    }


}

