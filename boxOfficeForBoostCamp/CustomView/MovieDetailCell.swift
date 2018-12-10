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
        
        // 시놉시스와 정보뷰 순서 주의 - 시놉시스뷰는 길이에 따라 동적으로 변해야 함
        setupSynopsisView()
        setupInfoView()

//        setupActorView()
//        setupCommentsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

    let movieReservationRateTitle = BOLabel(title: "예매율", size: 14)
    let movieReservationRate = BOLabel(title: "1위 35.5%", size: 14)
    let movieUserRatingTitle = BOLabel(title: "평점", size: 14)
    let movieUserRating = BOLabel(title: "7.98", size: 14)
    let movieAudienceTitle = BOLabel(title: "누적관객수", size: 14)
    let movieAudience = BOLabel(title: "11,676,822", size: 14)
    
    // 섹션2 : 줄거리 뷰
    let synopsisView = BOView()
    let movieSynopsisTitle = BOLabel(title: "줄거리", size: 16)
    let movieSynopsis = BOLabel(title: """
저승 법에 의하면, 모든 인간은 사후 49일 동안 7번의 재판을 거쳐야만 한다. 살인, 나태, 거짓, 불의, 배신, 폭력, 천륜 7개의 지옥에서 7번의 재판을 무사히 통과한 망자만이 환생하여 새로운 삶을 시작할 수 있다.

"김자홍 씨께선, 오늘 예정 대로 무사히 사망하셨습니다"

화재 사고 현장에서 여자아이를 구하고 죽음을 맞이한 소방관 자홍, 그의 앞에 저승차사 해원맥과 덕춘이 나타난다.자신의 죽음이 아직 믿기지도 않는데 덕춘은 정의로운 망자이자 귀인이라며 그를 치켜세운다.
저승으로 가는 입구, 초군문에서 그를 기다리는 또 한 명의 차사 강림, 그는 차사들의 리더이자 앞으로 자홍이 겪어야 할 7개의 재판에서 변호를 맡아줄 변호사이기도 하다.
염라대왕에게 천년 동안 49명의 망자를 환생시키면 자신들 역시 인간으로 환생시켜 주겠다는 약속을 받은 삼차사들, 그들은 자신들이 변호하고 호위해야 하는 48번째 망자이자 19년 만에 나타난 의로운 귀인 자홍의 환생을 확신하지만, 각 지옥에서 자홍의 과거가 하나 둘씩 드러나면서 예상치 못한 고난과 맞닥뜨리는데…

누구나 가지만 아무도 본 적 없는 곳, 새로운 세계의 문이 열린다!
"""
        , size: 16)


    
    // 섹션3 : 줄거리 뷰
    let actorView = BOView()

    
    // 섹션4 : 한줄평 뷰(테이블)
    let commentsView = BOView()


    
    func setupInfoView() {
        // 섹션1-1 : 영화 기본정보 뷰(포스터, 기본정보)
        synopsisView.addSubview(infoView)
        infoView.leftAnchor.constraint(equalTo: synopsisView.leftAnchor).isActive = true
        infoView.topAnchor.constraint(equalTo: synopsisView.topAnchor).isActive = true
        infoView.rightAnchor.constraint(equalTo: synopsisView.rightAnchor).isActive = true
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
        
        // 섹션1-2 : 영화 기본정보 뷰(예매율, 평점, 누적관객수)
        infoView.addSubview(InfoViewBottom1)
        InfoViewBottom1.leftAnchor.constraint(equalTo: infoView.leftAnchor).isActive = true
        InfoViewBottom1.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        InfoViewBottom1.bottomAnchor.constraint(equalTo: infoView.bottomAnchor).isActive = true
        InfoViewBottom1.widthAnchor.constraint(equalToConstant: screenWidth / 3).isActive = true
        infoView.addSubview(InfoViewBottom2)
        InfoViewBottom2.leftAnchor.constraint(equalTo: InfoViewBottom1.rightAnchor).isActive = true
        InfoViewBottom2.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        InfoViewBottom2.bottomAnchor.constraint(equalTo: infoView.bottomAnchor).isActive = true
        InfoViewBottom2.widthAnchor.constraint(equalToConstant: screenWidth / 3).isActive = true
        infoView.addSubview(InfoViewBottom3)
        InfoViewBottom3.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        InfoViewBottom3.rightAnchor.constraint(equalTo: infoView.rightAnchor).isActive = true
        InfoViewBottom3.bottomAnchor.constraint(equalTo: infoView.bottomAnchor).isActive = true
        InfoViewBottom3.leftAnchor.constraint(equalTo: InfoViewBottom2.rightAnchor).isActive = true
        
        
    }
    
    func setupSynopsisView() {
        contentView.addSubview(synopsisView)
        synopsisView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        synopsisView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        synopsisView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        synopsisView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
//        synopsisView.addSubview(movieSynopsis)

        synopsisView.addSubview(movieSynopsis)
        movieSynopsis.leftAnchor.constraint(equalTo: synopsisView.leftAnchor).isActive = true
        movieSynopsis.topAnchor.constraint(equalTo: synopsisView.topAnchor, constant: 8).isActive = true
        movieSynopsis.rightAnchor.constraint(equalTo: synopsisView.rightAnchor).isActive = true
        movieSynopsis.bottomAnchor.constraint(equalTo: synopsisView.bottomAnchor).isActive = true
    }

    

    func setupActorView() {
        contentView.addSubview(actorView)
        actorView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        actorView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8).isActive = true
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
