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
        backgroundColor = .gray

        setupInfoView()
    }
    
    let screenWidth = UIScreen.main.bounds.width
    
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
    let InfoViewBottom1 = BOView()
    let InfoViewBottom2 = BOView()
    let InfoViewBottom3 = BOView()

    let sizeIVBTitle = 14
    let sizeIVBContent = 14
    let movieReservationRateTitle = BOLabel(title: "예매율", size: 14, textAlign: .center)
    let movieReservationRate = BOLabel(title: "1위 35.5%", size: 12, textAlign: .center)
    let movieUserRatingTitle = BOLabel(title: "평점", size: 14, textAlign: .center)
    let movieUserRating = BOLabel(title: "7.98", size: 12, textAlign: .center)
    let movieUserRatingStar = StarView(starSize: 16, userRating: 7.98)
    
    let movieAudienceTitle = BOLabel(title: "누적관객수", size: 14, textAlign: .center)
    let movieAudience = BOLabel(title: "11,676,822", size: 12, textAlign: .center)
    


    
    func setupInfoView() {
        // 섹션1-1 : 영화 기본정보 뷰(포스터, 기본정보)
        contentView.addSubview(infoView)
        infoView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        infoView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        infoView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

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
        
        // 섹션1-2 : 영화 기본정보 뷰(예매율, 평점, 누적관객수)
        infoView.addSubview(InfoViewBottom1)
        InfoViewBottom1.leftAnchor.constraint(equalTo: infoView.leftAnchor).isActive = true
        InfoViewBottom1.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        InfoViewBottom1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        InfoViewBottom1.widthAnchor.constraint(equalToConstant: screenWidth / 3).isActive = true
        
        
        InfoViewBottom1.addSubview(movieReservationRateTitle)
        movieReservationRateTitle.leftAnchor.constraint(equalTo: InfoViewBottom1.leftAnchor).isActive = true
        movieReservationRateTitle.topAnchor.constraint(equalTo: InfoViewBottom1.topAnchor, constant: 14).isActive = true
        movieReservationRateTitle.rightAnchor.constraint(equalTo: InfoViewBottom1.rightAnchor).isActive = true
        
        InfoViewBottom1.addSubview(movieReservationRate)
        movieReservationRate.leftAnchor.constraint(equalTo: InfoViewBottom1.leftAnchor).isActive = true
        movieReservationRate.topAnchor.constraint(equalTo: movieReservationRateTitle.bottomAnchor, constant: 8).isActive = true
        movieReservationRate.rightAnchor.constraint(equalTo: InfoViewBottom1.rightAnchor).isActive = true
        movieReservationRate.bottomAnchor.constraint(equalTo: InfoViewBottom1.bottomAnchor, constant: -14).isActive = true
        
        
        infoView.addSubview(InfoViewBottom2)
        InfoViewBottom2.leftAnchor.constraint(equalTo: InfoViewBottom1.rightAnchor).isActive = true
        InfoViewBottom2.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        InfoViewBottom2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        InfoViewBottom2.widthAnchor.constraint(equalToConstant: screenWidth / 3).isActive = true
        
        InfoViewBottom2.addSubview(movieUserRatingTitle)
        movieUserRatingTitle.leftAnchor.constraint(equalTo: InfoViewBottom2.leftAnchor).isActive = true
        movieUserRatingTitle.topAnchor.constraint(equalTo: InfoViewBottom2.topAnchor, constant: 10).isActive = true
        movieUserRatingTitle.rightAnchor.constraint(equalTo: InfoViewBottom2.rightAnchor).isActive = true
        
        InfoViewBottom2.addSubview(movieUserRating)
        movieUserRating.leftAnchor.constraint(equalTo: InfoViewBottom2.leftAnchor).isActive = true
        movieUserRating.topAnchor.constraint(equalTo: movieUserRatingTitle.bottomAnchor, constant: 4).isActive = true
        movieUserRating.rightAnchor.constraint(equalTo: InfoViewBottom2.rightAnchor).isActive = true
        
        InfoViewBottom2.addSubview(movieUserRatingStar)
        movieUserRatingStar.topAnchor.constraint(equalTo: movieUserRating.bottomAnchor, constant: 2).isActive = true
        movieUserRatingStar.bottomAnchor.constraint(equalTo: InfoViewBottom2.bottomAnchor, constant: -6).isActive = true
        movieUserRatingStar.centerXAnchor.constraint(equalTo: InfoViewBottom2.centerXAnchor, constant: -40).isActive = true //constant = starSize * 2.5
        
        infoView.addSubview(InfoViewBottom3)
        InfoViewBottom3.leftAnchor.constraint(equalTo: InfoViewBottom2.rightAnchor).isActive = true
        InfoViewBottom3.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        InfoViewBottom3.rightAnchor.constraint(equalTo: infoView.rightAnchor).isActive = true
        InfoViewBottom3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        InfoViewBottom3.addSubview(movieAudienceTitle)
        movieAudienceTitle.leftAnchor.constraint(equalTo: InfoViewBottom3.leftAnchor).isActive = true
        movieAudienceTitle.topAnchor.constraint(equalTo: InfoViewBottom3.topAnchor, constant: 14).isActive = true
        movieAudienceTitle.rightAnchor.constraint(equalTo: InfoViewBottom3.rightAnchor).isActive = true
        
        InfoViewBottom3.addSubview(movieAudience)
        movieAudience.leftAnchor.constraint(equalTo: InfoViewBottom3.leftAnchor).isActive = true
        movieAudience.topAnchor.constraint(equalTo: movieAudienceTitle.bottomAnchor, constant: 8).isActive = true
        movieAudience.rightAnchor.constraint(equalTo: InfoViewBottom3.rightAnchor).isActive = true
        movieAudience.bottomAnchor.constraint(equalTo: InfoViewBottom3.bottomAnchor, constant: -14).isActive = true
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


