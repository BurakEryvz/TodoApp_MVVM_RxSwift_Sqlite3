//
//  CustomNavigation.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 24.02.2024.
//

import UIKit

class CustomNavigation {
    func setNavigation(navigationController: UINavigationController, navigationItem: UINavigationItem, title: String) {
        navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        

        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.systemBackground
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "ColorButtonDark")!, .font: UIFont.boldSystemFont(ofSize: 48)]
        
        
        navigationController.navigationBar.barStyle = .default
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.compactAppearance = appearance
    }
}
