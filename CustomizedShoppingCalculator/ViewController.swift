//
//  ViewController.swift
//  CustomizedShoppingCalculator
//
//  Created by Hemanth Attal on 6/12/19.
//  Copyright © 2019 Hemanth Attal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var originalPrice: UITextField!
    @IBOutlet var discount: UITextField!
    @IBOutlet var afterDiscount: UITextField!
    @IBOutlet var salesTax: UITextField!
    @IBOutlet var takeHomePrice: UITextField!
    
    var orgPrice = 0.0, disc = 0.0, addTax = 0.0, afterDisc = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      afterDiscount.isUserInteractionEnabled = false
      takeHomePrice.isUserInteractionEnabled = false
        
        originalPrice.addTarget(self, action: #selector(textChangeConditions(_:)), for: .editingChanged)
         discount.addTarget(self, action: #selector(textChangeConditions(_:)), for: .editingChanged)
         salesTax.addTarget(self, action: #selector(textChangeConditions(_:)), for: .editingChanged)

        
    }
    
    
    @objc func textChangeConditions(_ textField: UITextField)  {
        
        if originalPrice.text == "" || discount.text == "" {
            afterDiscount.text = ""
            takeHomePrice.text = ""
        }
        else if salesTax.text == ""{
            takeHomePrice.text = ""
        }
        
        if originalPrice.text != "" && discount.text != "" && salesTax.text != "" {
            print("we can perform Selling price task here")
            sellingPriceCalculation()
        }
        else if originalPrice.text != "" && discount.text != "" {
            print("we can perform After discount task here")
            afterDiscountCalculation()
        }
        else {
            print("missing data")
        }

    }
    
    func afterDiscountCalculation()  {
        if let text = discount.text {
            disc = Double(text)!
        }
        if let text = originalPrice.text {
            orgPrice = Double(text)!
        }
        afterDisc = orgPrice - ((disc / 100) * orgPrice)
        afterDiscount?.text = String(afterDisc)
    }
    
    func sellingPriceCalculation() {
        afterDiscountCalculation()
        if let text = salesTax.text {
            addTax = Double(text)!
        }
        let saleTax = afterDisc + (afterDisc * (addTax / 100))
        takeHomePrice.text = String(saleTax)
    }
    
}

