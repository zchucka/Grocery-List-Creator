//
//  RecipeDetailsPage.swift
//  groceryListCreator
//
//  Created by Zachary Chucka on 4/5/19.
//  Copyright © 2019 Zachary Chucka. All rights reserved.
//

import UIKit

class RecipeDetailsPage: UIViewController {
    var recipe: Recipe? = nil
    @IBOutlet var recipeName: UILabel!
    @IBOutlet var recipeDesc: UILabel!
    @IBOutlet var recipeIngredients: UILabel!
    @IBOutlet var recipeInstructions: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let recipe = recipe {
            recipeName.text = recipe.recipeName
            recipeDesc.text = recipe.recipeDesc
            var Ingredients: String = ""
            var Instructions: String = ""
            
            for step in recipe.ingredientsList {
                if Ingredients == "" {
                    Ingredients = step
                } else {
                    Ingredients = Ingredients + "\n" + step
                }
            }
            
            var count = 1
            for step in recipe.directions {
                if Instructions == "" {
                    Instructions = "\(count). "  + step
                } else {
                    Instructions = Instructions + "\n" + "\(count). \(step)"
                }
                count = count + 1
            }
            
            recipeIngredients.text = Ingredients
            recipeInstructions.text = Instructions
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "editRecipe" {
                if let newRecipeVC = segue.destination as? newRecipe {
                    // TO DO: send the information of the current recipe to the newRecipeVC
                    newRecipeVC.recipe = self.recipe
                }
            }
        }
    }
    
}
