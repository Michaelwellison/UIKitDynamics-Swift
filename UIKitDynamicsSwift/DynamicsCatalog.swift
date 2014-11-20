//
//  DynamicsCatalog.swift
//  UIKitDynamicsSwift
//
//  Created by Michael Ellison on 11/17/14.
//  Copyright (c) 2014 Michael Ellison. All rights reserved.
//

import UIKit

class DynamicsCatalog: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var cellLabel: UILabel!
    
    var cellLabels = ["Gravity", "Gravity + Collision", "Attachments + Collision", "Collision + Gravity + Spring", "Snap", "Instantaneous Push + Collision", "Continuous Push + Collision", "Pendulum (Composite Behavior", "Item Properties", "Custom Dymanic Item"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Table View Data Source
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        
        cell.textLabel?.text = cellLabels[indexPath.row]
        return cell
    }
    
    // Table View Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellLabels.count
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
            case 0:
            performSegueWithIdentifier("GravitySegue", sender: self)
        case 1:
            performSegueWithIdentifier("GravityCollisionSegue", sender: self)
        case 2:
            performSegueWithIdentifier("AttachmentsCollisionSegue", sender: self)
        case 3:
            performSegueWithIdentifier("GravityCollisionSpringSegue", sender: self)
        case 4:
            performSegueWithIdentifier("SnapSegue", sender: self)
        case 5:
            performSegueWithIdentifier("InstantaneousPushCollisionSegue", sender: self)
        case 6:
            performSegueWithIdentifier("ContinuousPushCollisionSegue", sender: self)
        case 7:
            performSegueWithIdentifier("PendulumSegue", sender: self)
        case 8:
            performSegueWithIdentifier("ItemPropertiesSegue", sender: self)
        case 9:
            performSegueWithIdentifier("CustomDynamicItemSegue", sender: self)
        default:
            println("something went wrong")
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
