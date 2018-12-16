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
    
    var list: [MoviesVO] = {
        var datalist = [MoviesVO]()
        return datalist
    }()
    
    var orderType : Int = 0 
    

    
    @objc func requestData() {
        print("requesting data")
//        getMoviesRequestSample()
        refresher.endRefreshing()
    }
    
    func getMoviesRequestSample(_ tableView: UITableView) {
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
                DispatchQueue.main.async(execute: {
                let url: URL! = URL(string: mvo.thumb!)
                let imageData = try! Data(contentsOf: url)
                mvo.movieImage = UIImage(data:imageData)
                    tableView.reloadData()
                })
                self.list.append(mvo)
            }
        }catch {
            NSLog("Parse Error!!")
            networkAlert()
            print("네트워크 에러")
            print("네트워크 에러")

            print("네트워크 에러")
            print("네트워크 에러")


        }
    }
    
    func getMoviesRequestSample(_ collectionView: UICollectionView) {
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
                DispatchQueue.main.async(execute: {
                    let url: URL! = URL(string: mvo.thumb!)
                    let imageData = try! Data(contentsOf: url)
                    mvo.movieImage = UIImage(data:imageData)
                    collectionView.reloadData()
                })
                self.list.append(mvo)
            }
        }catch {
            NSLog("Parse Error!!")
            networkAlert()
            print("네트워크 에러")
            print("네트워크 에러")
            
            print("네트워크 에러")
            print("네트워크 에러")
            
            
        }
    }

    
}

