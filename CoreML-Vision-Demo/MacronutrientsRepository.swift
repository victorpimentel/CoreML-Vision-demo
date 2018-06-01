//
//  MacronutrientsRepository.swift
//  CoreML-Vision-Demo
//
//  Created by william on 31/05/2018.
//  Copyright © 2018 Mark Mansur. All rights reserved.
//

import Foundation

class MacronutrientsRepository {
    private let macros: [String: Macronutrients]

    init() {
        macros = [String: Macronutrients]()
    }

    func getByName(name: String) -> Macronutrients? {
        return macros[name]
    }
}
