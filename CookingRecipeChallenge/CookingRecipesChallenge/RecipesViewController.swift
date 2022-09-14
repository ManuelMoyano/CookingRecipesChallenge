//
//  ViewController.swift
//  CookingRecipesChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var cookingRecipesArray = [CookingRecipe]()
    
    private let cookingRecipesTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Recipes"
        
        view.addSubview(cookingRecipesTableView)
        cookingRecipesTableView.dataSource = self
        cookingRecipesTableView.delegate = self
        cookingRecipesTableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: RecipeTableViewCell.cellIdentifier)
        cookingRecipesTableView.rowHeight = UITableView.automaticDimension
        
        NSLayoutConstraint.activate([
            cookingRecipesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cookingRecipesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cookingRecipesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            cookingRecipesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NetWorking.shared.getCookingRecipesAlamofire { recipes in
            self.cookingRecipesArray = recipes
            DispatchQueue.main.async {
                self.cookingRecipesTableView.reloadData()
                   }
        } failure: { error in
            print(error?.localizedDescription ?? "No error Description")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookingRecipesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.cellIdentifier, for: indexPath) as? RecipeTableViewCell
        else {
            return UITableViewCell()
        }
        cell.configure(with: cookingRecipesArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = cookingRecipesArray[indexPath.row]
        let detailViewController = DetailViewController(recipe: recipe)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

