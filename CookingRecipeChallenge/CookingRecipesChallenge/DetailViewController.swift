//
//  DetailViewController.swift
//  CookingRecipesChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var recipe: CookingRecipe
    
    private lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var headlineLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var difficultyLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var timeLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    init(recipe: CookingRecipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(recipeImage)
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            recipeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recipeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recipeImage.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: recipeImage.centerXAnchor)
        ])
        
        view.addSubview(headlineLabel)
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            headlineLabel.centerXAnchor.constraint(equalTo: recipeImage.centerXAnchor)
        ])
        
        view.addSubview(difficultyLabel)
        NSLayoutConstraint.activate([
            difficultyLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 80),
            difficultyLabel.leadingAnchor.constraint(equalTo: recipeImage.leadingAnchor)
        ])
        
        view.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: difficultyLabel.bottomAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: recipeImage.leadingAnchor)
        ])
        
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 40),
            descriptionLabel.leadingAnchor.constraint(equalTo: recipeImage.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: recipeImage.trailingAnchor),
        ])
        
        configure(with: recipe)
    }
    
    private func configure(with recipe: CookingRecipe) {
        
        titleLabel.text = recipe.name
        headlineLabel.text = recipe.headline
        descriptionLabel.text = recipe.description
        difficultyLabel.text = "Difficulty: \(recipe.difficulty)"
        timeLabel.text = "Time: \(recipe.time)"
        
        guard let imageUrl = URL(string: recipe.thumb)
        else { return }
        
        recipeImage.kf.setImage(with: imageUrl)
    }
}
