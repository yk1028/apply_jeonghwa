//
//  tabAndCollection.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 16/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit
class TabAndCollection: UIViewController {
 
    var list: [MoviesVO] = {
        var datalist = [MoviesVO]()
        return datalist
    }()
    
    var orderType : Int = 0
    
    func getMoviesRequestSample() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //        list 초기화
        list = []
        
        //        AppDelegate에서 orderType를 불러온다
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        if let type = appDelegate?.movieOrderType {
            orderType = type
        }
        
        guard let url = URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=\(orderType)") else { return }
        
        let session: URLSession = URLSession(configuration: .default)
        
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            if let error = error {
                self.networkAlert()
                print("네트워크 에러")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let apiDictionary = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                
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
                    self.list.append(mvo)
                }
                
            } catch {
                self.networkAlert()
                print("네트워크 에러")
            }
        }
        
        dataTask.resume()
    }
}

