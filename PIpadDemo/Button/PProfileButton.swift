//
//  PProfileButton.swift
//  PIpadDemo
//
//  Created by os on 2019/8/6.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

class PProfileButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setTitle("个人头像", for: .normal)
        self.setImage(UIImage(named: "profile"), for: .normal)
        self.imageView?.layer.cornerRadius = 10
        self.titleLabel?.textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.width = self.width
        self.imageView?.height = self.width
        self.imageView?.x = 0
        self.imageView?.y = 0
        
        let size = UIScreen.main.bounds.size
        if size.width > size.height {
            self.titleLabel?.isHidden = false
            self.titleLabel?.width = self.width
            self.titleLabel?.height = self.height - self.width
            self.titleLabel?.x = 0
            self.titleLabel?.y = (self.imageView?.height)!
        }else{
            self.titleLabel?.isHidden = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
