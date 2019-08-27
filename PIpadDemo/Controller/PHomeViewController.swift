//
//  PHomeViewController.swift
//  PIpadDemo
//
//  Created by os on 2019/8/6.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

class PHomeViewController: UIViewController {
    
    //左边doc栏
    var dockView:PDockView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height ? 210 : 70
        let dockView = PDockView(frame:CGRect(x: 0, y: 0, width: width, height: Int(UIScreen.main.bounds.size.height)))
        self.view.addSubview(dockView)
        
        self.dockView = dockView
        
        //保证首次加载屏幕正确
//        self.viewWillTransition(to: UIScreen.main.bounds.size, with: self.transitionCoordinator!)
    }
    
    //屏幕旋转
    //ios8之后的屏幕旋转方法
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    
        if size.width > size.height {//横屏
            self.dockView?.width = 210
        } else {
            self.dockView?.width = 70
        }
        self.dockView?.height = size.height
    }
//    //ios8之前的屏幕旋转方法
//    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
//
//        if UIApplication.shared.statusBarOrientation.isLandscape {//Landscape:横屏
//            //更改dockView的宽度和高度
//            self.dockView?.width = 200
//            self.dockView?.height = 768
//        } else if UIApplication.shared.statusBarOrientation.isPortrait {//Landscape:竖屏
//            self.dockView?.width = 50
//            self.dockView?.height = 1024
//        }
//    }

}
