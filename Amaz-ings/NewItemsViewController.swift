//
//  NewItemsViewController.swift
//  Amaz-ings
//
//  Created by Liam Gensel on 11/24/17.
//  Copyright © 2017 Liam Gensel. All rights reserved.
//

import UIKit
import Alamofire
import Koloda

class NewItemsViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    
    var products: [Product] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        
        Alamofire.request("http://127.0.0.1:5000/get-products/nuts") .responseJSON { response in
            if let result = response.result.value as? [String:Any],
                let main = result["nuts"] as? [[String:String]]{
                // main[0]["USDARS"] or use main.first?["USDARS"] for first index or loop through array
                for obj in main
                {
                    let product = Product(id: (obj["id"])!, title: (obj["title"])!, image_url: (obj["image_url"])!, price: (obj["price"])!, review: (obj["review"])!)
                    self.products.append(product)
//                    print(product.title!)
                }
                
            }
        }
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension NewItemsViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
    }
}

extension NewItemsViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return 5
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        let image = UIImageView(image: #imageLiteral(resourceName: "cards_1"))
        image.center = self.kolodaView.center
        return image
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)![0] as? OverlayView
    }
}

