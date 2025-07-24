//
//  UIButton+Extension.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/24/25.
//

import UIKit

extension UIButton {
    func setupColor(_ num: Int) {
        switch num {
        case 1...10:
            self.backgroundColor = .systemYellow
        case 11...20:
            self.backgroundColor = .systemBlue
        case 21...30:
            self.backgroundColor = .systemRed
        case 31...40:
            self.backgroundColor = .systemGray
        case 41...45:
            self.backgroundColor = .systemGreen
        default:
            self.backgroundColor = .black
        }
    }
}
