//
//  MyRecipesViewController.swift
//  groceryListCreator
//
//  Created by Zachary Chucka on 4/5/19.
//  Copyright © 2019 Zachary Chucka. All rights reserved.
//

import UIKit

class MyRecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initRecipes()
        // initialize the saved recipes from core data when the time comes
    }
    
    // returns the number of cells for the rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return recipes.count
        }
        return 0
    }
    
    // reusing the cells to make the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeTableViewCell
        let recipe = recipes[indexPath.row]
        cell.update(with: recipe)
        cell.showsReorderControl = true
        return cell
    }
    
    // initializing the recipes. for now, using just the soup
    func initRecipes() {
        var count: Int = 0
        while count < 4 {
            var tempDirect = [String]()
            var tempIngred = [String]()
            tempDirect.append("Open the can")
            tempDirect.append("Pour the soup out")
            tempDirect.append("Heat it up and eat")
            tempIngred.append("Can of Soup")
            tempIngred.append("Basil")
            let tempRecipe = Recipe(name: "Chicken Soup", description: "Yummy soup in a tasty bread bowl", directions: tempDirect, ingredients: tempIngred)
            recipes.append(tempRecipe)
            count = count + 1
        }
    }
    
    // allows replacing a recipe
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let recipe = recipes.remove(at: sourceIndexPath.row)
        recipes.insert(recipe, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    // allows deleting a recipe
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // override prepare to pass the neccessary information
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "details" {
                if let RecipeDetailsVC = segue.destination as? RecipeDetailsPage {
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let recipe = recipes[indexPath.row]
                        RecipeDetailsVC.recipe = recipe
                    }
                }
            }
        }
    }
    
}
