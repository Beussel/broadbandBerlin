//
//  MapViewController.swift
//  Belegarbeit
//
//  Created by Ali on 26.05.18.
//  Copyright © 2018 Ali. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var buttonBezirk: UIButton!
    var firstTime = true
    
    
    var bezirk: String = ""
    lazy var manager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        return locationManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBezirk.isEnabled = false
        buttonBezirk.layer.cornerRadius = 8.0
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        mapView.userTrackingMode = .follow
        self.mapView.camera.altitude = 10000
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if firstTime{
            CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
                if let placemarks = placemarks, let placemarkFirst = placemarks.first,  error == nil {
                    self.bezirk =  (placemarkFirst.subLocality ?? placemarkFirst.locality) ?? ""
                    self.buttonBezirk.setTitle(self.bezirk, for: .normal)
                    self.firstTime = false
                    self.buttonBezirk.isEnabled = true
                }
            }
        }
    }
    
    @IBAction func anzeigen(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nav = storyboard.instantiateViewController(withIdentifier: "navController")
        let vc = nav.childViewControllers[0] as! BezirkTableViewController
        vc.bezirk = bezirk
        self.present(nav, animated: true, completion: nil)
    }

}
