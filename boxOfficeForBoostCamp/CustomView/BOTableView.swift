//
//  BOTableView.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 10/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class BOTableView: UITableView {
    
    
    override init(frame: CGRect , style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        backgroundColor = .white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
