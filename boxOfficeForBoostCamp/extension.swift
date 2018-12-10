//
//  extension.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 09/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit


extension UITableViewCell {
    func sectionLayout(sectionView: UIView) {
        contentView.addSubview(sectionView)
        sectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        sectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        sectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        sectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    func headerLayout(sectionView: UIView, header: UIView){
        sectionView.addSubview(header)
        header.leftAnchor.constraint(equalTo: sectionView.leftAnchor, constant: 4).isActive = true
        header.topAnchor.constraint(equalTo: sectionView.topAnchor, constant: 8).isActive = true
        header.rightAnchor.constraint(equalTo: sectionView.rightAnchor).isActive = true
    }
}
