//
//  StarRating.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 12/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class StarView: UIView {
    
    let starYellow: UIColor = UIColor.init(red: 240, green: 155, blue: 64)
    let starGray: UIColor = UIColor.init(red: 234, green: 234, blue: 234)
    
    let fiveStar : [UIImageView] = []
    let star1 = UIImageView()
    let star2 = UIImageView()
    let star3 = UIImageView()
    let star4 = UIImageView()
    let star5 = UIImageView()
    let starHalf = UIImageView()

    init(frame: CGRect = .zero, starSize: CGFloat = 50, halfLocation: CGFloat = 3, userRating: Float = 7.43){
        super.init(frame: frame)
        checkAutoLayout()
        
        if userRating < 8 {
            
        } else {
            
        }
        
        starImageView(imageView: star1, location: starSize * CGFloat(0), starSize)
        starImageView(imageView: star2, location: starSize * CGFloat(1), starSize)
        starImageView(imageView: star3, location: starSize * CGFloat(2), starSize)
        starImageView(imageView: star4, location: starSize * CGFloat(3), starSize)
        starImageView(imageView: star5, location: starSize * CGFloat(4), starSize)
        addSubview(star1)
        addSubview(star2)
        addSubview(star3)
        addSubview(star4)
        addSubview(star5)
        starHalfImageView(halfLocation, starSize)
        addSubview(starHalf)
        
    }
    
    
    func starImageView(imageView: UIImageView, location x: CGFloat = 0, _ starSize: CGFloat = 30) {
        imageView.image = UIImage(named: "star")
        imageView.setImageColor(color: starGray)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: x, y: 0, width: starSize, height: starSize)
    }

    func starHalfImageView(_ location: CGFloat = 0, _ starSize: CGFloat = 30) {
        // 이미지가 들어가는 자리를 검사한다
        starHalf.isHidden = location < 0 || location > 4 ?  true : false
        
        let starToCrop : UIImage = UIImage(named: "star")!
        let width: CGFloat = starToCrop.size.width / 2
        let height: CGFloat = starToCrop.size.height
        
        // 별 이미지를 반으로 쪼개서 저장한다
        let croppedStar: CGImage = starToCrop.cgImage!.cropping(to: CGRect(x: 0, y: 0, width: width, height: height))!
        let halfStar: UIImage = UIImage(cgImage: croppedStar)
        
        starHalf.image = halfStar
        starHalf.setImageColor(color: starYellow)
        starHalf.contentMode = .scaleAspectFit
        let halfStarOffset: CGFloat = -starSize / 4
        let halfStarLocation: CGFloat = starSize * (location - 1)
        starHalf.frame = CGRect(x: halfStarOffset + halfStarLocation, y: 0, width: starSize, height: starSize)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}








class StarRating: UIViewController {
    
    let sstt = StarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(sstt)
        sstt.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        sstt.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        sstt.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        sstt.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    

    
}

