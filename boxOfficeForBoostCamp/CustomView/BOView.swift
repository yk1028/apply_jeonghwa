//
//  BOView.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 10/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class BOView: UIView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }

        backgroundColor = getRandomColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    

}
