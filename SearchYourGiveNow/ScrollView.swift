//
//  ScrollView.swift
//  SearchYourGiveNow
//
//  Created by Thiện Tùng on 12/23/19.
//  Copyright © 2019 tung. All rights reserved.
//

import UIKit

class ScrollView: UIView {
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemPink
        
        return image
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(scrollView)
        scrollView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        
        let width = scrollView.bounds.width
        let height = scrollView.bounds.height
        
        let images: [UIImage] = [UIImage(named: "Gift1")!, UIImage(named: "Gift2")!, UIImage(named: "Gift3")!]
        
        for i in 0..<images.count{
            imageView.image = images[i]
            imageView.frame = CGRect(x: CGFloat(i)*width, y: 0, width: width, height: height)
            scrollView.addSubview(imageView)
        
        }
        scrollView.contentSize = CGSize(width: CGFloat(images.count)*width, height: height)
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
