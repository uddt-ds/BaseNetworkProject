//
//  UILabel+Extension.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/23/25.
//

import UIKit

extension UILabel {
    func designLabel(title: String, font: UIFont, color: UIColor) {
        text = title
        self.font = font
        textColor = color
    }
}
