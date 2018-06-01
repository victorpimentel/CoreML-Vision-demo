//
//  Food.swift
//  CoreML-Vision-Demo
//
//  Created by Víctor Pimentel on 01/06/2018.
//  Copyright © 2018 Mark Mansur. All rights reserved.
//

import Foundation

struct Food {
    let label: String
    let caloriesCount: Int
    let proteineCount: Int
    let carbohydratesCount: Int
}

extension Food {
    init?(label: String?) {
        guard let label = label else { return nil }

        switch label {
        case "Aceitunas":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Aguacate":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Albóndigas con Tomate":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Arroz Salvaje":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Atún":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Bacon":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Brocoli":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Brotes de Soja":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Canelones de Espinacas":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Cangrejo":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Canónigos":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Cebolla":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Cebolla Frita":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Croquetas":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Escalope de Pollo Empanado":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Garbanzos":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Huevo Duro":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Espárragos":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Espinacas":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Espirales a la Carbonara":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Espirales de Pasta":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Maíz":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Pimientos Verdes Fritos":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Salsa Boloñesa":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Fruta de Pobre":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Merluza a la Bilbaína":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Piña":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Mezclum Gourmet":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Pisto Manchego":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Salsa César":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Moussaka":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Salsa Miel y Mostaza":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Salsa Yogur":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Plátanos":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Jamón York":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Palmito":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Pollo":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Salsa de Queso":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Judías Verdes con Bacon":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Pan":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Queso Rallado":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Tomates":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Kiwi":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Pasas":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Queso de Cabra":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Pesto":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Tortilla":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Macarrones":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Pimientos Rojos Asados":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Lomo Adobado":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Queso en Dados":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Remolacha":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        case "Uvas":
            self.init(label: label, caloriesCount: 0, proteineCount: 0, carbohydratesCount: 0)
        default:
            return nil
        }
    }
}
