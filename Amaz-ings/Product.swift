//
//  Product.swift
//  Amaz-ings
//
//  Created by Liam Gensel on 11/26/17.
//  Copyright © 2017 Liam Gensel. All rights reserved.
//

class Product
{
    var id: String?
    var title: String?
    var image_url: String?
    var price: String?
    var review: String?
    
    init(id: String, title: String, image_url: String, price: String, review: String)
    {
        self.id = id
        self.title = title
        self.image_url = image_url
        self.price = price
        self.review = review
    }
}
