//
//  Food.swift
//  CoreML-Vision-Demo
//
//  Created by Víctor Pimentel on 01/06/2018.
//  Copyright © 2018 Mark Mansur. All rights reserved.
//

import Foundation

enum FoodType {
    case salad
    case hotFood
}

struct Food {
    let label: String
    let calories: Int
    let fat: Int
    let proteine: Int
    let carbohydrates: Int
    let type: FoodType
}

extension Food {
    init?(label: String?) {
        guard let label = label else { return nil }

        switch label {
        case "Aceitunas":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Aguacate":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Albóndigas con Tomate":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Arroz Salvaje":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Atún":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Bacon":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Brocoli":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Brotes de Soja":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Canelones de Espinacas":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Cangrejo":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Canónigos":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Cebolla":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Cebolla Frita":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Croquetas":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Escalope de Pollo Empanado":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Garbanzos":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Huevo Duro":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Espárragos":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Espinacas":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Espirales a la Carbonara":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Espirales de Pasta":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Maíz":
            self.init(label: "Not HotDog", calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Pimientos Verdes Fritos":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Salsa Boloñesa":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Fruta de Pobre":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Merluza a la Bilbaína":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Piña":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Mezclum Gourmet":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Pisto Manchego":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Salsa César":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Moussaka":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Salsa Miel y Mostaza":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Salsa Yogur":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Plátanos":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Jamón York":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Palmito":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Pollo":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Salsa de Queso":
            self.init(label: "¡Atrás, Satanas!", calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Judías Verdes con Bacon":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Pan":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Queso Rallado":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Tomates":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Kiwi":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Pasas":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Queso de Cabra":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Pesto":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Tortilla":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Macarrones":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Pimientos Rojos Asados":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Lomo Adobado":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .hotFood)
        case "Queso en Dados":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Remolacha":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        case "Uvas":
            self.init(label: label, calories: 0, fat: 0, proteine: 0, carbohydrates: 0, type: .salad)
        default:
            return nil
        }
    }
}
