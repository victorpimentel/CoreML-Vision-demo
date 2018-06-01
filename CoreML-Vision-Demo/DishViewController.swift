//
//  DishViewController.swift
//  CoreML-Vision-Demo
//
//  Created by Víctor Pimentel on 01/06/2018.
//  Copyright © 2018 Mark Mansur. All rights reserved.
//

import UIKit

class DishViewController: UIViewController {
    @IBOutlet weak var dishTitle: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var proteine: UILabel!
    @IBOutlet weak var carbohydrates: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var ingredients: UIStackView!

    @IBAction func addTapped(_ sender: Any) {
        dismiss(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        dishTitle.text = Dish.current.title
        calories.text = "\(Dish.current.totalCalories)"
        fat.text = "\(Dish.current.totalFat)"
        proteine.text = "\(Dish.current.totalProteine)"
        carbohydrates.text = "\(Dish.current.totalCarbohydrates)"
        price.text = "\(Dish.current.price)"

        for ingredient in Dish.current.ingredients {
            let label = UILabel()
            label.textColor = .black
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 1
            label.text = ingredient.label
            label.font = label.font.withSize(17)
            ingredients.addArrangedSubview(label)
        }
    }
}
