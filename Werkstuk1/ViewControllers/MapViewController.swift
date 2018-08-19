//
//  MapViewController.swift
//  Werkstuk1
//
//  Created by Felix Struelens on 17/08/18.
//  Copyright © 2018 Felix Struelens. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var personnages = [Personnage]()
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Dale = Personnage(photo: "Cooper", firstName: "Dale", name: "Cooper", telephone: "049484448", address: "The Great Northern Hotel, 6501 Railroad Ave, WA 98065, Twin Peaks", latitude: 47.542346, longitude: -121.836736)
        let Laura = Personnage(photo: "Laura", firstName: "Laura", name: "Palmer", telephone: "045532349", address: "Palmer House, 708 33rd St, WA 98065, Twin Peaks", latitude: 47.973809, longitude: -122.220675)
        let Leland = Personnage(photo: "Leland", firstName: "Leland", name: "Palmer", telephone: "049247345", address: "Palmer House, 708 33rd St, WA 98065, Twin Peaks", latitude: 47.973809, longitude: -122.220675)
        let Sarah = Personnage(photo: "Sarah", firstName: "Sarah", name: "Palmer", telephone: "045131973", address: "Palmer House, 708 33rd St, WA 98065, Twin Peaks", latitude: 47.973809, longitude: -122.220675)
        let Audrey = Personnage(photo: "Audrey", firstName: "Audrey", name: "Horne", telephone: "045526965", address: "The Great Northern Hotel, 6501 Railroad Ave, WA 98065, Twin Peaks", latitude: 47.542346, longitude: -121.836736)
        let Ben = Personnage(photo: "Ben", firstName: "Ben", name: "Horne", telephone: "048313259", address: "The Great Northern Hotel, 6501 Railroad Ave, WA 98065, Twin Peaks", latitude: 47.542346, longitude: -121.836736)
        let Harry = Personnage(photo: "Harry", firstName: "Harry", name: "Truman", telephone: "048313249", address: "Twin Peaks Police Dept., 7001 396th Dr SE, WA 98065, Twin Peaks", latitude: 47.538197, longitude: -121.811535)
        let Bobby = Personnage(photo: "Bobby", firstName: "Bobby", name: "Briggs", telephone: "048313299", address: "RR Diner, 137 W North Bend Way, WA 98045-8150, Twin Peaks", latitude: 47.495324, longitude: -121.786832)
        let Shelly = Personnage(photo: "Shelly", firstName: "Shelly", name: "Johnson", telephone: "048313289", address: "RR Diner, 137 W North Bend Way, WA 98045-8150, Twin Peaks", latitude: 47.495324, longitude: -121.786832)
        let Leo = Personnage(photo: "Leo", firstName: "Leo", name: "Johnson", telephone: "048313279", address: "Johnson House, 8304 372nd Pl, SEWA 98065, Twin Peaks", latitude: 47.525508, longitude: -121.843049)
        let Donna = Personnage(photo: "Donna", firstName: "Donna", name: "Hayward", telephone: "048313209", address: "Hayward House, 3316 Grand Ave, WA 98201, Twin Peaks", latitude: 47.973390, longitude: -122.213031)
        let James = Personnage(photo: "James", firstName: "James", name: "Hurley", telephone: "048313219", address: "Big Ed's Gas Farm, Rd SE Preston, WA 98050, Twin Peaks", latitude: 47.523763, longitude: -121.927365)
        
        personnages.append(Dale)
        personnages.append(Laura)
        personnages.append(Leland)
        personnages.append(Sarah)
        personnages.append(Audrey)
        personnages.append(Ben)
        personnages.append(Harry)
        personnages.append(Bobby)
        personnages.append(Shelly)
        personnages.append(Leo)
        personnages.append(Donna)
        personnages.append(James)
        
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        
        for value in personnages {
            let coordinaten = CLLocationCoordinate2DMake(value.latitude, value.longitude)
            let annotation: Annotation = Annotation(coordinate: coordinaten, title: value.firstName + " " + value.name)
            map.addAnnotation(annotation)
            map.selectAnnotation(annotation, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let center = CLLocationCoordinate2D(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        mapView.setRegion(region, animated: true)
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
        
        mapView.setRegion(region, animated: true)
    }
}
