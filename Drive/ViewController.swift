//
//  ViewController.swift
//  Drive
//
//  Created by clinton goldstein on 6/7/17.
//  Copyright © 2017 clinton goldstein. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true

        
    }

    @IBAction func ZoomIn(_ sender: Any) {
    }

    @IBAction func changeMapView(_ sender: Any) {
    }
}

