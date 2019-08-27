//
//  PDockView.swift
//  PIpadDemo
//
//  Created by os on 2019/8/6.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

class PDockView: UIView {

    var profileView:PProfileButton?
    var tabBarView:PTabBarView?
    var toolBarView:PToolBarView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red:CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1.0)
        
        
        let profileView = PProfileButton()
        self.addSubview(profileView)
        self.profileView = profileView

        let tabBarView = PTabBarView()
        self.addSubview(tabBarView)
        self.tabBarView = tabBarView

        let toolBarView = PToolBarView()
        self.addSubview(toolBarView)
        self.toolBarView = toolBarView
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = UIScreen.main.bounds.size
        if size.width > size.height {
            self.toolBarView?.height = self.width / 3
            self.tabBarView?.height = self.width / 3 * 6
            self.profileView?.width = self.width * 0.4
            self.profileView?.height = (self.profileView?.width)! + 30
        } else {
            self.toolBarView?.height = self.width * 3
            self.tabBarView?.height = self.width * 6
            self.profileView?.width = self.width * 0.8
            self.profileView?.height = (self.profileView?.width)!
        }

        //工具栏
        self.toolBarView?.width = self.width
        self.toolBarView?.x = 0

        self.toolBarView?.y = self.height - (self.toolBarView?.height)!

        //标签栏
        self.tabBarView?.width = self.width
        self.tabBarView?.x = 0
        self.tabBarView?.y = (self.toolBarView?.y)! - (self.tabBarView?.height)!

        //头像
        self.profileView?.x = (self.width - (self.profileView?.width)!) / 2
        self.profileView?.y = 70
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
