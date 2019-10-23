//
//  newRecipe.swift
//  groceryListCreator
//
//  Created by Abby Jamieson on 10/23/19.
//  Copyright © 2019 Zachary Chucka. All rights reserved.
//

import Foundation
import UIKit

class newRecipe: UIViewController {
    @IBOutlet var recipeName: UITextField? = nil
    @IBOutlet var recipeDesc: UITextField? = nil
    @IBOutlet var recipeIngredients: UITextField? = nil
    @IBOutlet var recipeDirections: UITextField? = nil
    var recipe: Recipe? = nil
    
    func saveRecipe() {
        // down here, we need to send the recipes to myRecipe and eventually save to database so that shit doesn't get wiped
    }
    
    @IBAction func savePressed() {
        if recipe != nil {
            saveRecipe()
        } else {
            // maybe some sort of pop up to say invalid recipe, for now, lets leave the page and not save
            print("recipe didn't change")
        }
        // make our own segue to transition back to the myrecipes page while adding it to the database
    }
    
    @IBAction func cancelPressed() {
        // send to same place as save pressed
    }
}
