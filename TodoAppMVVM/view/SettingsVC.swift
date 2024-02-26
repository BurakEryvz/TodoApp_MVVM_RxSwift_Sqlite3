//
//  SettingsVC.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 24.02.2024.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var switcher: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let customNavigationController = CustomNavigation()
        customNavigationController.setNavigation(navigationController: self.navigationController!, navigationItem: self.navigationItem, title: "Settings")
        
        switcher.tintColor = .white
        switcher.thumbTintColor = .white
        switcher.onTintColor = .black
        
        if traitCollection.userInterfaceStyle == .dark {
            switcher.isOn = true
        } else {
            switcher.isOn = false
        }
    }
    

    @IBAction func switcherValueChanged(_ sender: UISwitch) {
        
        var appearance = traitCollection.userInterfaceStyle
        
        if switcher.isOn {
            appearance = .dark
            overrideUserInterfaceStyle = appearance
        } else {
            appearance = .light
            overrideUserInterfaceStyle = appearance
        }
        
    }
    

}
