//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Hedellen Fernandes on 06/03/2018.
//  Copyright © 2018 Hedellen Fernandes. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    
    func formatView() {
        swAutoRefresh.setOn(config.autorefresh, animated: false)
        slTimeInterval.setValue(Float(config.timeInterval), animated: false)
        scColorScheme.selectedSegmentIndex = config.colorScheme
        changeTimeInterval(with: config.timeInterval)
    }
    
    
    func changeTimeInterval(with value: Double) {
        lbTimeInterval.text  = "Mudar após \(Int(value)) segundos"
    }
    
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value))
        changeTimeInterval(with: value)
        config.timeInterval = value
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
 
}