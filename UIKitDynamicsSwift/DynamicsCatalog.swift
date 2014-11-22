//
//  DynamicsCatalog.swift
//  UIKitDynamicsSwift
//
//  Created by Michael Ellison on 11/17/14.
//  Copyright (c) 2014 Michael Ellison. All rights reserved.
//

import UIKit

class DynamicsCatalog: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cellLabel: UILabel!
    
    let cellLabels = ["Gravity", "Gravity + Collision", "Attachments + Collision", "Collision + Gravity + Spring", "Snap", "Instantaneous Push + Collision", "Continuous Push + Collision", "Pendulum (Composite Behavior", "Item Properties", "Custom Dymanic Item"]
    let catalogueSegues = ["GravitySegue", "GravityCollisionSegue", "AttachmentsCollisionSegue", "GravityCollisionSpringSegue", "SnapSegue", "InstantaneousPushCollisionSegue", "ContinuousPushCollisionSegue", "PendulumSegue", "ItemPropertiesSegue", "CustomDynamicItemSegue"]
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table View Data Source
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        
        cell.textLabel?.text = cellLabels[indexPath.row]
        return cell
    }
    
    // MARK: Table View Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellLabels.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        performSegueWithIdentifier(catalogueSegues[indexPath.row], sender: self)
        
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
