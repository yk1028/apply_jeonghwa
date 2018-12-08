//
//  TableTabVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 05/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class TableTabVC: UITableViewController {
    
    lazy var list: [MoviesVO] = {
        var datalist = [MoviesVO]()
        return datalist
    }()
    
    

    func getRequestSample() {
        guard let url = URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=1") else { return }
        
        do {
            let apiData = try Data(contentsOf: url)
            let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? ""
            NSLog("API Result=\( log )")

            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            let movie = apiDictionary["movies"] as! NSArray
            
            for row in movie {
                let r = row as! NSDictionary
                let mvo = MoviesVO()
                
                // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.grade = r["grade"] as? Int
                mvo.thumb = r["thumb"] as? String
                mvo.reservation_grade = r["reservation_grade"] as? Int
                mvo.title = r["title"] as? String
                mvo.reservation_rate = r["reservation_grade"] as? Double
                mvo.user_rating = r["user_rating"] as? Double
                mvo.date = r["date"] as? String
                mvo.id = r["title"] as? String
                
                let url: URL! = URL(string: mvo.thumb!)
                let imageData = try! Data(contentsOf: url)
                mvo.movieImage = UIImage(data:imageData)

                self.list.append(mvo)
            }
        }catch { NSLog("Parse Error!!")}
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRequestSample()
        
    
        view.backgroundColor = .white
        customNavigation()
        tableView.register(tableTabCell.self, forCellReuseIdentifier: "cellId")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! tableTabCell
        cell.movieTitle.text = row.title
        cell.movieSubTitle.text = row.thumb
        cell.movieReleaseDate.text = row.date
        cell.movieImage.image = row.movieImage as? UIImage


        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 115
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행: \(indexPath.row)")
        self.navigationController?.pushViewController(MovieDetailVC(), animated: true)
    }

}


class tableTabCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        backgroundColor = .cyan
        self.imageView?.image = UIImage(named: "movieSample")
    }
    
    
    
    var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.text = "영화 제목"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let movieSubTitle: UILabel = {
        let label = UILabel()
        label.text = "평점 : 10 예매순위 : 10 예매율 : 10.10"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let movieReleaseDate: UILabel = {
        let label = UILabel()
        label.text = "개봉일 : 2000-11-11"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
    func setupViews() {
        let insetFromImage: CGFloat = 10
        
        contentView.addSubview(movieImage)
        movieImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: 90).isActive = true
        movieImage.widthAnchor.constraint(equalToConstant: 70).isActive = true

        contentView.addSubview(movieTitle)
        movieTitle.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: insetFromImage).isActive = true
        movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
//        movieTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        contentView.addSubview(movieSubTitle)
        movieSubTitle.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: insetFromImage).isActive = true
        movieSubTitle.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 10).isActive = true
//        movieSubTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        movieSubTitle.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        contentView.addSubview(movieReleaseDate)
        movieReleaseDate.leftAnchor.constraint(equalTo: movieImage.rightAnchor, constant: insetFromImage).isActive = true
        movieReleaseDate.topAnchor.constraint(equalTo: movieSubTitle.bottomAnchor, constant: 10).isActive = true
//        movieReleaseDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        movieReleaseDate.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
