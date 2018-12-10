//
//  MovieDetailVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 08/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {
    let movieTitleFromList = "영화제목목목목"

    let urlId = "5a54c286e8a71d136fb5378e"

    let cellId = "cellId"
    
    // VIEW
    let movieDetailTable = BOTableView()

    // MODEL
    lazy var infoFromList: MovieVO = {
        var datalist = MovieVO()
        return datalist
    }()
    
    lazy var comments: [CommentsVO] = {
        var datalist = [CommentsVO]()
        return datalist
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigation()
        navigationItem.title = movieTitleFromList
        movieDetailTableRegister()
        

        
        getMovieVORequest()
        getCommentsVORequest()
        }
    
    
    func getMovieVORequest() {
        guard let url = URL(string: "http://connect-boxoffice.run.goorm.io/movie?id=\(urlId)") else { return }
        
        do {
            let apiData = try Data(contentsOf: url)
            let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? ""
            NSLog("API Result=\( log )")
            
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! [String : Any]
            
            let r = apiDictionary
            infoFromList.audience = r["audience"] as? Int
            infoFromList.actor = r["actor"] as? String
            infoFromList.duration = r["duration"] as? Int
            infoFromList.director = r["director"] as? String
            infoFromList.synopsis = r["synopsis"] as? String
            infoFromList.genre = r["genre"] as? String
            infoFromList.grade = r["grade"] as? Int
            infoFromList.image = r["image"] as? String
            infoFromList.reservation_grade = r["reservation_grade"] as? Int
            infoFromList.title = r["title"] as? String
            infoFromList.reservation_rate = r["reservation_rate"] as? Double
            infoFromList.user_rating = r["user_rating"] as? Double
            infoFromList.date = r["date"] as? String
            infoFromList.id = r["id"] as? String
            let url: URL! = URL(string: infoFromList.image!)
            let imageData = try! Data(contentsOf: url)
            infoFromList.movieImageLarge = UIImage(data:imageData)
            
        }catch { NSLog("Parse Error!!")}
    }
    
    func movieDetailTableRegister() {
        view.addSubview(movieDetailTable)
        movieDetailTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        movieDetailTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        movieDetailTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        movieDetailTable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        
        movieDetailTable.delegate = self
        movieDetailTable.dataSource = self
        movieDetailTable.register(MovieDetailCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    func getCommentsVORequest() {
        guard let url = URL(string: "http://connect-boxoffice.run.goorm.io/comments?movie_id=\(urlId)") else { return }
        
        do {
            let apiData = try Data(contentsOf: url)
            let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? ""
            NSLog("API Result=\( log )")
            
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            let comments = apiDictionary["comments"] as! NSArray
            
            for row in comments {
                let r = row as! NSDictionary
                let cvo = CommentsVO()
                cvo.rating = r["rating"] as? Double
                cvo.timestamp = r["timestamp"] as? Double
                cvo.writer = r["writer"] as? String
                cvo.movie_id = r["movie_id"] as? String
                cvo.contents = r["contents"] as? String
                self.comments.append(cvo)
            }
        }catch { NSLog("Parse Error!!")}
    }
    

    
}

extension MovieDetailVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieDetailCell
        return cell
    }

}
