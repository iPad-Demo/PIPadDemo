//
//  PTabBarView.swift
//  PIpadDemo
//
//  Created by os on 2019/8/6.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

class PTabBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = UIColor(red:CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1.0)
        setupButtonWithIcon(icon: "", title: "111")
        setupButtonWithIcon(icon: "", title: "222")
        setupButtonWithIcon(icon: "", title: "333")
        setupButtonWithIcon(icon: "", title: "444")
        setupButtonWithIcon(icon: "", title: "555")
        setupButtonWithIcon(icon: "", title: "666")
    }
    
    private func setupButtonWithIcon(icon:String,title:String){
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: icon), for: .normal)
        button.setTitle(title, for:.normal)
        self.addSubview(button)
        button.backgroundColor = UIColor(red:CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let count = self.subviews.count
//        let size = UIScreen.main.bounds.size
        for (index,button) in self.subviews.enumerated() {
            button.width = self.width
            button.height = self.height / CGFloat(count)
            button.x = 0
            button.y = CGFloat(index) * button.height
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
