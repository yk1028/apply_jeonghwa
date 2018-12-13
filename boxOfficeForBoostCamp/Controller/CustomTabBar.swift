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
        self.tabBar.barTintColor = .barBlue
        self.tabBar.tintColor = .white
        self.tabBar.isTranslucent = false



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
        navigationController?.navigationBar.barTintColor = .barBlue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    

    func customNavigationRightBarButton() {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "btnSort"), for: .normal)
        button.addTarget(self, action: #selector(btnSort), for: .touchUpInside)
        
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }

    
    
    @objc func btnSort() {
        
        let movieOrder = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요?", preferredStyle: .actionSheet)
        let typeZero = UIAlertAction(title: "예매율", style: .default) { (_) in
            print("예매율 클릭")
        }
        let typeOne = UIAlertAction(title: "큐레이션", style: .default){ (_) in
            print("큐레이션 클릭")
        }
        let typeTwo = UIAlertAction(title: "개봉일", style: .default){ (_) in
            print("개봉일 클릭")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        movieOrder.addAction(typeZero)
        movieOrder.addAction(typeOne)
        movieOrder.addAction(typeTwo)
        movieOrder.addAction(cancel)
        self.present(movieOrder, animated: false)
        
        
        
    }
    

}



