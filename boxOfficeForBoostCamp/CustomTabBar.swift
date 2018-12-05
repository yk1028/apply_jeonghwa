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
        
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        
        firstVC.tabBarItem.title = "First"
        secondVC.tabBarItem.title = "Second"
        
        viewControllers = [firstVC, secondVC]
    }
    
    
}



