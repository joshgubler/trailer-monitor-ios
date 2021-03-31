//
//  ViewController.swift
//  TrailerMonitor
//
//  Created by Josh Gubler on 3/28/21.
//

import UIKit

class JGRootViewController: UITabBarController, JGClientDelegate {
    var localClient: JGClient!
    var vpnClient: JGClient!

    override func viewDidLoad() {
        super.viewDidLoad()
        vpnClient = JGClient(url: URL(string: "ws://192.168.255.100:8765/")!)
        vpnClient.delegate = self
        vpnClient.connect()
        localClient = JGClient(url: URL(string: "ws://trailer:8765/")!)
        localClient.delegate = self
        localClient.connect()
    }
    
    override func didReceiveMemoryWarning() {
        vpnClient.disconnect()
        localClient.disconnect()
    }

    func onLocationData(_ location: JGLocation) {
        DispatchQueue.main.async {
            if let viewControllers = self.viewControllers {
                let mapViewController = viewControllers[1] as! JGMapViewController
                mapViewController.location = location
                let locationViewController = viewControllers[2] as! JGLocationViewController
                locationViewController.location = location
            }
        }
    }
    
    func onPowerData(_ power: JGPower) {
        DispatchQueue.main.async {
            if let viewControllers = self.viewControllers {
                let powerViewController = viewControllers[0] as! JGPowerViewController
                powerViewController.power = power
            }
        }
    }

}

