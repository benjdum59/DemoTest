//
//  ViewController.swift
//  DemoTest
//
//  Created by Benjamin Dumont on 11/06/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var resultView: UIView!
    @IBOutlet private var redViewFirstLine: UIView!
    @IBOutlet private var blueViewFirstLine: UIView!
    @IBOutlet private var yellowViewFirstLine: UIView!
    @IBOutlet private var redViewSecondLine: UIView!
    @IBOutlet private var blueViewSecondLine: UIView!
    @IBOutlet private var yellowViewSecondLine: UIView!
    
    lazy var allViews = [resultView,
                         redViewFirstLine,
                         blueViewFirstLine,
                         yellowViewFirstLine,
                         redViewSecondLine,
                         blueViewSecondLine,
                         yellowViewSecondLine]
    
    private var color1: PrimaryColorResult? {
        didSet {
            guard let color = color1 else {
                return
            }
            removeBorder(views: [redViewFirstLine, blueViewFirstLine, yellowViewFirstLine])
            switch color {
            case .red:
                updateBorder(view: redViewFirstLine)
            case .blue:
                updateBorder(view: blueViewFirstLine)
            case .yellow:
                updateBorder(view: yellowViewFirstLine)
            }
            showResult()
        }
    }
    
    private var color2: PrimaryColorResult? {
        didSet {
            guard let color = color2 else {
                return
            }
            removeBorder(views: [redViewSecondLine, blueViewSecondLine, yellowViewSecondLine])
            switch color {
            case .red:
                updateBorder(view: redViewSecondLine)
            case .blue:
                updateBorder(view: blueViewSecondLine)
            case .yellow:
                updateBorder(view: yellowViewSecondLine)
            }
            showResult()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCornerRadius()
    }
    
    private func initCornerRadius() {
        allViews.forEach { view in
            view?.layer.cornerRadius = 20
        }
    }
    
    private func updateBorder(view: UIView) {
        UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
                view.layer.borderColor = UIColor.black.cgColor
                view.layer.borderWidth = 5
        }, completion: nil)
    }
    
    private func removeBorder(views: [UIView]) {
        views.forEach { view in
            UIView.transition(with: view, duration: 0.3, options: .transitionCrossDissolve, animations: {
                    view.layer.borderWidth = 0
            }, completion: nil)
        }
    }
    
    private func showResult() {
        guard let color1 = color1,
              let color2 = color2 else {
            return
        }
        resultView.backgroundColor = MixColorsResult().mixColors(color1, color2)
    }

    @IBAction private func firstColorRedPressed(_ sender: UIButton) {
        color1 = .red
    }
    
    @IBAction private func firstColorBluePressed(_ sender: UIButton) {
        color1 = .blue
    }
    
    @IBAction private func firstColorYellowPressed(_ sender: UIButton) {
        color1 = .yellow
    }
    
    @IBAction private func secondColorRedPressed(_ sender: UIButton) {
        color2 = .red
    }
    
    @IBAction private func secondColorBluePressed(_ sender: UIButton) {
        color2 = .blue
    }
    
    @IBAction private func secondColorYellowPressed(_ sender: UIButton) {
        color2 = .yellow
    }
    
}

