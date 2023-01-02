//
//  Drinks.swift
//  CocktailsAPI
//
//  Created by technomix on 02.01.23.
//

import Foundation

struct Drink : Codable {
    var drinks : [DrinkCattegories]
}

struct DrinkCattegories : Codable {
    var strDrink : String
    var strDrinkThumb : String
    var idDrink : String
    
  
}
