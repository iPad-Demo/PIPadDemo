//
//  PToolBarView.swift
//  PIpadDemo
//
//  Created by os on 2019/8/6.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

class PToolBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor(red:CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1.0)
        setupButtonWithIcon(icon: "")
        setupButtonWithIcon(icon: "")
        setupButtonWithIcon(icon: "")
    }
    
    private func setupButtonWithIcon(icon:String){
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: icon), for: .normal)
        button.setBackgroundImage(UIImage(named: ""), for: .highlighted)
        self.addSubview(button)
        button.backgroundColor = UIColor(red:CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let count = self.subviews.count
        let size = UIScreen.main.bounds.size
        for (index,button) in self.subviews.enumerated() {
            if size.width > size.height {
                button.width = self.width / CGFloat(count)
                button.x = CGFloat(index) * button.width
                button.y = 0
            } else {
                button.width = self.width
                button.x = 0
                button.y = CGFloat(index) * button.height
            }
            button.height = button.width
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
