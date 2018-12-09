//
//  MovieDetailVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 08/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class MovieDetailVC: UITableViewController {
//    fileprivate let cellId = "detailId"
    
    let urlId = "5a54c286e8a71d136fb5378e"
    let movieTitleFromList = "영화제목목목목"

    lazy var infoFromList: MovieVO = {
        var datalist = MovieVO()
        return datalist
    }()
    
    lazy var comments: [CommentsVO] = {
        var datalist = [CommentsVO]()
        return datalist
    }()
    
    
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
                cvo.timestamp = r["timestamp"] as? Double
                cvo.writer = r["writer"] as? String
                cvo.movie_id = r["movie_id"] as? String
                cvo.contents = r["contents"] as? String
                self.comments.append(cvo)
            }
        }catch { NSLog("Parse Error!!")}
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNavigation()
        navigationItem.title = movieTitleFromList
        view.backgroundColor = .gray
        getMovieVORequest()
        getCommentsVORequest()
        
        self.tableView.register(MovieDetailCell.self, forCellReuseIdentifier: "detailId")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "section: \(section)"
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let comments = self.comments[indexPath.row]
//
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailId", for: indexPath) as! MovieDetailCell
//        commentsCell.textLabel?.text = "\(comments.timestamp)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 350
    }

    
}
