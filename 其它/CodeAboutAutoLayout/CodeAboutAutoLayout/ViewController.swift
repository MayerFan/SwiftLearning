//
//  ViewController.swift
//  CodeAboutAutoLayout
//
//  Created by 范名扬 on 16/7/15.
//  Copyright © 2016年 com.hztc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //约束规则
    /*
        1.对于同层级视图的约束关系，约束添加到他们的父控件上
        2.每个视图的宽高约束，只和他们自身视图有关系，所以添加到自己身上
        3.对于不同层级的视图的约束关系，添加到他们最近的共同父控件上。
        总结：哪个视图能够同时管理具有约束关系的视图，那么这个视图就可以作为添加约束的对象(来管理约束)。
    */
    
    //代码实现的两种方式
    /*
        1.使用通俗的逻辑约束关系创建约束对象(A视图的属性 ＝ B视图的属性 * 乘积因子 + 常量)
        2.使用Visual Format Lauangue（特点：左右布局；上下布局）
    */
    
    //第三方库Masonry的使用
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.whiteColor()
        
        
        
        /*
        test1()
        
        test2()
        
        // VFL和逻辑约束关系混合
        
        */
        
        // 利用第三方框架masonry
        
        
    }
    
    //利用第三方框架masonry设置约束
    func test4() {
        let greenView = UIView()
        greenView.backgroundColor = UIColor.greenColor()
        view.addSubview(greenView)
        
        //添加约束
        greenView.mas_makeConstraints { (make: MASConstraintMaker!) in
            //尺寸约束
            let size = CGSizeMake(100, 100)
            make.size.mas_equalTo()
            //居中
            make.center.mas_equalTo()
        }
    }
    
    //利用VFL语言
    func test2() {
        //蓝色视图距离左右父试图各20，距离顶部20，高度100
        
        //创建蓝色控件
        let blueView = UIView()
        blueView.backgroundColor = UIColor.blueColor()
        blueView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blueView)
        
        let nMargin = 20
        let nHeight = 100
        
        //水平布局
        let horizal = "H:|-nMargin-[blueView]-nMargin-|"
        //竖直布局
        let vercial = "V:|-nMargin-[blueView(nHeight)]"
        
//        //字符串中的名字和间距绑定
//        let metrics = Dictionary<String, String>.dictClassOfVariableBinding("nMargin","nHeight")
//        //字符串中的名字和对象绑定
//        let views = Dictionary<String, String>.dictClassOfVariableBinding("blueView")
        
        let metrics = ["nMargin":nMargin, "nHeight":nHeight]
        let views = ["blueView":blueView];

        //获取水平方向VFL约束数组
        let hConstraints = NSLayoutConstraint.constraintsWithVisualFormat(horizal, options: NSLayoutFormatOptions.DirectionLeftToRight, metrics: metrics, views: views)
        let vConstraints = NSLayoutConstraint.constraintsWithVisualFormat(vercial, options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: metrics, views: views)
        
        view.addConstraints(hConstraints)
        view.addConstraints(vConstraints)
        
    }
    
    //逻辑约束关系创建约束对象
    func test1() {
        let redView = UIView()
        redView.backgroundColor = UIColor.redColor()
        redView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redView)
        
        //方法一 iOS6.0 -
        /*
         //添加宽度约束
         redView.addConstraint(NSLayoutConstraint(item: redView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0.0, constant: 100.0))
         //添加高度约束
         redView.addConstraint(NSLayoutConstraint(item: redView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0.0, constant: 100.0))
         //距离父试图右侧10
         view.addConstraint(NSLayoutConstraint(item: redView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10.0))
         //距离父试图底部10
         view.addConstraint(NSLayoutConstraint(item: redView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10.0))
         */
        
        //方法二 iOS8.0 -
        
        //添加宽度约束
        let widthConstraint = NSLayoutConstraint(item: redView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0.0, constant: 100.0)
        //添加高度约束
        let heightConstraint = NSLayoutConstraint(item: redView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 0.0, constant: 100.0)
        //距离父试图右侧10
        let rightConstraint = NSLayoutConstraint(item: redView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10.0)
        //距离父试图底部10
        let bottomConstraint = NSLayoutConstraint(item: redView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -10.0)
        widthConstraint.active = true
        heightConstraint.active = true
        rightConstraint.active = true
        bottomConstraint.active = true
    }
    

}




