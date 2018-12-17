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
        backgroundColor = .detailCellBackground
        setupInfoView()
    }
    
    let screenWidth = UIScreen.main.bounds.width
    
    // 1 : 영화 기본정보 뷰(포스터, 기본정보)
    let infoView = BOView()
    let infoViewHeader = BOLabel(size: 22)
    let movieTitle = BOLabel(size: 22)
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
    let movieDate = BOLabel(size: 16)
    let movieSubTitle = BOLabel(title: "판타지, 드라마/139분", size: 16)
    let movieImageFull: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // 2 : 영화 기본정보 뷰(예매율, 평점, 누적관객수)
    let InfoViewBottom1 = BOView()
    let InfoViewBottom2 = BOView()
    let InfoViewBottom3 = BOView()

    let sizeIVBTitle = 14
    let sizeIVBContent = 14
    let movieReservationRateTitle = BOLabel(title: "예매율", size: 14, textAlign: .center)
    let movieReservationRate = BOLabel(size: 12, textAlign: .center)
    let movieUserRatingTitle = BOLabel(title: "평점", size: 14, textAlign: .center)
    let movieUserRating = BOLabel(size: 12, textAlign: .center)
    var movieUserRatingStar = UIView()
    let movieAudienceTitle = BOLabel(title: "누적관객수", size: 14, textAlign: .center)
    let movieAudience = BOLabel(size: 12, textAlign: .center)
    


    
    func setupInfoView() {
        // 1 : 영화 기본정보 뷰(포스터, 기본정보)
        sectionLayout(sectionView: infoView)
        infoView.addSubview(movieImageFull)
        movieImageFull.leftAnchor.constraint(equalTo: infoView.leftAnchor , constant: 8).isActive = true
        movieImageFull.topAnchor.constraint(equalTo: infoView.topAnchor , constant: 8).isActive = true
        movieImageFull.widthAnchor.constraint(equalToConstant: 110).isActive = true
        movieImageFull.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
        movieImageFull.addSubview(movieImage)
        movieImage.leftAnchor.constraint(equalTo: movieImageFull.leftAnchor).isActive = true
        movieImage.topAnchor.constraint(equalTo: movieImageFull.topAnchor).isActive = true
        movieImage.rightAnchor.constraint(equalTo: movieImageFull.rightAnchor).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: movieImageFull.bottomAnchor).isActive = true

        
        infoView.addSubview(movieTitle)
        movieTitle.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: 8).isActive = true
        movieTitle.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 30).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: infoView.rightAnchor, constant: -30).isActive = true

        infoView.addSubview(movieGrade)
        movieGrade.leftAnchor.constraint(equalTo: movieTitle.rightAnchor).isActive = true
        movieGrade.topAnchor.constraint(equalTo: movieTitle.topAnchor).isActive = true



        infoView.addSubview(movieDate)
        movieDate.leftAnchor.constraint(equalTo: movieTitle.leftAnchor).isActive = true
        movieDate.topAnchor.constraint(equalTo: movieTitle.bottomAnchor , constant: 8).isActive = true
        movieDate.rightAnchor.constraint(equalTo: infoView.rightAnchor).isActive = true

        infoView.addSubview(movieSubTitle)
        movieSubTitle.leftAnchor.constraint(equalTo: movieTitle.leftAnchor).isActive = true
        movieSubTitle.topAnchor.constraint(equalTo: movieDate.bottomAnchor , constant: 8).isActive = true
        movieSubTitle.rightAnchor.constraint(equalTo: infoView.rightAnchor).isActive = true

        
        // 2 : 영화 기본정보 뷰(예매율, 평점, 누적관객수)
        infoView.addSubview(InfoViewBottom1)
        InfoViewBottom1.leftAnchor.constraint(equalTo: infoView.leftAnchor).isActive = true
        InfoViewBottom1.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        InfoViewBottom1.bottomAnchor.constraint(equalTo: infoView.bottomAnchor).isActive = true
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
        InfoViewBottom2.bottomAnchor.constraint(equalTo: InfoViewBottom1.bottomAnchor).isActive = true
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
        movieUserRatingStar.translatesAutoresizingMaskIntoConstraints = false
        movieUserRatingStar.topAnchor.constraint(equalTo: movieUserRating.bottomAnchor, constant: 2).isActive = true
        movieUserRatingStar.bottomAnchor.constraint(equalTo: InfoViewBottom2.bottomAnchor, constant: -6).isActive = true
        movieUserRatingStar.centerXAnchor.constraint(equalTo: InfoViewBottom2.centerXAnchor, constant: -32.5).isActive = true //constant = starSize * 2.5
        
        infoView.addSubview(InfoViewBottom3)
        InfoViewBottom3.leftAnchor.constraint(equalTo: InfoViewBottom2.rightAnchor).isActive = true
        InfoViewBottom3.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        InfoViewBottom3.rightAnchor.constraint(equalTo: infoView.rightAnchor).isActive = true
        InfoViewBottom3.bottomAnchor.constraint(equalTo: InfoViewBottom1.bottomAnchor).isActive = true
        
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



