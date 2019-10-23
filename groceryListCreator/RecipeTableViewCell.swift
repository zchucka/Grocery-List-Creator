//
//  Recipe TableViewCell.swift
//  Table View Fun
//
//  Created by Zachary Chucka on 10/18/18.
//  Copyright © 2019 Zachary Chucka. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    // add outlets to our labels in our RecipeCell
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func update(with recipe: Recipe) {
        // update the recipe for the information that we are putting in the cells
        nameLabel.text = recipe.recipeName
        descriptionLabel.text = recipe.recipeDesc
    }
    
}
