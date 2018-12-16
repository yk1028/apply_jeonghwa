//
//  AsignImageView.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 17/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit

class AsyncImageView: UIImageView {
    let CACHE_SEC : TimeInterval = 5 * 60;
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        checkAutoLayout()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func loadImage(urlString: String){
        let req = NSURLRequest(url: NSURL(string:urlString)! as URL,
                               cachePolicy: .returnCacheDataElseLoad,
                               timeoutInterval: CACHE_SEC)
        let conf =  URLSessionConfiguration.default
        let session = URLSession(configuration: conf, delegate: nil, delegateQueue: OperationQueue.main)
        
        session.dataTask(with: req as URLRequest, completionHandler:
            { (data, resp, err) in
                if((err) == nil){
                    let image = UIImage(data:data!)
                    self.image = image
                    
                }else{
                    self.networkAlert()
                    print("AsyncImageView:Error \(String(describing: err?.localizedDescription))")
                }
        }).resume()
}

    
    func topMostController() -> UIViewController {
        var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        while (topController.presentedViewController != nil) {
            topController = topController.presentedViewController!
        }
        return topController
    }
    
    func networkAlert() {
        let alert = UIAlertController(title: "네트워크 수신 실패", message: "네트워크 상태를 확인해주세요", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        topMostController().present(alert, animated: true, completion: nil)
        print("네트워크 얼트창")
        
    }
    
}

