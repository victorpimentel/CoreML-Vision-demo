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

    var title: String {
        return "Ensalada" // "Plato Combinado"
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
        switch title {
        case "Plato Combinado":
            return 3
        case "Ensalada":
            return 2
        default:
            return 0
        }
    }
}
