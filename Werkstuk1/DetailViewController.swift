//
//  DetailViewController.swift
//  Werkstuk1
//
//  Created by Felix Struelens on 17/08/18.
//  Copyright © 2018 Felix Struelens. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, MKMapViewDelegate {
    
    var personnage = Personnage()
    
    var fullPhoto: String!

    @IBOutlet weak var photo: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var telephone: UILabel!
    @IBOutlet weak var address: UITextView!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.photo.setBackgroundImage(UIImage(named: personnage.photo), for: UIControlState.normal)
        self.name.text = personnage.firstName + " " + personnage.name
        self.telephone.text = personnage.telephone
        self.address.text = personnage.address
        self.latitude.text = "latitude: " + String(personnage.latitude)
        self.longitude.text = "longitude: " + String(personnage.longitude)
        
        let coordinaten = CLLocationCoordinate2DMake(personnage.latitude, personnage.longitude)
        let annotation: Annotation = Annotation(coordinate: coordinaten, name: personnage.firstName + " " + personnage.name)
        self.map.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: coordinaten, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        map.setRegion(region, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "naarImage"
        {
            let vc = segue.destination as! ImageViewController
            let fullPhoto = personnage.photo
            vc.fullPhoto = fullPhoto
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
