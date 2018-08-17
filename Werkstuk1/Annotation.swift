//
//  Annotation.swift
//  Werkstuk1
//
//  Created by Felix Struelens on 17/08/18.
//  Copyright © 2018 Felix Struelens. All rights reserved.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var name: String?
    
    override init() {
        coordinate = CLLocationCoordinate2D()
        name = ""
    }
    
    init(coordinate: CLLocationCoordinate2D, name: String) {
        self.coordinate = coordinate
        self.name = name
    }
}
