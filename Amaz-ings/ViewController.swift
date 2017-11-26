//
//  ViewController.swift
//  Amaz-ings
//
//  Created by Liam Gensel on 11/24/17.
//  Copyright © 2017 Liam Gensel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newItems: UIView!
    @IBOutlet weak var savedItems: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showComponent(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.1, animations: {
                self.newItems.alpha = 1
                self.savedItems.alpha = 0
            })
        } else {
            UIView.animate(withDuration: 0.1, animations: {
                self.newItems.alpha = 0
                self.savedItems.alpha = 1
            })
        }
    }


}

