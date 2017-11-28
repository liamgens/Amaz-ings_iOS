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
        
        Alamofire.request("http://127.0.0.1:5000/get-products").responseJSON { response in
            if let result = response.result.value as? [String:Any],
                let main = result["products"] as? [[String:String]]{
                
                // main[0]["USDARS"] or use main.first?["USDARS"] for first index or loop through array
                for obj in main
                {
                    let product = Product(id: (obj["id"])!, title: (obj["title"])!, image_url: (obj["image_url"])!, price: (obj["price"])!, review: (obj["review"])!)
                    self.products.append(product)
                }
                self.kolodaView.reloadData()
                
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
        return products.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let views: CardView = (Bundle.main.loadNibNamed("CardView", owner: self, options: nil)![0] as! CardView)
        
        
        let url = URL(string: products[index].image_url!)
        let data = try? Data(contentsOf: url!)
        let image: UIImage = UIImage(data: data!)!
        
        views.image.image = image
        
        views.clipsToBounds = false
        views.layer.shadowColor = UIColor.black.cgColor
        views.layer.shadowOpacity = 1
        views.layer.shadowOffset = CGSize.zero
        views.layer.shadowRadius = 10
        views.layer.shadowPath = UIBezierPath(roundedRect: views.bounds, cornerRadius: 10).cgPath
        

        return views
        
    }
}


