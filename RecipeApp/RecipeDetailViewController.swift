//
//  RecipeDetailViewController.swift
//  RecipeApp
//
//  Created by Mukund Sharma on 8/6/24.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    private let imageView = UIImageView()
    private let detailsLabel = UILabel()
    private var recipe: Recipe
    
    init(recipe: Recipe){
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            title = recipe.name
            setupImageView()
            setupDetailsLabel()
            configureView()
    }
    
    private func setupImageView() {
           view.addSubview(imageView)
           imageView.translatesAutoresizingMaskIntoConstraints = false
           imageView.contentMode = .scaleAspectFit

           NSLayoutConstraint.activate([
               imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
               imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
               imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
           ])
       }
    
    private func setupDetailsLabel() {
            view.addSubview(detailsLabel)
            detailsLabel.translatesAutoresizingMaskIntoConstraints = false
            detailsLabel.numberOfLines = 0
            detailsLabel.textAlignment = .center

            NSLayoutConstraint.activate([
                detailsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
                detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
        }
    
    private func configureView() {
            imageView.image = UIImage(named: recipe.image)
            detailsLabel.text = recipe.details
        }

}

