//
//  String+Extension.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/24/25.
//

import UIKit

extension String {
    func getAttributedString(_ color: UIColor, target: String) -> NSAttributedString {

        let attributed = NSMutableAttributedString(string: self)
        let nsString = self as NSString
        let range = nsString.range(of: target)

        attributed.addAttributes([.foregroundColor: color], range: range)

        return attributed
    }
}
