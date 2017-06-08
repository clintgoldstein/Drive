//
//  ViewController.swift
//  Drive
//
//  Created by clinton goldstein on 6/7/17.
//  Copyright © 2017 clinton goldstein. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.delegate = self
        
        
    }

    @IBAction func ZoomIn(_ sender: Any) {
        //let userLocation = mapView.userLocation
        
        
        let mapCamera = MKMapCamera(lookingAtCenter: mapView.userLocation.location!.coordinate, fromDistance: 400.0, pitch: 90.0, heading: 0)
        mapView.setCamera(mapCamera, animated: true)
        
        //let region = MKCoordinateRegionMakeWithDistance(
          //  userLocation.location!.coordinate, 2000, 2000)
        
        //mapView.setRegion(region, animated: true)
       
    }

    func mapView(_ mapView: MKMapView, didUpdate
        userLocation: MKUserLocation) {
        //mapView.centerCoordinate = userLocation.location!.coordinate
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation.location!.coordinate, 2000, 2000)
        
        mapView.setRegion(region, animated: true)
    }
}

