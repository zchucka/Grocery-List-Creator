//
//  Recipes.swift
//  groceryListCreator
//
//  Created by Abby Jamieson on 4/5/19.
//  Copyright © 2019 Zachary Chucka. All rights reserved.
//

import Foundation

// add saving to a file and uploading in here
class Recipe: Codable {
    var recipeName: String
    var recipeDesc: String
    var directions: String
    var ingredientsList: String
    
    init(name: String, description: String, directions: String, ingredients: String) {
        self.recipeName = name
        self.recipeDesc = description
        self.directions = directions
        self.ingredientsList = ingredients
    }
}
