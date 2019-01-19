//
//  ViewController.swift
//  WhereNext
//
//  Created by Hector Drandakis on 1/17/19.
//  Copyright © 2019 Hector Drandakis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var farBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        closeBtn.layer.cornerRadius = 10
        closeBtn.clipsToBounds = true
        
        farBtn.layer.cornerRadius = 10
        farBtn.clipsToBounds = true
    }
}

