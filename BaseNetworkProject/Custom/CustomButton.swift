//
//  CustomButton.swift
//  NetworkBaseProject
//
//  Created by Lee on 7/23/25.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    init(title: String) {
        super.init(frame: .zero)
        setButtonUI(title: title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setButtonUI(title: String) {
        setTitle(title, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 12)
        setTitleColor(.white, for: .normal)
        backgroundColor = .black
    }

}
