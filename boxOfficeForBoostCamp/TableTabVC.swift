//
//  TableTabVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 05/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class TableTabVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        customNavigation()
        
        tableView.register(tableTabCell.self, forCellReuseIdentifier: "cellId")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }

}


class tableTabCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        backgroundColor = .cyan
        self.imageView?.image = UIImage(named: "movieSample")
    }
    
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.text = "영화 제목"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let movieSubTitle: UILabel = {
        let label = UILabel()
        label.text = "평점 : 10 예매순위 : 10 예매율 : 10.10"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let movieReleaseDate: UILabel = {
        let label = UILabel()
        label.text = "개봉일 : 2000-11-11"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
    func setupViews() {
        let insetFromImage: CGFloat = 10
        
        contentView.addSubview(movieImage)
        movieImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        movieImage.widthAnchor.constraint(equalToConstant: 70).isActive = true

        contentView.addSubview(movieTitle)
        movieTitle.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: insetFromImage).isActive = true
        movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//        movieTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        contentView.addSubview(movieSubTitle)
        movieSubTitle.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: insetFromImage).isActive = true
        movieSubTitle.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 10).isActive = true
//        movieSubTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        movieSubTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        contentView.addSubview(movieReleaseDate)
        movieReleaseDate.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: insetFromImage).isActive = true
        movieReleaseDate.topAnchor.constraint(equalTo: movieSubTitle.bottomAnchor, constant: 10).isActive = true
//        movieReleaseDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        movieReleaseDate.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
