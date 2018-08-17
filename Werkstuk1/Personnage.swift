//
//  Personnage.swift
//  Werkstuk1
//
//  Created by Felix Struelens on 17/08/18.
//  Copyright © 2018 Felix Struelens. All rights reserved.
//

import UIKit

class Personnage: NSObject {
    var photo: String
    var firstName: String
    var name: String
    var telephone: String
    var address: String
    var latitude: Double
    var longitude: Double
    
    override init() {
        photo = ""
        firstName = ""
        name = ""
        telephone = ""
        address = ""
        latitude = 0
        longitude = 0
    }
    
    init(photo: String, firstName: String, name: String, telephone: String, address: String, latitude: Double, longitude: Double) {
        self.photo = photo
        self.firstName = firstName
        self.name = name
        self.telephone = telephone
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
}
