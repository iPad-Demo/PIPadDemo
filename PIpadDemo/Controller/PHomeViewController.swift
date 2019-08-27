//
//  PHomeViewController.swift
//  PIpadDemo
//
//  Created by os on 2019/8/6.
//  Copyright © 2019 os. All rights reserved.
//

import UIKit

import SnapKit

class PHomeViewController: UIViewController {
    
    //左边doc栏
    var dockView:PDockView?
    var selectedChildVC:UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height ? 210 : 70
        let dockView = PDockView(frame:CGRect(x: 0, y: 0, width: width, height: Int(UIScreen.main.bounds.size.height)))
        self.view.addSubview(dockView)
        
        self.dockView = dockView
        
        setupChildViewController()
        
        //注册通知
        NotificationCenter.default.addObserver(self, selector: #selector(tabBarButtonDidChangeNotification(notification:)), name: NSNotification.Name("PTabBarButtonDidChangeNotification"), object: nil)
        
        changeChildVC(0)
        //保证首次加载屏幕正确
//        self.viewWillTransition(to: UIScreen.main.bounds.size, with: self.transitionCoordinator)
    }
    
    @objc func tabBarButtonDidChangeNotification(notification:NSNotification){
        let index = notification.userInfo!["tabBarButtonIndex"] as! NSInteger
        print("notification:",index)
        
        changeChildVC(index)
    }
    
    func changeChildVC(_ index:NSInteger){
        self.selectedChildVC?.view.removeFromSuperview()
        let newVC = self.children[index]
        self.view.addSubview(newVC.view)
        self.selectedChildVC = newVC
        
        newVC.view.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(self.view)
            make.left.equalTo(self.dockView!.right)
        }
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
        self.selectedChildVC?.view.snp.updateConstraints({ (make) in
            make.left.equalTo(self.dockView!.right)
        })
    }
    func setupChildViewController() {
        //创建控制器
        for i in 0...9{
            print(i)
            let controller = UIViewController()
            controller.view.backgroundColor = UIColor(red:CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1.0)
            self.addChild(controller)
        }
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

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
