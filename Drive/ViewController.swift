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
import AVFoundation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var previewView: UIImageView!
    var location:CLLocationManager!
    var mapCamera: MKMapCamera!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var stillImageOutput: AVCapturePhotoOutput?
    var session: AVCaptureSession?
    var direction = 0.0
    
    
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

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        session = AVCaptureSession()
        session!.sessionPreset = AVCaptureSessionPresetPhoto
        let backCamera = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var error: NSError?
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
            print(error!.localizedDescription)
        }
        
        if error == nil && session!.canAddInput(input) {
            session!.addInput(input)
            
            stillImageOutput = AVCapturePhotoOutput()
            
            if session!.canAddOutput(stillImageOutput) {
                session!.addOutput(stillImageOutput)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
                //videoPreviewLayer!.videoGravity = AVLayerVideoGravityResizeAspect
                //videoPreviewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                previewView.layer.addSublayer(videoPreviewLayer!)
                session!.startRunning()
                
            }
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        videoPreviewLayer!.frame = previewView.bounds
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

