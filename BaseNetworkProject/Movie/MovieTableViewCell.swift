//
//  MovieTableViewCell.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/23/25.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let id = "MovieTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
