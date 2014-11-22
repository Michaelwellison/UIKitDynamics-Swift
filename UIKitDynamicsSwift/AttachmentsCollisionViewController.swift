//
//  AttachmentsCollisionViewController.swift
//  UIKitDynamicsSwift
//
//  Created by Michael Ellison on 11/22/14.
//  Copyright (c) 2014 Michael Ellison. All rights reserved.
//

import UIKit

class AttachmentsCollisionViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var square1: UIView!
    @IBOutlet weak var square1AttachmentView: UIImageView!
    @IBOutlet weak var attachmentView: UIImageView!
    var animator : UIDynamicAnimator!
    var attachmentBehavior : UIAttachmentBehavior!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(animated: Bool) {
        addDynamicBehaviorToViews()
    }
    
    // MARK: Configuration
    
    func addDynamicBehaviorToViews() {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        let collisionBehavior = UICollisionBehavior(items: [square1])
        // Creates collision boundaries from the bounds of the dynamic animator's
        // reference view (self.view).
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehavior)
        
        let squareCenterPoint = CGPointMake(square1.center.x, square1.center.y)
        let attachmentPoint = UIOffsetMake(-25.0, -25.0)
        // By default, an attachment behavior uses the center of a view. By using a
        // small offset, we get a more interesting effect which will cause the view
        // to have rotation movement when dragging the attachment.
        
        let attachmentBehavior = UIAttachmentBehavior(item: square1, offsetFromCenter: attachmentPoint, attachedToAnchor: squareCenterPoint)
        animator.addBehavior(attachmentBehavior)
        self.attachmentBehavior = attachmentBehavior
        
        // Visually show the attachment points
        
        // Visually show the connection between the attachment points
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func handleAttachmentGesture(sender: UIPanGestureRecognizer) {
        println("being called")
        
        attachmentBehavior.anchorPoint = sender.locationInView(self.view)
        attachmentView.center = attachmentBehavior.anchorPoint
    }
    
    
}
