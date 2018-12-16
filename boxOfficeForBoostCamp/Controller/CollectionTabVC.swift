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
        vc.getMoviesRequestSample()
        refresher.endRefreshing()
        self.tabCollectionView.reloadData()
    }
    
    
    let vc = TabAndCollection()

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
        vc.getMoviesRequestSample()
        self.tabCollectionView.reloadData()
    }
  
    private func configureTabCollectionView() {
        view.addSubview(tabCollectionView)
        tabCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tabCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tabCollectionView.register(TabCollectionCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    @objc override func btnSort() {
        let movieOrder = UIAlertController(title: "정렬방식 선택", message: "영화를 어떤 순서로 정렬할까요?", preferredStyle: .actionSheet)
        let ad = UIApplication.shared.delegate as? AppDelegate

        let typeZero = UIAlertAction(title: "예매율", style: .default) { (_) in
            ad?.movieOrderType = 0
            self.navigationItem.title = "예매율순"
            self.vc.getMoviesRequestSample()
            self.tabCollectionView.reloadData()

        }

        let typeOne = UIAlertAction(title: "큐레이션", style: .default){ (_) in
            ad?.movieOrderType = 1
            self.navigationItem.title = "큐레이션순"
            self.vc.getMoviesRequestSample()
            self.tabCollectionView.reloadData()

        }

        let typeTwo = UIAlertAction(title: "개봉일", style: .default){ (_) in
            ad?.movieOrderType = 2
            self.navigationItem.title = "개봉일순"
            self.vc.getMoviesRequestSample()
            self.tabCollectionView.reloadData()
        }

        let cancel = UIAlertAction(title: "취소", style: .cancel)

        movieOrder.addAction(typeZero)
        movieOrder.addAction(typeOne)
        movieOrder.addAction(typeTwo)
        movieOrder.addAction(cancel)
        self.present(movieOrder, animated: false)
    }

}


extension CollectionTabVC {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vc.list.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = vc.list[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! TabCollectionCell
        cell.movieTitle.text = row.title
        let age = "age" + String(row.grade!)
        cell.movieGrade.image = UIImage(named: age)
        cell.movieSubTitle.text  = "\(row.reservation_grade!)위(\(row.user_rating!)) / \(row.reservation_rate!)%"
//        cell.movieImage.image = row.movieImage
        cell.movieReleaseDate.text = "\(row.date!)"
        
        let asyncImageView = AsyncImageView(frame: CGRect(x: 0, y: 0, width: (orientation() - CGFloat(24)), height: (orientation() - CGFloat(32)) * CGFloat(2.squareRoot())))
        asyncImageView.loadImage(urlString: "\(row.thumb!)")
        cell.movieImage.addSubview(asyncImageView)
        return cell
    }
    
    
    func orientation() -> CGFloat {
        if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
            return UIScreen.main.bounds.width / 2
        } else {
            return UIScreen.main.bounds.height / 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var sizeOne = UIScreen.main.bounds.width / 2 - 10
        var sizeTwo = UIScreen.main.bounds.height / 2 - 10
        if sizeTwo > sizeOne {
            print(sizeOne, sizeTwo)
//            return CGSize(width: sizeOne, height: sizeTwo)
            return CGSize(width: sizeOne, height: 350)

        } else {
            return CGSize(width: sizeTwo, height: 350)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.navigationController?.pushViewController(MovieDetailVC(), animated: true)
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        ad?.movieId = vc.list[indexPath.row].id
    }

}




