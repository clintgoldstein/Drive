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

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var location:CLLocationManager!
    var mapCamera: MKMapCamera!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = CLLocationManager()
        location.startUpdatingLocation()
        location.delegate = self
        location.startUpdatingHeading()
        
        mapView.showsUserLocation = true
        mapView.showsCompass = false
        mapView.delegate = self
     
        
       mapCamera = MKMapCamera()
       mapCamera.pitch = 90.0
       mapCamera.altitude = 300.0
        
       mapView.setCamera(mapCamera, animated: true)
        
      //mapView.setUserTrackingMode(.followWithHeading, animated: true)

    }

    @IBAction func ZoomIn(_ sender: Any) {
        
        
        let mapCamera = MKMapCamera(lookingAtCenter: mapView.userLocation.location!.coordinate, fromDistance: 400.0, pitch: 90.0, heading: self.mapView.camera.heading)
        
        mapView.setCamera(mapCamera, animated: false)
        
       
    }

    func mapView(_ mapView: MKMapView, didUpdate
        userLocation: MKUserLocation) {
        
        if mapView.userLocation.location?.coordinate != nil
        {
        let mapCamera = MKMapCamera(lookingAtCenter: mapView.userLocation.location!.coordinate, fromDistance: 400.0, pitch: 90.0, heading: self.mapView.camera.heading)
        
        mapView.setCamera(mapCamera, animated: true)
        }
    }

 

    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        self.mapView.camera.heading = newHeading.trueHeading
        /*
        if mapView.userLocation.location?.coordinate != nil
        {
            let mapCamera = MKMapCamera(lookingAtCenter: mapView.userLocation.location!.coordinate, fromDistance: 400.0, pitch: 90.0, heading: self.mapView.camera.heading)
            
            mapView.setCamera(mapCamera, animated: false)
        }
        */
    }
    
    
    
    
 
}

