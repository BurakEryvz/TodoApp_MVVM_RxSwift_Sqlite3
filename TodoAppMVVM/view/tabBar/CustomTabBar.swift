//
//  CustomTabBar.swift
//  TodoAppMVVM
//
//  Created by Burak Eryavuz on 24.02.2024.
//

import UIKit

class CustomTabBar {
    func setTabBar(tabBarController: UITabBarController) {
        if let tabBarItems = tabBarController.tabBar.items {
            let homepageItem = tabBarItems[0]
            let settingsItem = tabBarItems[1]
            
        }
        
        tabBarController.selectedIndex = 0
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.secondarySystemBackground
        
        changeTabBarColor(itemAppearance: appearance.compactInlineLayoutAppearance)
        changeTabBarColor(itemAppearance: appearance.inlineLayoutAppearance)
        changeTabBarColor(itemAppearance: appearance.stackedLayoutAppearance)
        
        tabBarController.tabBar.standardAppearance = appearance
        tabBarController.tabBar.scrollEdgeAppearance = appearance
    }
    
    func changeTabBarColor(itemAppearance: UITabBarItemAppearance) {
        itemAppearance.selected.iconColor = UIColor(named: "ColorButtonRed")!
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "ColorButtonRed")!]
        itemAppearance.selected.badgeBackgroundColor = UIColor.red
        
        itemAppearance.normal.iconColor = UIColor.lightGray
        itemAppearance.normal.titleTextAttributes = [ .foregroundColor: UIColor.lightGray]
        itemAppearance.normal.badgeBackgroundColor = UIColor(named: "ColorButtonRed")!
    }
    
}
