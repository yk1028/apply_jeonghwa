//
//  TableTabCell.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 08/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class tableTabCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
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
        
        contentView.addSubview(movieGrade)
        movieGrade.leftAnchor.constraint(equalTo: movieTitle.rightAnchor, constant: 8).isActive = true
        movieGrade.topAnchor.constraint(equalTo: movieTitle.topAnchor).isActive = true
        
        contentView.addSubview(movieSubTitle)
        movieSubTitle.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: insetFromImage).isActive = true
        movieSubTitle.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 8).isActive = true
        movieSubTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        contentView.addSubview(movieReleaseDate)
        movieReleaseDate.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: insetFromImage).isActive = true
        movieReleaseDate.topAnchor.constraint(equalTo: movieSubTitle.bottomAnchor, constant: 10).isActive = true
        movieReleaseDate.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
