//
//  MovieActorCell.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 10/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class MovieActorCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .gray
        setupActorView()
    }
    

    
    
    let actorView = BOView() // SectionView
    let movieActorTitle = BOLabel(title: "감독/출연", size: 20)
    let movieDirector = BOLabel(title: "감독", size: 16, textAlign: .right)
    let movieDirectorlist = BOLabel(title: "강감독", size: 16)
    let movieActor = BOLabel(title: "출연", size: 16, textAlign: .right)
    let movieActorlist = BOLabel(title: "마배우, 윤배우", size: 16)


    func setupActorView() {
        sectionLayout(sectionView: actorView)
        headerLayout(sectionView: actorView, header: movieActorTitle)
        
        actorView.addSubview(movieDirector)
        movieDirector.leftAnchor.constraint(equalTo: actorView.leftAnchor, constant: 16).isActive = true
        movieDirector.topAnchor.constraint(equalTo: movieActorTitle.bottomAnchor, constant: 8).isActive = true
        movieDirector.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        actorView.addSubview(movieDirectorlist)
        movieDirectorlist.leftAnchor.constraint(equalTo: movieDirector.rightAnchor, constant: 16).isActive = true
        movieDirectorlist.topAnchor.constraint(equalTo: movieDirector.topAnchor).isActive = true
        movieDirectorlist.rightAnchor.constraint(equalTo: actorView.rightAnchor).isActive = true
        
        actorView.addSubview(movieActor)
        movieActor.leftAnchor.constraint(equalTo: movieDirector.leftAnchor).isActive = true
        movieActor.topAnchor.constraint(equalTo: movieDirector.bottomAnchor, constant: 8).isActive = true
        movieActor.rightAnchor.constraint(equalTo: movieDirector.rightAnchor).isActive = true
        movieActor.bottomAnchor.constraint(equalTo: actorView.bottomAnchor, constant: -8).isActive = true
        
        actorView.addSubview(movieActorlist)
        movieActorlist.leftAnchor.constraint(equalTo: movieDirectorlist.leftAnchor).isActive = true
        movieActorlist.topAnchor.constraint(equalTo: movieActor.topAnchor).isActive = true
        movieActorlist.rightAnchor.constraint(equalTo: actorView.rightAnchor).isActive = true
        movieActorlist.bottomAnchor.constraint(equalTo: movieActor.bottomAnchor).isActive = true

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
