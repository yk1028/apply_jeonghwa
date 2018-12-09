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
            label.text = "신과함께-죄와벌"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 22)
            return label
        }()
    
        let movieGrade: UILabel = {
            let label = UILabel()
            label.text = "12"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 22)
            return label
        }()
    
        let movieDate: UILabel = {
            let label = UILabel()
            label.text = "2017-12-20개봉"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
    
        let movieSubTitle: UILabel = {
            let label = UILabel()
            label.text = "판타지, 드라마/139분"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()
    
    
        let movieReservationRateView: UIView = {
            let movieReservationRateView = UIView()
            movieReservationRateView.backgroundColor = .black
            movieReservationRateView.translatesAutoresizingMaskIntoConstraints = false
            return movieReservationRateView
        }()
    
            let movieReservationRateTitle: UILabel = {
                let label = UILabel()
                label.text = "예매율"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont.systemFont(ofSize: 14)
                return label
            }()
    
            let movieReservationRate: UILabel = {
                let label = UILabel()
                label.text = "1위 35.5%"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont.systemFont(ofSize: 14)
                return label
            }()
    
    let movieUserRatingTitleView: UIView = {
        let movieUserRatingTitleView = UIView()
        movieUserRatingTitleView.backgroundColor = .black
        movieUserRatingTitleView.translatesAutoresizingMaskIntoConstraints = false
        return movieUserRatingTitleView
    }()
    
    let movieUserRatingTitle: UILabel = {
        let label = UILabel()
        label.text = "평점"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let movieUserRating: UILabel = {
        let label = UILabel()
        label.text = "7.98"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let movieAudienceTitle: UILabel = {
        let label = UILabel()
        label.text = "누적관객수"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let movieAudience: UILabel = {
        let label = UILabel()
        label.text = "11,676,822"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    // 섹션2 : 줄거리 뷰
    let synopsisView: UIView = {
        let synopsisView = UIView()
        synopsisView.backgroundColor = .orange
        synopsisView.translatesAutoresizingMaskIntoConstraints = false
        return synopsisView
    }()
    
    
    // 섹션3 : 줄거리 뷰
    let actorView: UIView = {
        let actorView = UIView()
        actorView.backgroundColor = .yellow
        actorView.translatesAutoresizingMaskIntoConstraints = false
        return actorView
    }()
    
    
    // 섹션4 : 한줄평 뷰(테이블)
    let commentsView: UIView = {
        let commentsView = UIView()
        commentsView.backgroundColor = .green
        commentsView.translatesAutoresizingMaskIntoConstraints = false
        return commentsView
    }()
    
    
    
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
