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
        configureViews()
    }

    let movieGradeSize: CGFloat = 20
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let movieGrade: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "age0")!
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .left
        let size: CGFloat = 20
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.layer.cornerRadius = size / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let dummyGradeRightArea = UIView()
    let movieTitle = BOLabel(title: "영화 제목", size: 20)
    
    let movieSubTitle = BOLabel(title: "평점 : 10 예매순위 : 10 예매율 : 10.10", size: 14)
    let movieReleaseDate = BOLabel(title: "개봉일 : 2000-11-11", size: 12)

    func configureViews() {
        addSubview(movieImage)
        movieImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        movieImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        addSubview(movieTitle)
        movieTitle.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: 10).isActive = true
        movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        
        addSubview(movieGrade)
        movieGrade.leftAnchor.constraint(equalTo: movieTitle.rightAnchor, constant: 8).isActive = true
        movieGrade.topAnchor.constraint(equalTo: movieTitle.topAnchor).isActive = true


        addSubview(dummyGradeRightArea)
        dummyGradeRightArea.translatesAutoresizingMaskIntoConstraints = false
        dummyGradeRightArea.leftAnchor.constraint(equalTo: movieGrade.rightAnchor).isActive = true
        dummyGradeRightArea.topAnchor.constraint(equalTo: movieTitle.topAnchor).isActive = true
        dummyGradeRightArea.rightAnchor.constraint(equalTo: rightAnchor, constant: 2).isActive = true
        dummyGradeRightArea.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        addSubview(movieSubTitle)
        movieSubTitle.leftAnchor.constraint(equalTo: movieTitle.leftAnchor).isActive = true
        movieSubTitle.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 8).isActive = true
        movieSubTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(movieReleaseDate)
        movieReleaseDate.leftAnchor.constraint(equalTo: movieTitle.leftAnchor).isActive = true
        movieReleaseDate.topAnchor.constraint(equalTo: movieSubTitle.bottomAnchor, constant: 10).isActive = true
        movieReleaseDate.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
