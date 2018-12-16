//
//  tabAndCollection.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 16/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit
class TabAndCollection: UIViewController {
    
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .gray
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        
        return refreshControl
    }()

    
    var orderType : Int = 0
    
    lazy var list: [MoviesVO] = {
        var datalist = [MoviesVO]()
        return datalist
    }()
    
    @objc func requestData() {
        print("requesting data")
        getMoviesRequestSample()
        refresher.endRefreshing()
    }
    
    func getMoviesRequestSample() {
        //        list 초기화
        list = []
        
        //        AppDelegate에서 orderType를 불러온다
        let ad = UIApplication.shared.delegate as? AppDelegate
        if let type = ad?.movieOrderType {
            orderType = type
        }
        
        print("새로만든것의 오더타입은 \(orderType)")
        print("새로만든것의 오더타입은 \(orderType)")
        print("새로만든것의 오더타입은 \(orderType)")
        print("새로만든것의 오더타입은 \(orderType)")

        
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
//                self.tabTableView.reloadData()
            }
        }catch {
            NSLog("Parse Error!!")
            networkAlert()
        }
    }

    
    
//    @objc override func btnSort() {
//        let movieOrder = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요?", preferredStyle: .actionSheet)
//        let ad = UIApplication.shared.delegate as? AppDelegate
//
//        let typeZero = UIAlertAction(title: "예매율", style: .default) { (_) in
//            ad?.movieOrderType = 0
//            self.navigationItem.title = "예매율순"
//            self.getMoviesRequestSample()
//
//        }
//
//        let typeOne = UIAlertAction(title: "큐레이션", style: .default){ (_) in
//            ad?.movieOrderType = 1
//            self.navigationItem.title = "큐레이션순"
//            self.getMoviesRequestSample()
//
//        }
//
//        let typeTwo = UIAlertAction(title: "개봉일", style: .default){ (_) in
//            ad?.movieOrderType = 2
//            self.navigationItem.title = "개봉일순"
//            self.getMoviesRequestSample()
//        }
//
//        let cancel = UIAlertAction(title: "취소", style: .cancel)
//
//        movieOrder.addAction(typeZero)
//        movieOrder.addAction(typeOne)
//        movieOrder.addAction(typeTwo)
//        movieOrder.addAction(cancel)
//        self.present(movieOrder, animated: false)
//    }

    

}

