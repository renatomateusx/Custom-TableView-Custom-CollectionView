//
//  TravelPackage.swift
//  Chris Travels
//
//  Created by Renato Mateus on 04/02/21.
//

import Foundation

struct TravelPackage: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
       case id, title, category, description, details, dateLimit = "dateLimit", images, includedItems, price
    }

    var id: Int
    var title: String
    var price: String
    var category: Category
    var description: String
    var details: String
    var dateLimit: String
    var images: [String]
    var includedItems: [Item]

    enum Category: String, CaseIterable, Codable, Hashable {
        case europa = "Europa"
        case americaDoSul = "America do sul"
        case americaDoNorte = "America do norte"
    }
}

struct Item: Codable {
    enum CodingKeys: String, CodingKey {
       case id, title, image
    }
    var id: Int
    var title: String
    var image: String
}
