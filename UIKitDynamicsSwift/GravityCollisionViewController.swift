//
//  GravityCollisionViewController.swift
//  UIKitDynamicsSwift
//
//  Created by Michael Ellison on 11/15/14.
//  Copyright (c) 2014 Michael Ellison. All rights reserved.
//

import UIKit

class GravityCollisionViewController: UIViewController, UICollisionBehaviorDelegate {

    // MARK: Outlets
    @IBOutlet weak var box1: UIImageView!
    
    // MARK: Variables
    var animator : UIDynamicAnimator!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.box1.image = self.box1.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        self.box1.tintColor = UIColor.darkGrayColor();
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
    
    // MARK: Collision Behavior Delegate
    
    // This method is called when square1 begins contacting a collision boundary.
    // In this demo, the only collision boundary is the bounds of the reference
    // view (self.view).
    
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying, atPoint p: CGPoint) {
        
        // Lighten the tint color when the view is in contact with a boundary.
        (item as UIView).tintColor = UIColor.lightGrayColor()
    }
    
    //  This method is called when square1 stops contacting a collision boundary.
    //  In this demo, the only collision boundary is the bounds of the reference
    //  view (self.view).
    
    func collisionBehavior(behavior: UICollisionBehavior!, endedContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!) {
        // Restore the default color when ending a contact.
        (item as UIView).tintColor = UIColor.darkGrayColor()
    }
    
    // MARK: Actions

    @IBAction func tapGravityOn(sender: AnyObject) {
    }
}

