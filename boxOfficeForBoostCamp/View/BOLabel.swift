//
//  BOLabel.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 10/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class BOLabel: UILabel {
    
    init(title: String = "default text", color: UIColor = .black, size: CGFloat = 16, frame: CGRect = .zero, textAlign: NSTextAlignment = .left, lines: Int = 0) {
        super.init(frame: frame)
        checkAutoLayout()
        
        self.text = title
        self.textColor = color
        self.textAlignment = textAlign
        self.font = UIFont.systemFont(ofSize: size)
        self.numberOfLines = lines
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
