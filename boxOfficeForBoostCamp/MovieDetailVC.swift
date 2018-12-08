//
//  MovieDetailVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 08/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class MovieDetailVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigation()
        view.backgroundColor = .green
        navigationItem.title = "영화제목으로변경"

//        tableView.register(movieDetailCell.self, forCellReuseIdentifier: "detailCellId")

    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return tableView.dequeueReusableCell(withIdentifier: "detailCellId", for: indexPath)
//    }
//
//
}
//
//class movieDetailCell: UITableViewCell {
//
//}
//
