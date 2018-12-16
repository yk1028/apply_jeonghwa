//
//  CollectionTabCell.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 16/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class TabCollectionCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieGrade: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "age0")!
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        let size: CGFloat = 30
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.layer.cornerRadius = size / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let movieTitle = BOLabel(title: "영화 제목", size: 22, textAlign: .center, lines: 2)
    let movieSubTitle = BOLabel(title: "0위(00.00) / 00.0%", size: 14, textAlign: .center)
    let movieReleaseDate = BOLabel(title: "2000-11-11", size: 12, textAlign: .center)
    
    let imageWidth = UIScreen.main.bounds.width / 2 - 40
    
    
    
    func configureViews() {
        addSubview(movieImage)
        movieImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        movieImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2 - 32) * CGFloat(2.squareRoot())).isActive = true
        
        addSubview(movieGrade)
        movieGrade.topAnchor.constraint(equalTo: movieImage.topAnchor, constant: 3).isActive = true
        movieGrade.rightAnchor.constraint(equalTo: movieImage.rightAnchor, constant: -6).isActive = true
        movieGrade.heightAnchor.constraint(equalToConstant: 30).isActive = true
        movieGrade.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(movieTitle)
        movieTitle.leftAnchor.constraint(equalTo: movieImage.leftAnchor).isActive = true
        movieTitle.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: movieImage.rightAnchor).isActive = true
        
        addSubview(movieSubTitle)
        movieSubTitle.leftAnchor.constraint(equalTo: movieImage.leftAnchor).isActive = true
        movieSubTitle.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 8).isActive = true
        movieSubTitle.rightAnchor.constraint(equalTo: movieImage.rightAnchor).isActive = true
        
        addSubview(movieReleaseDate)
        movieReleaseDate.leftAnchor.constraint(equalTo: movieImage.leftAnchor).isActive = true
        movieReleaseDate.topAnchor.constraint(equalTo: movieSubTitle.bottomAnchor, constant: 8).isActive = true
        movieReleaseDate.rightAnchor.constraint(equalTo: movieImage.rightAnchor).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
