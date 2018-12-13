//
//  TableTabCell.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 08/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class TableTabCell: UITableViewCell {
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
    
    let movieTitle = BOLabel(title: "영화 제목", size: 22)
    let movieGrade = BOLabel(title: "00", size: 22)
    let movieSubTitle = BOLabel(title: "평점 : 10 예매순위 : 10 예매율 : 10.10", size: 14)
    let movieReleaseDate = BOLabel(title: "개봉일 : 2000-11-11", size: 12)

    func setupViews() {
        let insetFromImage: CGFloat = 10
        contentView.addSubview(movieImage)
        movieImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        movieImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        // [문제] 영화제목이 길면 내용이 등급이 잘리는 문제가 있음
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
