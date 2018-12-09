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
    
    

    func getMoviesRequestSample() {
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
                
                mvo.grade = r["grade"] as? Int
                mvo.thumb = r["thumb"] as? String
                mvo.reservation_grade = r["reservation_grade"] as? Int
                mvo.title = r["title"] as? String
                mvo.reservation_rate = r["reservation_rate"] as? Double
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
        getMoviesRequestSample()
        view.backgroundColor = .white
        customNavigation()
        self.tableView.register(tableTabCell.self, forCellReuseIdentifier: "cellId")
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! tableTabCell
        cell.movieTitle.text = row.title
        cell.movieGrade.text = "\(row.grade!)"
// 옵셔널 강제 해제 말고 다른방법??
        cell.movieSubTitle.text = "평점 : \(row.user_rating!) 예매순위 : \(row.reservation_grade!) 예매율 : \(row.reservation_rate!)"
        cell.movieReleaseDate.text = "개봉일 : \(row.date!)"
        cell.movieImage.image = row.movieImage


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
