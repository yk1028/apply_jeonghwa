//
//  StarRating.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 12/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class StarView: UIView {
    let star1 = UIImageView()
    let star2 = UIImageView()
    let star3 = UIImageView()
    let star4 = UIImageView()
    let star5 = UIImageView()
    var fiveStar : [UIImageView] = []
    let starHalf = UIImageView()


    init(frame: CGRect = .zero, starSize: CGFloat = 50, userRating: Double = 0){
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        fiveStar = [star1 ,star2, star3, star4, star5]
        let halfLocation: CGFloat = CGFloat(ceil(floor(userRating) / 2)) // 반쪽 별이 그려질 위치
        let fullLocation: Int = Int(floor(userRating / 2)) // 노란 별이 그려지는 개수
        var i = 0
        
        backgroundColor = .cyan
        // 노란색 별을 그린다
        for star in fiveStar[0 ..< fullLocation] {
            starImageView(imageView: star, location: starSize * CGFloat(i), starSize)
            addSubview(star)
            i += 1
        }
        
        // 다음 위치부터 회색 별을 그린다
        for star in fiveStar[i ..< 5] {
            starImageView(imageView: star, location: starSize * CGFloat(i), starSize, color: .starGray)
            addSubview(star)
            i += 1
        }
        
        // 반쪽 별을 그 위에 그린다
        starHalfImageView(halfLocation, starSize)
        addSubview(starHalf)
        
    }
    
    
    // 별 이미지뷰
    func starImageView(imageView: UIImageView, location x: CGFloat = 0, _ starSize: CGFloat = 30, color: UIColor = .starYellow) {
        imageView.image = UIImage(named: "star")
        imageView.setImageColor(color: color)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: x, y: 0, width: starSize, height: starSize)
    }

    // 반쪽 별 이미지뷰
    func starHalfImageView(_ location: CGFloat = 0, _ starSize: CGFloat = 30) {
        // 이미지가 들어가는 자리를 검사한다
        starHalf.isHidden = location < 1 || location > 5 ?  true : false
        
        let starToCrop : UIImage = UIImage(named: "star")!
        let width: CGFloat = starToCrop.size.width / 2
        let height: CGFloat = starToCrop.size.height
        
        // 별 이미지를 반으로 쪼개서 저장한다
        let croppedStar: CGImage = starToCrop.cgImage!.cropping(to: CGRect(x: 0, y: 0, width: width, height: height))!
        let halfStar: UIImage = UIImage(cgImage: croppedStar)
        
        starHalf.image = halfStar
        starHalf.setImageColor(color: .starYellow)
        starHalf.contentMode = .scaleAspectFit
        let halfStarOffset: CGFloat = -starSize / 4
        let halfStarLocation: CGFloat = starSize * (location - 1)
        starHalf.frame = CGRect(x: halfStarOffset + halfStarLocation, y: 0, width: starSize, height: starSize)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
