//
//  extension.swift
//  boxOfficeForBoostCamp
//
//  Created by 정화 on 09/12/2018.
//  Copyright © 2018 mohomogu. All rights reserved.
//

import UIKit


extension UITableViewCell {
    // 섹션 끝나는 하단에 수평 바 생성
    func sectionLayout(sectionView: UIView) {
        contentView.addSubview(sectionView)
        sectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        sectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        sectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        sectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
}


extension UIView {
    // 오토레이아웃 사용
    func checkAutoLayout() {
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension UIImageView {
    // 이미지 색상 변경
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}



extension UIColor {
    static var starYellow: UIColor { return UIColor.init(red: 240, green: 155, blue: 64)}
    static var starGray: UIColor { return UIColor.init(red: 234, green: 234, blue: 234)}
    
    static var barBlue: UIColor { return UIColor.init(red: 90, green: 108, blue: 190)}
    
    static var detailCellBackground: UIColor { return UIColor.init(red: 205, green: 205, blue: 205)}
    static var userProfile: UIColor { return UIColor.init(red: 193, green: 193, blue: 193)}

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


extension Int {
    var withComma: String {
        let decimalFormatter = NumberFormatter()
        decimalFormatter.numberStyle = NumberFormatter.Style.decimal
        decimalFormatter.groupingSeparator = ","
        decimalFormatter.groupingSize = 3
        
        return decimalFormatter.string(from: self as NSNumber)!
    }
}

extension UIViewController {
    func convertFromUnix(timeStamp : Double) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

