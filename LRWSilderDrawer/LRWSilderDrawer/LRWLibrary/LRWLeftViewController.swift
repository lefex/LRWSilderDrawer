//
//  LRWLeftViewController.swift
//  LRWSilderDrawer
//
//  Created by wsy on 15/8/19.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class LRWLeftViewController: UIViewController {
    
    // All the properties of LRWLeftViewController
    
    // The center viewController
    var mainViewController: UIViewController
    // The left viewController
    var leftViewController: UIViewController
    
    // init methods
    init(leftViewController : UIViewController ,mainViewController : UIViewController){
        self.mainViewController = mainViewController
        self.leftViewController = leftViewController
        // The super class designated initializer
        super.init(nibName: nil, bundle: nil)
    }
    
    // viewControlle lift cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
