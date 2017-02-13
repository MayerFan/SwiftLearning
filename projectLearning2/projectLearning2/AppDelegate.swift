//
//  AppDelegate.swift
//  projectLearning2
//
//  Created by 范名扬 on 16/7/10.
//  Copyright © 2016年 com.hztc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //创建window
        let rect = UIScreen.mainScreen().bounds
        window = UIWindow(frame: rect)
        //创建控制器
        window!.rootViewController = ViewController()
        //显示window
        window!.makeKeyAndVisible()
        
        return true
    }

}

