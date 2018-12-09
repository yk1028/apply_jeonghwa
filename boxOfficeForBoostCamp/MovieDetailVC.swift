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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customNavigation()
        navigationItem.title = "영화제목으로변경"
        view.backgroundColor = .gray
        setupViews()
        
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
