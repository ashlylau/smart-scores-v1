//
//  ViewController.swift
//  SmartScoresV1
//
//  Created by Ashly Lau on 28/3/19.
//  Copyright © 2019 Ashly Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var lightOn = true
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn = !lightOn
        updateUI()
    }
    
    func updateUI() {
        if lightOn {
            view.backgroundColor = .white
//            lightButton.setTitle("Off", for: .normal)
        } else {
            view.backgroundColor = .black
//             lightButton.setTitle("On", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
}

