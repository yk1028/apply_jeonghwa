//
//  MovieVO.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 08/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import Foundation
import UIKit

//영화목록
class MoviesVO {
    var grade: Int?    //관람등급
    var thumb: String?    //포스터 이미지 섬네일 주소
    var reservation_grade: Int?    //예매 순위
    var title: String?    //영화제목
    var reservation_rate: Double?    //예매율
    var user_rating: Double?    //사용자 평점
    var date: String?    //개봉일
    var id: String?    //영화 고유 ID
    var movieImage: UIImage?
}

//영화 상세정보
class MovieVO {
    var audience: Int?    //총 관람객수
    var actor: String?    //배우진
    var duration: Int?    //영화 상영 길이
    var director: String?    //감독
    var synopsis: String?    //줄거리
    var genre: String?    //영화 장르
    var grade: Int?    //관람등급
    var image: String?    //포스터 이미지 주소
    var reservation_grade: Int?    //예매순위
    var title: String?    //영화제목
    var reservation_rate: Double?    //예매율
    var user_rating: Double?    //사용자 평점
    var date: String?    //개봉일
    var id: String?    //영화 고유 ID
    var movieImageLarge: UIImage?

}

//한줄평 목록
class CommentsVO {
    var rating: Double?
    var timestamp: Double? //작성일시 UNIX Timestamp 값
    var writer: String? //작성자
    var movie_id: String? //영화 고유ID
    var contents: String? //한줄평 내용
}
