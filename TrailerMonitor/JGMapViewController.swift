//
//  LocationViewController.swift
//  TrailerMonitor
//
//  Created by Josh Gubler on 3/29/21.
//

import UIKit
import MapKit

class JGMapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    let annotation = MKPointAnnotation()
    let manager = CLLocationManager()
    var needsRecenter = false

    var location: JGLocation! {
        willSet {
            if self.location == nil {
                self.needsRecenter = true
            }
        }
        didSet {
            let coordinate = CLLocationCoordinate2D(latitude: self.location.lat!, longitude: self.location.lon!)
            self.annotation.coordinate = coordinate
            let accuracy = max(self.location.latErr, self.location.lonErr)
            self.annotation.title = String(format: "~ %.0f ft", accuracy)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.requestWhenInUseAuthorization()
        mapView.addAnnotation(self.annotation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if self.needsRecenter {
            self.recenterMap()
        }
    }
    
    @IBAction func recenterMap() {
        if let mapView = self.mapView {
            let coordinates = mapView.annotations.map(\.coordinate)
            var maxCoord = CLLocationCoordinate2D(latitude: -90.0, longitude: -180.0);
            var minCoord = CLLocationCoordinate2D(latitude: 90.0, longitude: 180.0);
            for coord in coordinates {
                if(coord.longitude > maxCoord.longitude) {
                    maxCoord.longitude = coord.longitude;
                }
                if(coord.latitude > maxCoord.latitude) {
                    maxCoord.latitude = coord.latitude;
                }
                if(coord.longitude < minCoord.longitude) {
                    minCoord.longitude = coord.longitude;
                }
                if(coord.latitude < minCoord.latitude) {
                    minCoord.latitude = coord.latitude;
                }
            }
            let centerLat = (minCoord.latitude + maxCoord.latitude) / 2.0
            let centerLon = (minCoord.longitude + maxCoord.longitude) / 2.0
            let latitudeDelta = maxCoord.latitude - minCoord.latitude
            let lonongitudeDelta = maxCoord.longitude - minCoord.longitude
            let latitudeBuffer = latitudeDelta * 0.2
            let longitudeBuffer = lonongitudeDelta * 0.2
            let center = CLLocationCoordinate2D(latitude: centerLat, longitude: centerLon)
            let span = MKCoordinateSpan(latitudeDelta: latitudeDelta + latitudeBuffer, longitudeDelta: lonongitudeDelta + longitudeBuffer)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
            self.needsRecenter = false
        }
    }
}
