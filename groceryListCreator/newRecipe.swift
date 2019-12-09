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
    @IBOutlet var recipeName: UITextField!
    @IBOutlet var recipeDesc: UITextField!
    @IBOutlet var recipeIngredients: UITextField!
    @IBOutlet var recipeDirections: UITextField!
    var recipe: Recipe? = nil
    
    // override the viewDidLoad to load in the data if we are editing
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let recipe = recipe {
            recipeName.text = recipe.recipeName
            recipeDesc.text = recipe.recipeDesc
            var Ingredients: String = ""
            var Directions: String = ""
            
            for step in recipe.ingredientsList {
                if Ingredients == "" {
                    Ingredients = step
                } else {
                    Ingredients = Ingredients + "\n" + step
                }
            }
            
            var count = 1
            for step in recipe.directions {
                if Directions == "" {
                    Directions = "\(count). "  + step
                } else {
                    Directions = Directions + "\n" + "\(count). \(step)"
                }
                count = count + 1
            }
            
            recipeIngredients.text = Ingredients
            recipeDirections.text = Directions
        } else {
            //if there is no recipe, aka adding instead of editing, lets give instructions
        }
    }
    
    // saves the recipe given that some information is provided
    func saveRecipe() {
        // down here, we need to send the recipes to myRecipe and eventually save to database so that shit doesn't get wiped
        
        // need to unpack directions into an array- use split on '/n'
        var newRecName = ""
        var newRecDesc = ""
        var newRecIngr: [String] = []
        var newRecDir: [String] = []
        
        if let recName = recipeName.text {
            newRecName = recName
        }
        if let recDesc = recipeDesc.text {
            newRecDesc = recDesc
        }
        if let recIngr = recipeIngredients.text {
            let tempArray = recIngr.split(separator: "\n")
            for index in tempArray {
                newRecIngr.append(String(index))
            }
        }
        if let recDir = recipeDirections.text {
            let temArray = recDir.split(separator: "\n")
            for index in temArray {
                newRecDir.append(String(index))
            }
        }

        recipe = Recipe(name: newRecName, description: newRecDesc, directions: newRecDir, ingredients: newRecIngr)
    }
    
    @IBAction func savePressed() {
        if recipe != nil { // this is the wrong check since recipe will always be nil until after the initialization, instead lets use a check to all of the fields. should I require all?
            saveRecipe()
            // trigger pop up to say done saving
        } else {
            // maybe some sort of pop up to say invalid recipe, for now, lets leave the page and not save
            print("recipe didn't change")
        }
        // make our own segue to transition back to the my recipes page while adding it to the database
    }
    
    @IBAction func cancelPressed() {
        // send to same place as save pressed
        // for now, I'm not sure if needed... if back is pressed, it won't save information
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "saveRecipe" {
                saveRecipe()
                if let RecipeTable = segue.destination as? MyRecipesViewController {
                    if let newRecipe = self.recipe {
                        RecipeTable.recipes.append(newRecipe)
                    } else {
                        print("somehow we messed up")
                    }
                }
            }
        }
    }
}
