//
//  PTabBarButton.swift
//  PIpadDemo
//
//  Created by os on 2019/8/27.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

class PTabBarButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.setBackgroundImage(UIImage(named: "back"), for: .disabled)
        self.imageView?.contentMode = .center
        
        //设置失效状态不要调整图像
        self.adjustsImageWhenDisabled = false
        
        //设置高亮状态不要调整图像
        self.adjustsImageWhenHighlighted = false
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imageView?.x = 0
        self.imageView?.y = 0
        
        let size = UIScreen.main.bounds.size
        if size.width > size.height {
            self.imageView?.width = self.width * 0.4
            self.imageView?.height = self.height
            
            self.titleLabel?.isHidden = false
            self.titleLabel?.width = self.width - self.imageView!.width
            self.titleLabel?.height = self.height
            self.titleLabel?.x = self.imageView!.width
            self.titleLabel?.y = 0
        }else{
            self.imageView?.width = self.width
            self.imageView?.height = self.height
            self.titleLabel?.isHidden = true
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
