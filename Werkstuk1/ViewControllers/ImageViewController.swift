//
//  ImageViewController.swift
//  Werkstuk1
//
//  Created by Felix Struelens on 17/08/18.
//  Copyright © 2018 Felix Struelens. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
   
    var fullPhoto: String!
    
    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photo.image = UIImage(named: fullPhoto)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
