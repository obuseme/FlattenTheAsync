//
//  ViewController.swift
//  FlattenTheAsync
//
//  Created by Andrew Obusek on 8/20/20.
//  Copyright © 2020 Andy Obusek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var animator: Animator = UIView()
    @IBOutlet var onOffLabel: UILabel!

    @IBAction func switchToggled(_ sender: UISwitch) {
        type(of: animator).animate(withDuration: 0.5) {
            self.onOffLabel.alpha = sender.isOn ? 1.0 : 0.0
        }
    }
}

protocol Animator {
    static func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void)
}

extension UIView: Animator { }
