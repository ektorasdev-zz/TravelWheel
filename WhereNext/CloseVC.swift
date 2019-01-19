//
//  CloseVC.swift
//  WhereNext
//
//  Created by Hector Drandakis on 1/17/19.
//  Copyright © 2019 Hector Drandakis. All rights reserved.
//

import UIKit
import TTFortuneWheel

class CloseVC: UIViewController {
    
    @IBOutlet weak var wheelSpin: TTFortuneWheel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wheelSpin.layer.cornerRadius = 170
        wheelSpin.clipsToBounds = true
        
        let slices = [ CarnivalWheelSlice.init(title: "Brussels"),
                       CarnivalWheelSlice.init(title: "Frankfurt"),
                       CarnivalWheelSlice.init(title: "Helsinki"),
                       CarnivalWheelSlice.init(title: "Stockholm"),
                       CarnivalWheelSlice.init(title: "Oslo"),
                       CarnivalWheelSlice.init(title: "Lisbon"),
                       CarnivalWheelSlice.init(title: "Edinburgh"),
                       CarnivalWheelSlice.init(title: "Zurich")]
        
        wheelSpin.slices = slices
        wheelSpin.equalSlices = true
        wheelSpin.frameStroke.width = 0
        wheelSpin.slices.enumerated().forEach { (pair) in
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
    
    @IBAction func rotateBtn(_ sender: Any) {
        
        wheelSpin.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.wheelSpin.startAnimating(fininshIndex: Int.random(in: 0..<9)) { (finished) in
                print(finished)
            }
        }
    }
}
