//
//  RTLGTabBarController.swift
//  RMTabNavHelpers
//
//  Created by slpokey   on 2018/1/3.
//  Copyright © 2018年 slpokey  . All rights reserved.
//

import UIKit

open class RTLGTabBarController: UITabBarController {
    
    static let shared = RTLGTabBarController()

    override open func viewDidLoad() {
        super.viewDidLoad()
        setValue(RTLGTabBar(), forKeyPath: "tabBar")
    }
    
    /// 添加子控制器
    ///
    /// - Parameters:
    ///   - vc: 需要添加的控制器(包装成导航栏)
    ///   - normalImgName: 正常图片名
    ///   - selectedImgName: 选中图片名
    ///   - isNeedNavController: 标题
    public func addChildVC(vc: UIViewController, title: String, normalImgName: String, selectedImgName: String, isNeedNavController: Bool) {
        if isNeedNavController {
            let nav = RTLGNavigationController(rootViewController: vc)
            nav.tabBarItem = UITabBarItem(title: title, image: UIImage.originImage(named: normalImgName), selectedImage: UIImage.originImage(named: selectedImgName))
            self.addChild(nav)
        }else {
            self.addChild(vc)
        }
    }
    
    
    /// 添加子控制器
    ///
    /// - Parameters:
    ///   - vc: 需要添加的控制器(包装成导航栏)
    ///   - title: 标题
    ///   - normalImage: 正常图片
    ///   - selectedImage: 选中图片
    ///   - isNeedNavController: 是否需要导航栏
    public func addChildVC(vc: UIViewController, title: String, normalImage: UIImage?, selectedImage: UIImage?, isNeedNavController: Bool) {
        if isNeedNavController {
            let nav = RTLGNavigationController(rootViewController: vc)
            nav.tabBarItem = UITabBarItem(title: title, image: normalImage?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
            self.addChild(nav)
        }else {
            self.addChild(vc)
        }
    }
}
