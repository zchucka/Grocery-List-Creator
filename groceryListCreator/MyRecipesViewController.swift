//
//  MyRecipesViewController.swift
//  groceryListCreator
//
//  Created by Abby Jamieson on 4/5/19.
//  Copyright © 2019 Zachary Chucka. All rights reserved.
//

import UIKit

class MyRecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let recipe = recipes.remove(at: sourceIndexPath.row)
        recipes.insert(recipe, at: destinationIndexPath.row)
        // MARK: LAB #19.b.
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            // MARK: LAB #20.a.
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
