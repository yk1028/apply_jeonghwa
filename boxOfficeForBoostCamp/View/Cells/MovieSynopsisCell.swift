//
//  MovieSynopsisCell.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 10/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class MovieSynopsisCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .detailCellBackground
        setupSynopsisView()
        
    }
    
    // 섹션2 : 줄거리 뷰
    let synopsisView = BOView() // SectionView
    let movieSynopsis = BOLabel(title: " "
        , size: 16)
    
    
    
    func setupSynopsisView() {
        sectionLayout(sectionView: synopsisView)
        synopsisView.addSubview(movieSynopsis)
        movieSynopsis.leftAnchor.constraint(equalTo: synopsisView.leftAnchor, constant: 16).isActive = true
        movieSynopsis.topAnchor.constraint(equalTo: synopsisView.topAnchor, constant: 8).isActive = true
        movieSynopsis.rightAnchor.constraint(equalTo: synopsisView.rightAnchor, constant: -8).isActive = true
        movieSynopsis.bottomAnchor.constraint(equalTo: synopsisView.bottomAnchor, constant: -8).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


