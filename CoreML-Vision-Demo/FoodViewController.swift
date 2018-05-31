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

    var foodLabel: String? {
        get {
            return label?.text
        }
        set {
            if let newValue = newValue {
                label?.text = newValue
                addButton?.isHidden = false
            } else {
                label?.text = "Buscando..."
                addButton?.isHidden = true
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addButton?.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FoodViewController: DrawerPresentable {
    var heightOfPartiallyExpandedDrawer: CGFloat {
        return addButton!.superview!.frame.maxY
    }
}
