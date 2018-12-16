//
//  CollectionTabVC.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 05/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class CollectionTabVC: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .gray
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        
        return refreshControl
    }()
    
    @objc func requestData() {
        print("requesting data")
        getMoviesRequestSample()
        refresher.endRefreshing()
    }
    
    var orderType : Int = 0

    lazy var list: [MoviesVO] = {
        var datalist = [MoviesVO]()
        return datalist
    }()
    
lazy var tabCollectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.backgroundColor = .white
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
}()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("CollectionTabVC : viewDidLoad")
        customNavigation()
        configureTabCollectionView()
        tabCollectionView.refreshControl = refresher
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("CollectionTabVC : viewWillAppear")
        getMoviesRequestSample()
    }
    
    func getMoviesRequestSample() {
        list = []
        let ad = UIApplication.shared.delegate as? AppDelegate
        if let type = ad?.movieOrderType {
            orderType = type
        }
        
        guard let url = URL(string: "http://connect-boxoffice.run.goorm.io/movies?order_type=\(orderType)") else { return }
        do {
            let apiData = try Data(contentsOf: url)
            //            let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? ""
            //            NSLog("API Result=\( log )")
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
                mvo.id = r["id"] as? String
                
                let url: URL! = URL(string: mvo.thumb!)
                let imageData = try! Data(contentsOf: url)
                mvo.movieImage = UIImage(data:imageData)
                
                self.list.append(mvo)
                self.tabCollectionView.reloadData()
            }
        }catch {
            NSLog("Parse Error!!")
            networkAlert()
        }
    }

    
    private func configureTabCollectionView() {
        view.addSubview(tabCollectionView)
        tabCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tabCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabCollectionView.register(TabCollectionCell.self, forCellWithReuseIdentifier: "cellID")
    }
}


extension CollectionTabVC {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = self.list[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! TabCollectionCell
        cell.movieTitle.text = row.title
        let age = "age" + String(row.grade!)
        cell.movieGrade.image = UIImage(named: age)
        cell.movieSubTitle.text  = "\(row.reservation_grade!)위(\(row.user_rating!)) / \(row.reservation_rate!)%"
        cell.movieImage.image = row.movieImage
        cell.movieReleaseDate.text = "\(row.date!)"


        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2 - 10, height: UIScreen.main.bounds.height / 2 + 24)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(MovieDetailVC(), animated: true)
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        ad?.movieId = list[indexPath.row].id
    }

}



class TabCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    let movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieGrade: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "age0")!
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        let size: CGFloat = 30
        imageView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        imageView.layer.cornerRadius = size / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    let movieTitle = BOLabel(title: "영화 제목", size: 22, textAlign: .center, lines: 2)
    let movieSubTitle = BOLabel(title: "0위(00.00) / 00.0%", size: 14, textAlign: .center)
    let movieReleaseDate = BOLabel(title: "2000-11-11", size: 12, textAlign: .center)
    
    let imageWidth = UIScreen.main.bounds.width / 2 - 40
    
    
    
    func configureViews() {
        addSubview(movieImage)
        movieImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        movieImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        movieImage.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2 - 32) * CGFloat(2.squareRoot())).isActive = true
        
        addSubview(movieGrade)
        movieGrade.topAnchor.constraint(equalTo: movieImage.topAnchor, constant: 3).isActive = true
        movieGrade.rightAnchor.constraint(equalTo: movieImage.rightAnchor, constant: -6).isActive = true
        movieGrade.heightAnchor.constraint(equalToConstant: 30).isActive = true
        movieGrade.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(movieTitle)
        movieTitle.leftAnchor.constraint(equalTo: movieImage.leftAnchor).isActive = true
        movieTitle.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8).isActive = true
        movieTitle.rightAnchor.constraint(equalTo: movieImage.rightAnchor).isActive = true

        addSubview(movieSubTitle)
        movieSubTitle.leftAnchor.constraint(equalTo: movieImage.leftAnchor).isActive = true
        movieSubTitle.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 8).isActive = true
        movieSubTitle.rightAnchor.constraint(equalTo: movieImage.rightAnchor).isActive = true
        
        addSubview(movieReleaseDate)
        movieReleaseDate.leftAnchor.constraint(equalTo: movieImage.leftAnchor).isActive = true
        movieReleaseDate.topAnchor.constraint(equalTo: movieSubTitle.bottomAnchor, constant: 8).isActive = true
        movieReleaseDate.rightAnchor.constraint(equalTo: movieImage.rightAnchor).isActive = true
//        movieReleaseDate.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

