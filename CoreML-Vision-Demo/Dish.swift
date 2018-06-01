//
//  Dish.swift
//  CoreML-Vision-Demo
//
//  Created by Víctor Pimentel on 01/06/2018.
//  Copyright © 2018 Mark Mansur. All rights reserved.
//

import Foundation

class Dish {
    static let current = Dish()

    var ingredients: [Food] = []

    var type: FoodType {
        if ingredients.contains(where: { $0.type == .hotFood }) {
            return .hotFood
        } else {
            return .salad
        }
    }

    var title: String {
        switch type {
        case .salad:
            return "Ensalada"
        case .hotFood:
            return "Plato Combinado"
        }
    }

    var totalCalories: Int {
        return ingredients.reduce(0) { $0 + $1.calories }
    }

    var totalFat: Int {
        return ingredients.reduce(0) { $0 + $1.fat }
    }

    var totalProteine: Int {
        return ingredients.reduce(0) { $0 + $1.proteine }
    }

    var totalCarbohydrates: Int {
        return ingredients.reduce(0) { $0 + $1.carbohydrates }
    }

    var price: Int {
        switch type {
        case .salad:
            return 2
        case .hotFood:
            return 3
        }
    }
}
