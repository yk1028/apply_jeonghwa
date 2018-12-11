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

    let detailCellId = "detailCellId"
    let synopsisCellId = "synopsisCellId"
    let actorCellId = "actorCellId"
    let commentsCellId = "commentsCellId"

    
    let sectionHeader = ["", "줄거리", "감독/출연", "한줄평"]

    
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
        view.backgroundColor = .white

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
            print("나온다")
            print("나온다")
            print("나온다")
            print("나온다")

            print("이것이 결과다 \(infoFromList)")
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
        movieDetailTable.register(MovieDetailCell.self, forCellReuseIdentifier: detailCellId)
        movieDetailTable.register(MovieSynopsisCell.self, forCellReuseIdentifier: synopsisCellId)
        movieDetailTable.register(MovieActorCell.self, forCellReuseIdentifier: actorCellId)
        movieDetailTable.register(MovieCommentsCell.self, forCellReuseIdentifier: commentsCellId)

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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 4
        default:
            return 0
        }
    }



    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch (indexPath.section) {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: detailCellId, for: indexPath) as! MovieDetailCell
                cell.selectionStyle = .none
                return cell
            
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: synopsisCellId, for: indexPath) as! MovieSynopsisCell
                cell.selectionStyle = .none
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: actorCellId, for: indexPath) as! MovieActorCell
                cell.selectionStyle = .none
                return cell
            case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: commentsCellId, for: indexPath) as! MovieCommentsCell
                cell.selectionStyle = .none

            return cell
            
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: commentsCellId, for: indexPath) as! MovieCommentsCell
                return cell
            }

        }

//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let titleForHeader = UILabel()
//
//        switch section {
//        case 0:
//            titleForHeader.text = "첫번째 섹션"
//        case 1:
//            titleForHeader.text = "두번째 섹션"
//        case 2:
//            titleForHeader.text = "세번째 섹션"
//        case 3:
//            titleForHeader.text = "네번째 섹션"
//        default:
//            titleForHeader.text = "섹션"
//
//       }
//        return titleForHeader
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }

}

