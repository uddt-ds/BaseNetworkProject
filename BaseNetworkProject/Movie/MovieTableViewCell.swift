//
//  MovieTableViewCell.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/23/25.
//

import UIKit

class MovieTableViewCell: UITableViewCell, BaseCellProtocol {

    static let id = "MovieTableViewCell"

    let label: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .boldSystemFont(ofSize: 12)
        label.backgroundColor = .white
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "테스트"
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020-04-01"
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierachy()
        configureUI()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureHierachy() {
        [label, movieTitleLabel, dateLabel].forEach { contentView.addSubview($0) }
    }

    func configureUI() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }

    func setConstraints() {
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(25)
        }

        movieTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
            make.height.equalTo(25)
        }

        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(movieTitleLabel.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(25)
        }
    }

    func configureCell(data: Movie, indexNum: Int) {
        label.text = "\(indexNum + 1)"
        movieTitleLabel.text = data.title
        dateLabel.text = data.date
    }
}
