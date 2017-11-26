//
//  NewItemsViewController.swift
//  Amaz-ings
//
//  Created by Liam Gensel on 11/24/17.
//  Copyright © 2017 Liam Gensel. All rights reserved.
//

import UIKit

class NewItemsViewController: UIViewController {

    @IBOutlet weak var card: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer)
    {
        let card = sender.view!
        let point = sender.translation(in: view)
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizerState.ended
        {
            UIView.animate(withDuration: 0.2, animations: {
                card.center = self.view.center
            })
        }
    }
    
}
