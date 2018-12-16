//
//  TableTabVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 05/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class TableTabVC: UIViewController {

    let vc = TabAndCollection()
 
    let tabTableView = UITableView()
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        print("TableTabVC : viewDidLoad")
        customNavigation()
        configureTableView()
        tabTableView.refreshControl = vc.refresher
        }
    
    override func viewWillAppear(_ animated: Bool) {
        print("TableTabVC : viewWillAppear")
        vc.getMoviesRequestSample(tabTableView)

        self.tabTableView.reloadData()
    }

    
    func configureTableView() {
        view.addSubview(tabTableView)
        view.backgroundColor = .white
        tabTableView.translatesAutoresizingMaskIntoConstraints = false
        
        tabTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        tabTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tabTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tabTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        
        tabTableView.delegate = self
        tabTableView.dataSource = self
        tabTableView.register(TableTabCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc override func btnSort() {
        let movieOrder = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요?", preferredStyle: .actionSheet)
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        let typeZero = UIAlertAction(title: "예매율", style: .default) { (_) in
            ad?.movieOrderType = 0
            self.navigationItem.title = "예매율순"
            self.vc.getMoviesRequestSample(self.tabTableView)
            self.tabTableView.reloadData()
        }
        
        let typeOne = UIAlertAction(title: "큐레이션", style: .default){ (_) in
            ad?.movieOrderType = 1
            self.navigationItem.title = "큐레이션순"
            self.vc.getMoviesRequestSample(self.tabTableView)
            self.tabTableView.reloadData()
        }
        
        let typeTwo = UIAlertAction(title: "개봉일", style: .default){ (_) in
            ad?.movieOrderType = 2
            self.navigationItem.title = "개봉일순"
            self.vc.getMoviesRequestSample(self.tabTableView)
            self.tabTableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        movieOrder.addAction(typeZero)
        movieOrder.addAction(typeOne)
        movieOrder.addAction(typeTwo)
        movieOrder.addAction(cancel)
        self.present(movieOrder, animated: false)
    }

    
}

extension TableTabVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vc.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = vc.list[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableTabCell
        cell.movieTitle.text = row.title
        let age = "age" + String(row.grade!)
        cell.movieGrade.image = UIImage(named: age)
        cell.movieSubTitle.text = "평점 : \(row.user_rating!) 예매순위 : \(row.reservation_grade!) 예매율 : \(row.reservation_rate!)"
        cell.movieReleaseDate.text = "개봉일 : \(row.date!)"
        cell.movieImage.image = row.movieImage

        return cell
        
        
        
        
        
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 115
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행: \(indexPath.row)")
        self.navigationController?.pushViewController(MovieDetailVC(), animated: true)
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        ad?.movieId = vc.list[indexPath.row].id
    }
    
    
    
}


extension UIViewController {

    func networkAlert() {
        let alert = UIAlertController(title: "네트워크 수신 실패", message: "네트워크 상태를 확인해주세요", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
