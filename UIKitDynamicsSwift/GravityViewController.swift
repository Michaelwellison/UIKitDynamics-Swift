//
//  GravityViewController.swift
//  UIKitDynamicsSwift
//
//  Created by Michael Ellison on 11/19/14.
//  Copyright (c) 2014 Michael Ellison. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {
    @IBOutlet weak var box1: UIImageView!
    var animator : UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        makeGravity()
    }
    
    func makeGravity() {
        let animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        let gravityBehavior:UIGravityBehavior = UIGravityBehavior(items:[self.box1]);
        
        animator.addBehavior(gravityBehavior)
        
        self.animator = animator
    }

}
