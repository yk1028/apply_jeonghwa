//
//  MovieDetailCell.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 09/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class MovieDetailCell: UITableViewCell {
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupInfoView()
//        setupSynopsisView()
//        setupActorView()
//        setupCommentsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    // 섹션1-1 : 영화 기본정보 뷰(포스터, 기본정보)
    let infoView = BOView()
    let movieTitle = BOLabel(title: "신과함께-죄와벌", size: 22)
    let movieGrade = BOLabel(title: "12", size: 22)
    let movieDate = BOLabel(title: "2017-12-20개봉", size: 16)
    let movieSubTitle = BOLabel(title: "판타지, 드라마/139분", size: 16)
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // 섹션1-2 : 영화 기본정보 뷰(예매율, 평점, 누적관객수)
    let InfoViewSecond = BOView()
    let movieReservationRateTitle = BOLabel(title: "예매율", size: 14)
    let movieReservationRate = BOLabel(title: "1위 35.5%", size: 14)
    let movieUserRatingTitle = BOLabel(title: "평점", size: 14)
    let movieUserRating = BOLabel(title: "7.98", size: 14)
    let movieAudienceTitle = BOLabel(title: "누적관객수", size: 14)
    let movieAudience = BOLabel(title: "11,676,822", size: 14)
    

    
    // 섹션2 : 줄거리 뷰
    let synopsisView = BOView()
    
    
    // 섹션3 : 줄거리 뷰
    let actorView = BOView()

    
    // 섹션4 : 한줄평 뷰(테이블)
    let commentsView = BOView()

    
    
    func setupInfoView() {
        contentView.addSubview(infoView)
        infoView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        infoView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        infoView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        infoView.addSubview(movieImage)
        movieImage.leftAnchor.constraint(equalTo: infoView.leftAnchor , constant: 8).isActive = true
        movieImage.topAnchor.constraint(equalTo: infoView.topAnchor , constant: 8).isActive = true
        movieImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 155).isActive = true

        let insetFromInfoView = 60
        infoView.addSubview(movieTitle)
        movieTitle.leftAnchor.constraint(equalTo: movieImage.rightAnchor , constant: 8).isActive = true
        movieTitle.topAnchor.constraint(equalTo: infoView.topAnchor , constant: CGFloat(insetFromInfoView)).isActive = true

        infoView.addSubview(movieGrade)
        movieGrade.leftAnchor.constraint(equalTo: movieTitle.rightAnchor , constant: 8).isActive = true
        movieGrade.topAnchor.constraint(equalTo: infoView.topAnchor , constant: CGFloat(insetFromInfoView)).isActive = true

        infoView.addSubview(movieDate)
        movieDate.leftAnchor.constraint(equalTo: movieImage.rightAnchor , constant: 8).isActive = true
        movieDate.topAnchor.constraint(equalTo: movieTitle.bottomAnchor , constant: 8).isActive = true

        infoView.addSubview(movieSubTitle)
        movieSubTitle.leftAnchor.constraint(equalTo: movieImage.rightAnchor , constant: 8).isActive = true
        movieSubTitle.topAnchor.constraint(equalTo: movieDate.bottomAnchor , constant: 8).isActive = true
    }
    
    
    func setupSynopsisView() {
        contentView.addSubview(synopsisView)
        synopsisView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        synopsisView.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 8).isActive = true
        synopsisView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        synopsisView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    func setupActorView() {
        contentView.addSubview(actorView)
        actorView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        actorView.topAnchor.constraint(equalTo: synopsisView.bottomAnchor, constant: 8).isActive = true
        actorView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        actorView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupCommentsView() {
        contentView.addSubview(commentsView)
        commentsView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        commentsView.topAnchor.constraint(equalTo: actorView.bottomAnchor, constant: 8).isActive = true
        commentsView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        commentsView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

extension UIView {
    func checkIfAutoLayout() {
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
