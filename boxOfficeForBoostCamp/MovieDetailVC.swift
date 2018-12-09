//
//  MovieDetailVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 08/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class MovieDetailVC: UITableViewController {
    fileprivate let cellId = "detailId"
    
    let urlId = "5a54c286e8a71d136fb5378e"

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
        navigationItem.title = "영화제목으로변경"
        view.backgroundColor = .gray
        setupViews()
        getMovieVORequest()
        getCommentsVORequest()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "section: \(section)"
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "text"
        return cell
    }
    
    // 섹션1 : 영화 기본정보 뷰
    let infoView: UIView = {
        let infoView = UIView()
        infoView.backgroundColor = .red
        infoView.translatesAutoresizingMaskIntoConstraints = false

        return infoView
    }()
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let movieTitle: UILabel = {
        let label = UILabel()
        label.text = "영화 제목"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()

    let movieGrade: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    let movieDate: UILabel = {
        let label = UILabel()
        label.text = "0000-00-00개봉"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    let movieReservationRate: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    let movieUserRating: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let movieSubTitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let movieAudience: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    // 섹션2 : 줄거리 뷰
    let synopsisView: UIView = {
        let synopsisView = UIView()
        synopsisView.backgroundColor = .blue
        synopsisView.translatesAutoresizingMaskIntoConstraints = false
        return synopsisView
    }()
    
    
    // 섹션3 : 줄거리 뷰
    let actorView: UIView = {
        let actorView = UIView()
        actorView.backgroundColor = .cyan
        actorView.translatesAutoresizingMaskIntoConstraints = false
        return actorView
    }()
    
    
    // 섹션4 : 한줄평 뷰(테이블)
    let commentsView: UIView = {
        let commentsView = UIView()
        commentsView.backgroundColor = .cyan
        commentsView.translatesAutoresizingMaskIntoConstraints = false
        return commentsView
    }()

    
    
    func setupViews() {
        self.view.addSubview(infoView)
        infoView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        infoView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        infoView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.view.addSubview(synopsisView)
        synopsisView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        synopsisView.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 8).isActive = true
        synopsisView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        synopsisView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.view.addSubview(actorView)
        actorView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        actorView.topAnchor.constraint(equalTo: synopsisView.bottomAnchor, constant: 8).isActive = true
        actorView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        actorView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.view.addSubview(commentsView)
        commentsView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        commentsView.topAnchor.constraint(equalTo: actorView.bottomAnchor, constant: 8).isActive = true
        commentsView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        commentsView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
}
