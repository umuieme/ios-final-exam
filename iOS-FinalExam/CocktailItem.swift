//
//  CocktailItem.swift
//  iOS-FinalExam
//
//  Created by Umesh Basnet on 11/04/2025.
//

class CocktailListResponseWrapper : Codable {
    let drinks : [CocktailItem]
    
    init(drinks: [CocktailItem]) {
        self.drinks = drinks
    }
}

class CocktailItem : Codable {
    
    let idDrink : String
    let strDrink: String
    let strDrinkThumb: String
    
    init(idDrink: String, strDrink: String, strDrinkThumb: String) {
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strDrinkThumb = strDrinkThumb
    }
    
}

