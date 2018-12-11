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
        backgroundColor = .gray
        setupSynopsisView()
        
    }
    
    // 섹션2 : 줄거리 뷰
    let synopsisView = BOView()
    let movieSynopsisTitle = BOLabel(title: "줄거리", size: 20)
    let movieSynopsis = BOLabel(title: """
저승 법에 의하면, 모든 인간은 사후 49일 동안 7번의 재판을 거쳐야만 한다. 살인, 나태, 거짓, 불의, 배신, 폭력, 천륜 7개의 지옥에서 7번의 재판을 무사히 통과한 망자만이 환생하여 새로운 삶을 시작할 수 있다.

"김자홍 씨께선, 오늘 예정 대로 무사히 사망하셨습니다"

화재 사고 현장에서 여자아이를 구하고 죽음을 맞이한 소방관 자홍, 그의 앞에 저승차사 해원맥과 덕춘이 나타난다.자신의 죽음이 아직 믿기지도 않는데 덕춘은 정의로운 망자이자 귀인이라며 그를 치켜세운다.
저승으로 가는 입구, 초군문에서 그를 기다리는 또 한 명의 차사 강림, 그는 차사들의 리더이자 앞으로 자홍이 겪어야 할 7개의 재판에서 변호를 맡아줄 변호사이기도 하다.
염라대왕에게 천년 동안 49명의 망자를 환생시키면 자신들 역시 인간으로 환생시켜 주겠다는 약속을 받은 삼차사들, 그들은 자신들이 변호하고 호위해야 하는 48번째 망자이자 19년 만에 나타난 의로운 귀인 자홍의 환생을 확신하지만, 각 지옥에서 자홍의 과거가 하나 둘씩 드러나면서 예상치 못한 고난과 맞닥뜨리는데…

누구나 가지만 아무도 본 적 없는 곳, 새로운 세계의 문이 열린다!
"""
        , size: 16)
    
    
    
    func setupSynopsisView() {
        sectionLayout(sectionView: synopsisView)
        headerLayout(sectionView: synopsisView, header: movieSynopsisTitle)
        
        synopsisView.addSubview(movieSynopsis)
        movieSynopsis.leftAnchor.constraint(equalTo: synopsisView.leftAnchor, constant: 8).isActive = true
        movieSynopsis.topAnchor.constraint(equalTo: movieSynopsisTitle.bottomAnchor, constant: 2).isActive = true
        movieSynopsis.rightAnchor.constraint(equalTo: synopsisView.rightAnchor).isActive = true
        movieSynopsis.bottomAnchor.constraint(equalTo: synopsisView.bottomAnchor).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


