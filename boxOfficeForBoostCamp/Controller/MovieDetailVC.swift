//
//  MovieDetailVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 08/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class MovieDetailVC: UIViewController {
    var urlId = ""
    var fullImageView = UIImageView()
    let movieDetailTable = UITableView()

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
        self.navigationItem.setRightBarButton(nil, animated: true)
        self.configureMovieDetailTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("MovieDetailVC : viewWillAppear")
        getMovieIdFromAppDelegate()
            self.getMovieVORequest()
            self.getCommentsVORequest()
        navigationItem.title = infoFromList.title
    }

    func getMovieIdFromAppDelegate() {
        let ad = UIApplication.shared.delegate as? AppDelegate
        if let id = ad?.movieId {
            urlId = id
        }
    }
    
    func configureMovieDetailTable() {
        view.backgroundColor = .white

        view.addSubview(movieDetailTable)
        movieDetailTable.translatesAutoresizingMaskIntoConstraints = false
        movieDetailTable.separatorStyle = UITableViewCell.SeparatorStyle.none
        movieDetailTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        movieDetailTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        movieDetailTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        movieDetailTable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        
        movieDetailTable.translatesAutoresizingMaskIntoConstraints = false
        movieDetailTable.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        movieDetailTable.delegate = self
        movieDetailTable.dataSource = self
        movieDetailTable.register(MovieDetailCell.self, forCellReuseIdentifier: "detailCellId")
        movieDetailTable.register(MovieSynopsisCell.self, forCellReuseIdentifier: "synopsisCellId")
        movieDetailTable.register(MovieActorCell.self, forCellReuseIdentifier: "actorCellId")
        movieDetailTable.register(MovieCommentsCell.self, forCellReuseIdentifier: "commentsCellId")

    }

    func getMovieVORequest() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        guard let url = URL(string: "http://connect-boxoffice.run.goorm.io/movie?id=\(urlId)") else { return }
        
        do {
            let apiData = try Data(contentsOf: url)
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
        }catch {
            networkAlert()
        }
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    func getCommentsVORequest() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        guard let url = URL(string: "http://connect-boxoffice.run.goorm.io/comments?movie_id=\(urlId)") else { return }
        do {
            let apiData = try Data(contentsOf: url)
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
        }catch {
            networkAlert()
        }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

extension MovieDetailVC : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2:
            return 1
        case 3:
            return comments.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "detailCellId", for: indexPath) as! MovieDetailCell
                cell.selectionStyle = .none

                
                cell.movieTitle.text = infoFromList.title
                let age = "age" + String(infoFromList.grade!)
                cell.movieGrade.image = UIImage(named: age)
                cell.movieDate.text = "\(infoFromList.date!)개봉"
                cell.movieSubTitle.text = "\(infoFromList.genre!)/\(infoFromList.duration!)분"
                cell.movieReservationRate.text = "\(infoFromList.reservation_grade!)위 \(infoFromList.reservation_rate!)%"
                cell.movieUserRating.text = "\(infoFromList.user_rating!)"
                cell.movieUserRatingStar.addSubview(StarView(starSize: 13, userRating: infoFromList.user_rating!))
                cell.movieAudience.text = "\(infoFromList.audience!.withComma)"
                cell.movieImage.addSubview(getImage())
                cell.movieImageFull.addTarget(self, action: #selector(expandImage), for: .touchUpInside)
                return cell
            
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "synopsisCellId", for: indexPath) as! MovieSynopsisCell
                cell.selectionStyle = .none
                cell.movieSynopsis.text = infoFromList.synopsis
                return cell

            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "actorCellId", for: indexPath) as! MovieActorCell
                cell.selectionStyle = .none
                cell.movieDirectorlist.text = infoFromList.director
                cell.movieActorlist.text = infoFromList.actor
                return cell

            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCellId", for: indexPath) as! MovieCommentsCell
                cell.selectionStyle = .none
                let row = self.comments[indexPath.row]
                cell.userName.text = row.writer
                cell.userRatingStar.addSubview(StarView(starSize: 13, userRating: row.rating!))
                cell.commentTime.text = convertFromUnix(timeStamp: row.timestamp!)
                cell.commentContents.text = row.contents
                return cell
            
            default:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCellId", for: indexPath) as! MovieCommentsCell
                    return cell
            }
        }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleForHeader = UILabel()
        titleForHeader.font = UIFont.systemFont(ofSize: 22)
        
        switch section {
        case 1:
            titleForHeader.text = "줄거리"
        case 2:
            titleForHeader.text = "감독/출연"
        case 3:
            titleForHeader.text = "한줄평"
        default:
            break

       }
        return titleForHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
//    섹션 헤더 고정하기
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let sectionHeaderHeight: CGFloat = 40
        if scrollView.contentOffset.y <= sectionHeaderHeight &&
            scrollView.contentOffset.y >= 0 {
            scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
        } else if scrollView.contentOffset.y >= sectionHeaderHeight {
            scrollView.contentInset = UIEdgeInsets(top: -sectionHeaderHeight, left: 0, bottom: 0, right: 0)
        }
    }
    
    
    func getImage() -> UIImageView {
        if fullImageView.image != nil {
            fullImageView.frame = CGRect(x: 0, y: 0, width: 110, height: 155)
            return fullImageView
        } else {
            let asyncImageView = AsyncImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 155))
            asyncImageView.loadImage(urlString: "\(self.infoFromList.image!)")
            fullImageView = asyncImageView
            return fullImageView
        }
    }
    
    @objc func expandImage() {
        let newImageView = fullImageView
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .white
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissImage))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
        self.movieDetailTable.reloadData()
    
    }

}
