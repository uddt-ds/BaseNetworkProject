//
//  UITextField+Extension.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/23/25.
//

import UIKit

extension UITextField {
    static var shapeLayer: CAShapeLayer!

    func addBottomView(lineHeight: CGFloat, color: CGColor) {
        borderStyle = .none

        //이 시점에서 bounds.width가 0이라서 못그리는 상황
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.size.height + lineHeight))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.size.height + lineHeight))
        path.close()

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = path.lineWidth
        shapeLayer.fillColor = color
        shapeLayer.strokeColor = color
        layer.addSublayer(shapeLayer)
    }
}
