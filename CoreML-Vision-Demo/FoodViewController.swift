//
//  FoodViewController.swift
//  CoreML-Vision-Demo
//
//  Created by Víctor Pimentel on 31/05/2018.
//  Copyright © 2018 Mark Mansur. All rights reserved.
//

import DrawerKit
import UIKit

class FoodViewController: UIViewController {
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var addButton: UIButton?
    @IBOutlet weak var calories: UILabel?
    @IBOutlet weak var fat: UILabel?
    @IBOutlet weak var proteine: UILabel?
    @IBOutlet weak var carbohydrates: UILabel?
    @IBOutlet weak var nutritionalTable: UIStackView?

    var food: Food? {
        didSet {
            if let food = food {
                label?.text = food.label
                calories?.text = "\(food.calories)"
                fat?.text = "\(food.fat)"
                proteine?.text = "\(food.proteine)"
                carbohydrates?.text = "\(food.carbohydrates)"
                nutritionalTable?.isHidden = false
                addButton?.isHidden = false
            } else {
                label?.text = "Buscando..."
                nutritionalTable?.isHidden = true
                addButton?.isHidden = true
            }
        }
    }

    var foodLabel: String? {
        get {
            return food?.label
        }
        set {
            food = Food(label: newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton?.isHidden = true
    }

    @IBAction func buttonTapped(_ sender: Any) {
        if let food = food {
            Dish.current.ingredients.append(food)
            presentingViewController?.dismiss(animated: true)
        }
    }
}

extension FoodViewController: DrawerPresentable {
    var heightOfPartiallyExpandedDrawer: CGFloat {
        return addButton!.superview!.frame.maxY
    }
}
