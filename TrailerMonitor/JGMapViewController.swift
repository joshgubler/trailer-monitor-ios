//
//  LocationViewController.swift
//  TrailerMonitor
//
//  Created by Josh Gubler on 3/29/21.
//

import UIKit
import MapKit

class JGMapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    let annotation = MKPointAnnotation()
    let manager = CLLocationManager()
    var needsRecenter = false

    var location: JGLocation! {
        willSet {
            if location == nil {
                needsRecenter = true
            }
        }
        didSet {
            let coordinate = CLLocationCoordinate2D(latitude: location.lat!, longitude: location.lon!)
            annotation.coordinate = coordinate
            let accuracy = max(location.latErr, location.lonErr)
            annotation.title = String(format: "~ %.0f ft", accuracy)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.requestWhenInUseAuthorization()
        mapView.addAnnotation(annotation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if needsRecenter {
            recenterMap()
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if view == mapView.view(for: annotation) {
            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
                let url = URL(string:"comgooglemaps://?daddr=\(location.lat!),\(location.lon!)&directionsmode=driving")!
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                mapView.deselectAnnotation(annotation, animated: true)
            } else {
              print("Can't use comgooglemaps://");
            }
        }
    }
    
    @IBAction func recenterMap() {
        if let mapView = mapView {
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
            needsRecenter = false
        }
    }
}
