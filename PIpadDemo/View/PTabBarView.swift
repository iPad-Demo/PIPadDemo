//
//  PTabBarView.swift
//  PIpadDemo
//
//  Created by os on 2019/8/6.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

class PTabBarView: UIView {

    var selectedButton:PTabBarButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let firstButton = setupButtonWithIcon(icon: "dongtai", title: "全部动态")
        firstButton.isEnabled = false
        self.selectedButton = firstButton
        setupButtonWithIcon(icon: "wode", title: "与我相关")
        setupButtonWithIcon(icon: "zhaopian", title: "照片墙")
        setupButtonWithIcon(icon: "xiangkuang", title: "电子相框")
        setupButtonWithIcon(icon: "haoyou", title: "我的好友")
        setupButtonWithIcon(icon: "shezhi", title: "设置")
    }
    
    @discardableResult
    private func setupButtonWithIcon(icon:String,title:String) -> PTabBarButton{
        let button = PTabBarButton(type: .custom)
        button.setImage(UIImage(named: icon), for: .normal)
        button.setTitle(title, for:.normal)
        button.addTarget(self, action:#selector(tabBarButtonClick(button:)), for: .touchUpInside)
        self.addSubview(button)
        button.tag = self.subviews.count
        
        return button
    }
    
    @objc func tabBarButtonClick(button:UIButton){
        self.selectedButton?.isEnabled = true
        button.isEnabled = false
        self.selectedButton = button as? PTabBarButton
        
        NotificationCenter.default.post(name: NSNotification.Name("PTabBarButtonDidChangeNotification"), object: nil, userInfo: ["tabBarButtonIndex":button.tag])
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
