//
//  FarAwayVC.swift
//  WhereNext
//
//  Created by Hector Drandakis on 1/17/19.
//  Copyright © 2019 Hector Drandakis. All rights reserved.
//

import UIKit
import TTFortuneWheel

class FarAwayVC: UIViewController {
    
    @IBOutlet weak var spinningWheel: TTFortuneWheel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinningWheel.layer.cornerRadius = 170
        spinningWheel.clipsToBounds = true

        let slices = [ CarnivalWheelSlice.init(title: "Sudney"),
                       CarnivalWheelSlice.init(title: "Tokyo"),
                       CarnivalWheelSlice.init(title: "Whashington"),
                       CarnivalWheelSlice.init(title: "San Fransisco"),
                       CarnivalWheelSlice.init(title: "Los Angeles"),
                       CarnivalWheelSlice.init(title: "Alaska"),
                       CarnivalWheelSlice.init(title: "Santiago"),
                       CarnivalWheelSlice.init(title: "Maldives")]
        
        spinningWheel.slices = slices
        spinningWheel.equalSlices = true
        spinningWheel.frameStroke.width = 0
        spinningWheel.slices.enumerated().forEach { (pair) in
            let slice = pair.element as! CarnivalWheelSlice
            let offset = pair.offset
            switch offset % 4 {
            case 0: slice.style = .brickRed
            case 1: slice.style = .sandYellow
            case 2: slice.style = .babyBlue
            case 3: slice.style = .deepBlue
            default: slice.style = .brickRed
            }
        }
    }
    
    @IBAction func rotateButton(_ sender: Any) {
        
        spinningWheel.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.spinningWheel.startAnimating(fininshIndex: Int.random(in: 0..<9)) { (finished) in
                print(finished)
            }
        }
    }
}
