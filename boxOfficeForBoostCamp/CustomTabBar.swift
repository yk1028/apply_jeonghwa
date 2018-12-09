//
//  CustomTabBar.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 05/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        self.tabBar.barTintColor = .blue
        self.tabBar.tintColor = .white
        
    }
    
    func setupNavigation() {
        
        let tableTabVC = UINavigationController(rootViewController: TableTabVC())
        tableTabVC.tabBarItem.title = "Table"
        tableTabVC.tabBarItem.image = UIImage(named: "tabTable")

        
        let collectionTabVC = UINavigationController(rootViewController: CollectionTabVC())
        collectionTabVC.tabBarItem.title = "Collection"
        collectionTabVC.tabBarItem.image = UIImage(named: "tabCollection")

        viewControllers = [tableTabVC, collectionTabVC]

    }
    
    
}

extension UIViewController {
    
    func customNavigation() {
        navigationItem.title = "영화목록"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .blue
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btnSort"), for: .normal)
        button.addTarget(self, action: #selector(btnSort), for: .touchUpInside)
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func btnSort() {
        print("sort button!!")
    }
}



