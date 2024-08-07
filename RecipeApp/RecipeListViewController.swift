//
//  RecipeListViewController.swift
//  RecipeApp
//
//  Created by Mukund Sharma on 8/6/24.
//

import Foundation
import UIKit

class RecipeListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipes"
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RecipeCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath)
        cell.textLabel?.text = recipes[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let selectedRecipe = recipes[indexPath.row]
           let detailVC = RecipeDetailViewController(recipe: selectedRecipe)
           navigationController?.pushViewController(detailVC, animated: true)
       }
   
}
