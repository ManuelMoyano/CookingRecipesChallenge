//
//  RecipeTableViewCell.swift
//  CookingRecipesChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import UIKit
import Kingfisher

class RecipeTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "RecipeTableViewCell"
    
    private lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleView: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var descriptionView: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureView()
    }
    private func configureView(){
        
        contentView.addSubview(recipeImage)
        NSLayoutConstraint.activate([
            recipeImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            recipeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            recipeImage.heightAnchor.constraint(equalToConstant: 50),
            recipeImage.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.bottomAnchor.constraint(equalTo: recipeImage.centerYAnchor, constant: -5),
            titleView.leadingAnchor.constraint(equalTo: recipeImage.trailingAnchor, constant: 10),
            titleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        contentView.addSubview(descriptionView)
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: recipeImage.centerYAnchor, constant: 5),
            descriptionView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: titleView.trailingAnchor)
        ])
    }
    
    func configure(with recipe: CookingRecipe) {
        
        titleView.text = recipe.name
        descriptionView.text = recipe.headline
        recipeImage.image = UIImage()
        
        guard let imageUrl = URL(string: recipe.thumb)
        else { return }
        
        recipeImage.kf.setImage(with: imageUrl)
    }
    
}
