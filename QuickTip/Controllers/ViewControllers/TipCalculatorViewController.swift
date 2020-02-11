//
//  TipCalculatorViewController.swift
//  QuickTip
//
//  Created by Jon Corn on 2/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    // bill amount
    @IBOutlet weak var billAmountLabel: TipLabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentSegementController: UISegmentedControl!
    // tip
    @IBOutlet weak var tipLabel: TipLabel!
    @IBOutlet weak var tipDollarAmountLabel: UILabel!
    // total
    @IBOutlet weak var totalLabel: TipLabel!
    @IBOutlet weak var totalDollarAmountLabel: UILabel!
    // buttons
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    // views
    @IBOutlet var mainView: UIView!
    

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billAmountTextField.delegate = self
        setupViews()
    }
    
    // MARK: - Actions
    // takes the bill's text field string value and converts to double
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let billAmountText = billAmountTextField.text,
            let billAmount = Double(billAmountText) else {return}
        // which is passed into the calculatetip method
        calculateTip(billAmount)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        billAmountTextField.text = ""
        tipDollarAmountLabel.text = "$0.00"
        totalDollarAmountLabel.text = "$0.00"
        // resetting position to 15%
        tipPercentSegementController.selectedSegmentIndex = 0
    }
    
    
    // MARK: - Methods
    // end editing when user presses return on keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.endEditing(false)
    }
    
    func setupViews() {
        self.mainView.backgroundColor = .topViewColor
        totalDollarAmountLabel.textColor = .white
        billAmountLabel.textColor = .white
        resetButton.backgroundColor = .buttonColor
        resetButton.tintColor = .white
        calculateButton.backgroundColor = .buttonColor
        calculateButton.tintColor = .white
    }
    
    func calculateTip(_ tip: Double) {
        guard let billAmountText = billAmountTextField.text,
            let billAmount = Double(billAmountText) else {return}
        totalDollarAmountLabel.text = billAmountText
        if tipPercentSegementController.selectedSegmentIndex == 0 {
            let tipAmount = billAmount * 0.15
            let totalAmount = tipAmount + billAmount
            tipDollarAmountLabel.text = String(format: "$%.02f", tipAmount)
            totalDollarAmountLabel.text = String(format: "$%.02f", totalAmount)
        }
        if tipPercentSegementController.selectedSegmentIndex == 1 {
            let tipAmount = billAmount * 0.20
            let totalAmount = tipAmount + billAmount
            tipDollarAmountLabel.text = String("$\(tipAmount)")
            totalDollarAmountLabel.text = String("$\(totalAmount)")
        }
        if tipPercentSegementController.selectedSegmentIndex == 2 {
            let tipAmount = billAmount * 0.25
            let totalAmount = tipAmount + billAmount
            tipDollarAmountLabel.text = String("$\(tipAmount)")
            totalDollarAmountLabel.text = String("$\(totalAmount)")
        }
    }
    
}
