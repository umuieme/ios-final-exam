//
//  CocktailDetail.swift
//  iOS-FinalExam
//
//  Created by Umesh Basnet on 11/04/2025.
//

class CocktailDetailResponseWrapper : Codable {
    let drinks : [CocktailDetail]
    
    init(drinks: [CocktailDetail]) {
        self.drinks = drinks
    }
}


class CocktailDetail : Codable {

    let idDrink : String
    let strDrink: String
    let strDrinkThumb: String
    let strCategory: String
    let strAlcoholic: String
    let strInstructions: String
    let strInstructionsES: String
    let strInstructionsDE: String
    
    init(idDrink: String, strDrink: String, strDrinkThumb: String, strCategory: String, strAlcoholic: String, strInstructions: String, strInstructionsES: String, strInstructionsDE: String) {
        self.idDrink = idDrink
        self.strDrink = strDrink
        self.strDrinkThumb = strDrinkThumb
        self.strCategory = strCategory
        self.strAlcoholic = strAlcoholic
        self.strInstructions = strInstructions
        self.strInstructionsES = strInstructionsES
        self.strInstructionsDE = strInstructionsDE
    }
}
