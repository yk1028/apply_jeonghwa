//
//  TableTabVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 05/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class TableTabVC: UIViewController {

    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .gray
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)

        return refreshControl
    }()

    
    let tabTableView = UITableView()
    let cellId = "cellId"
    var orderType : Int = 0
    
    lazy var list: [MoviesVO] = {
        var datalist = [MoviesVO]()
        return datalist
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("TableTabVC : viewDidLoad")
        customNavigation()
        configureTableView()
        tabTableView.refreshControl = refresher
        }
    
    override func viewWillAppear(_ animated: Bool) {
        print("TableTabVC : viewWillAppear")
        getMoviesRequestSample()
        print("orderType is \(orderType)")
        print("viewWillAppear:리스트 개수: \(list.count)")
        print("viewWillAppear:영화 제목: \(list[0].title!)")
    }

    func getMoviesRequestSample() {
//        list 초기화
        list = []
        
//        AppDelegate에서 orderType를 불러온다
        let ad = UIApplication.shared.delegate as? AppDelegate
        if let type = ad?.movieOrderType {
            orderType = type
        }
        
        guard let url = URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=\(orderType)") else { return }
        do {
            let apiData = try Data(contentsOf: url)
//            let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? ""
//            NSLog("API Result=\( log )")
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            let movie = apiDictionary["movies"] as! NSArray
            
            for row in movie {
                let r = row as! NSDictionary
                let mvo = MoviesVO()
                
                mvo.grade = r["grade"] as? Int
                mvo.thumb = r["thumb"] as? String
                mvo.reservation_grade = r["reservation_grade"] as? Int
                mvo.title = r["title"] as? String
                mvo.reservation_rate = r["reservation_rate"] as? Double
                mvo.user_rating = r["user_rating"] as? Double
                mvo.date = r["date"] as? String
                mvo.id = r["id"] as? String
                
                let url: URL! = URL(string: mvo.thumb!)
                let imageData = try! Data(contentsOf: url)
                mvo.movieImage = UIImage(data:imageData)
                
                self.list.append(mvo)
                self.tabTableView.reloadData()
            }
        }catch {
            NSLog("Parse Error!!")
            networkAlert()
        }
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
    
    @objc func requestData() {
        print("requesting data")
        getMoviesRequestSample()
        refresher.endRefreshing()
    }
    
    @objc override func btnSort() {
        let movieOrder = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요?", preferredStyle: .actionSheet)
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        let typeZero = UIAlertAction(title: "예매율", style: .default) { (_) in
            ad?.movieOrderType = 0
            self.navigationItem.title = "예매율순"
            self.getMoviesRequestSample()
        }
        
        let typeOne = UIAlertAction(title: "큐레이션", style: .default){ (_) in
            ad?.movieOrderType = 1
            self.navigationItem.title = "큐레이션순"
            self.getMoviesRequestSample()
            
        }
        
        let typeTwo = UIAlertAction(title: "개봉일", style: .default){ (_) in
            ad?.movieOrderType = 2
            self.navigationItem.title = "개봉일순"
            self.getMoviesRequestSample()
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
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableTabCell
        cell.movieTitle.text = row.title
        let age = "age" + String(row.grade!)
        cell.movieGrade.image = UIImage(named: age)
        cell.movieSubTitle.text = "평점 : \(row.user_rating!) 예매순위 : \(row.reservation_grade!) 예매율 : \(row.reservation_rate!)"
        cell.movieReleaseDate.text = "개봉일 : \(row.date!)"
//        cell.movieImage.image = row.movieImage
        DispatchQueue.main.async(execute: {
            cell.movieImage.image = self.getMovieImage(indexPath.row)
            })

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
        ad?.movieId = list[indexPath.row].id
    }
    
    
    func getMovieImage(_ index: Int) -> UIImage {
        let img = self.list[index]
        if let savedImage = img.movieImage {
            return savedImage
        } else {
            let url = URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=\(orderType)")
            let imgData = try! Data(contentsOf: url!)
            img.movieImage = UIImage(data: imgData)
            return img.movieImage!
        }
    }
    
}


extension UIViewController {

    func networkAlert() {
        let alert = UIAlertController(title: "네트워크 수신 실패", message: "네트워크 상태를 확인해주세요", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
