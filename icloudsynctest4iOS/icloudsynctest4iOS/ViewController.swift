//
//  ViewController.swift
//  icloudsynctest4iOS
//
//  Created by Claude Montpetit on 2014-09-11.
//  Copyright (c) 2014 org.montpetit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logText: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionCreateEntity(sender: AnyObject) {
        (UIApplication.sharedApplication().delegate as AppDelegate).modelManager!.createEntity1()
    }

    @IBAction func actionShowEntities(sender: AnyObject) {
        logText.text = (UIApplication.sharedApplication().delegate as AppDelegate).modelManager!.entitiesAsString()
    }
    @IBAction func actionUpdateLastEntity(sender: AnyObject) {
        (UIApplication.sharedApplication().delegate as AppDelegate).modelManager!.updateLastEntity()
    }
}

