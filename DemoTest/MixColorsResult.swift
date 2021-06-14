//
//  MixColors.swift
//  DemoTest
//
//  Created by Benjamin Dumont on 11/06/2021.
//

import UIKit

enum PrimaryColorResult {
    case red
    case blue
    case yellow
    
    var color: UIColor {
        switch self {
        case .red:
            return UIColor.red
        case .blue:
            return UIColor.blue
        case .yellow:
            return UIColor.yellow
        }
    }
}


struct MixColorsResult {
    
    func mixColors(_ color1: PrimaryColorResult, _ color2: PrimaryColorResult) -> UIColor {
        switch (color1, color2) {
        case (let x, let y) where x == y:
            return x.color
        case (.red, .blue), (.blue, .red):
            return UIColor.purple
        case (.yellow, .red), (.red, .yellow):
            return UIColor.orange
        case (.blue, .yellow), (.yellow, .blue):
            return UIColor.green
        default:
            fatalError()
        }
    }
    
}
