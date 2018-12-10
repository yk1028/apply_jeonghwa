//
//  BOLabel.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 10/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class BOLabel: UILabel {
    
    init(title: String = "default text", color: UIColor = .black, size: CGFloat = 22, frame: CGRect = .zero, textAlign: NSTextAlignment = .left) {
        super.init(frame: frame)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.text = title
        self.textColor = color
        self.textAlignment = textAlign
        self.font = UIFont.systemFont(ofSize: size)
        self.numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
