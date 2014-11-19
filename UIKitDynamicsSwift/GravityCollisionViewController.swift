//
//  GravityCollisionViewController.swift
//  UIKitDynamicsSwift
//
//  Created by Michael Ellison on 11/15/14.
//  Copyright (c) 2014 Michael Ellison. All rights reserved.
//

import UIKit

class GravityCollisionViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var box1: UIImageView!
    
    // MARK: Variables
    var animator : UIDynamicAnimator!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        makeGravity()
    }
    
    func makeGravity() {
        let animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        let gravityBehavior:UIGravityBehavior = UIGravityBehavior(items:[self.box1]);
        let collisionBehavior:UICollisionBehavior = UICollisionBehavior(items:[self.box1])
        
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true;
        animator.addBehavior(collisionBehavior)
        animator.addBehavior(gravityBehavior)
        
        self.animator = animator
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions

    @IBAction func tapGravityOn(sender: AnyObject) {
    }
}

