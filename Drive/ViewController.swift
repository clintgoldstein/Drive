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

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    var location:CLLocationManager!
    var mapCamera: MKMapCamera!
    var direction = 0.0
    var camera_set = false
    var newMedia: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = CLLocationManager()
        location.startUpdatingLocation()
        location.delegate = self
        location.startUpdatingHeading()
        
        mapView.showsUserLocation = true
        mapView.showsTraffic = false
        mapView.delegate = self
        
        
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        
        
    }
    

    @IBAction func ZoomIn(_ sender: Any) {
       
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        
        /*
        let mapCamera = MKMapCamera(lookingAtCenter: mapView.userLocation.location!.coordinate, fromDistance: 400.0, pitch: 90.0, heading: direction)
        mapView.setCamera(mapCamera, animated: false)
        
        camera_set = true
        */
    }

    
    
    
    
/******************************************************************
 **         methods used attemting pitched follow                **
 ******************************************************************
    
 func mapView(_ mapView: MKMapView, didUpdate
        userLocation: MKUserLocation) {
        //  self.mapView.setCenter((userLocation.location?.coordinate)!, animated: true)
        if mapView.userLocation.location?.coordinate != nil
        {
        let mapCamera = MKMapCamera(lookingAtCenter: mapView.userLocation.location!.coordinate, fromDistance: 400.0, pitch: 90.0, heading: direction)
        mapView.setCamera(mapCamera, animated: false)
        }
    }


    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
       direction = newHeading.magneticHeading
       //self.mapView.camera.heading = newHeading.magneticHeading
    }

     
*/
    
    
    
 
}

