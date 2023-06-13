//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorMainViewController: UIViewController {

    @IBOutlet var calculatorScrollView: UIScrollView!
    @IBOutlet var calculatorStackView: UIStackView!
    @IBOutlet var operandLabel: UILabel!
    @IBOutlet var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchUpPointButton(_ sender: UIButton) {
        let currentNumberText = operandLabel.text ?? "0"
        let newPointText = sender.titleLabel?.text ?? "."
        let isPoint = currentNumberText.contains(".")
        
        if isPoint == false {
            operandLabel.text = currentNumberText + newPointText
        }
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        let currentNumberText = operandLabel.text ?? "0"
        let newNumberText = sender.titleLabel?.text ?? "0"
        
        guard currentNumberText == "0" else {
            operandLabel.text = currentNumberText + newNumberText
            return
        }

        guard newNumberText == "00" else {
            operandLabel.text = newNumberText
            return
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        let newOperator =  sender.titleLabel?.text ?? "+"
        
        if let newOperand = operandLabel.text, Double(newOperand) != 0 {
            updateCalculatorRecordView(by: newOperator, and: newOperand)
            operandLabel.text = "0"
            updateScrollFocus()
        }
        
        operatorLabel.text = newOperator
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        operandLabel.text = "0"
    }
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
        var currentOperandText = operandLabel.text ?? "0"
        let isCurrentSign = currentOperandText.contains("-")
        
        if isCurrentSign == true {
            currentOperandText.removeFirst()
            operandLabel.text = currentOperandText
        } else {
            operandLabel.text = "-" + currentOperandText
        }
    }
    
    func updateCalculatorRecordView(by newOperator: String, and newOperand: String) {
        let newOperandLabel: UILabel = createUILabel(text: newOperand)
        let newOperatorLabel: UILabel = createUILabel(text: newOperator)
        let newStackVIew = createUIStackView(laber: newOperatorLabel, newOperandLabel)
        
        calculatorStackView.addArrangedSubview(newStackVIew)
    }
    
    private func createUILabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    private func createUIStackView(laber: UILabel...) -> UIStackView {
        let newStackView = UIStackView()
        newStackView.spacing = 8
        newStackView.axis = .horizontal
        newStackView.alignment = .fill
        newStackView.distribution = .fill
        
        
        laber.forEach{ newStackView.addArrangedSubview($0) }
        
        return newStackView
    }
    
    func updateScrollFocus() {
        calculatorScrollView.layoutIfNeeded()
        
        let scrollViewHeigth =
        calculatorScrollView.contentSize.height - calculatorScrollView.bounds.height
        
        calculatorScrollView
            .setContentOffset(CGPoint(x: 0, y: scrollViewHeigth), animated: true)
    }
}

