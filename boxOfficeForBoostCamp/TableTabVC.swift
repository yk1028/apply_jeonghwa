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
        self.tableView.register(tableTabCell.self, forCellReuseIdentifier: "cellId")
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
