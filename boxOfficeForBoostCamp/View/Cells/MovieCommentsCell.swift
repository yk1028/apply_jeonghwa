//
//  MovieCommentsCell.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 10/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class MovieCommentsCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupCommentsView()
        
    }
    

    

    
    // 섹션4 : 한줄평 뷰(테이블)
    let commentsView = BOView() // SectionView
    let commentsTitle = BOLabel(title: "한줄평", size: 20)
    let userName = BOLabel(title: "닉네임", size: 16)
    let userRatingStar = StarView(starSize: 16, userRating: 7.98)
    let commentTime = BOLabel(title: "2000-00-00 00:00:00", size: 16)
    let commentContents = BOLabel(title: "음 이 영화는요 10점 만점에 9점을 줄 수 있겠구요. 아주 재밌게 봤습니다.", size: 16)
    let userThumb: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userProfile")
        imageView.setImageColor(color: .userProfile)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func setupCommentsView() {
        sectionLayout(sectionView: commentsView)
//        headerLayout(sectionView: commentsView, header: commentsTitle)

        // 한줄평(섹션 헤더)을 구현해야 함...
//        headerLayout(sectionView: commentsView, header: commentsTitle)
        
        commentsView.addSubview(userThumb)
        userThumb.leftAnchor.constraint(equalTo: commentsView.leftAnchor, constant: 8).isActive = true
        userThumb.topAnchor.constraint(equalTo: commentsView.topAnchor, constant: 30).isActive = true
        userThumb.widthAnchor.constraint(equalToConstant: 70).isActive = true
        userThumb.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        commentsView.addSubview(userName)
        userName.leftAnchor.constraint(equalTo: userThumb.rightAnchor, constant: 8).isActive = true
        userName.topAnchor.constraint(equalTo: userThumb.topAnchor).isActive = true
       
        commentsView.addSubview(userRatingStar)
        userRatingStar.leftAnchor.constraint(equalTo: userName.rightAnchor, constant: 8).isActive = true
        userRatingStar.topAnchor.constraint(equalTo: userThumb.topAnchor).isActive = true
        
        commentsView.addSubview(commentTime)
        commentTime.leftAnchor.constraint(equalTo: userName.leftAnchor).isActive = true
        commentTime.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 8).isActive = true
        commentTime.rightAnchor.constraint(equalTo: commentsView.rightAnchor).isActive = true

        commentsView.addSubview(commentContents)
        commentContents.leftAnchor.constraint(equalTo: userName.leftAnchor).isActive = true
        commentContents.topAnchor.constraint(equalTo: commentTime.bottomAnchor, constant: 8).isActive = true
        commentContents.rightAnchor.constraint(equalTo: commentsView.rightAnchor, constant: 8).isActive = true
        commentContents.bottomAnchor.constraint(equalTo: commentsView.bottomAnchor, constant: -40).isActive = true

    }
 
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


