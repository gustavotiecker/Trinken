//
//  Drink.swift
//  Trinken
//
//  Created by Gustavo Tiecker on 06/08/21.
//

import Foundation

struct Drink {
    let id: String
    let name: String
    let category: String?
    let alcoholic: String?
    let glass: String?
    let instructions: String?
    let imageURL: URL?
    
    enum DrinkKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case alcoholic = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case imageURL = "strDrinkThumb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DrinkKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        category = try container.decode(String.self, forKey: .category)
        alcoholic = try container.decode(String.self, forKey: .alcoholic)
        glass = try container.decode(String.self, forKey: .glass)
        instructions = try container.decode(String.self, forKey: .instructions)
        imageURL = try container.decode(URL.self, forKey: .imageURL)
    }
}
