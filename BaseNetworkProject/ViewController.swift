//
//  ViewController.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/23/25.
//

import UIKit

class ViewController: BaseViewController {

    let lottoButton: UIButton = {
        let button = CustomButton(title: ButtonsTitle.lotto.rawValue)
        return button
    }()

    let movieButton: UIButton = {
        let button = CustomButton(title: ButtonsTitle.movie.rawValue)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func configureHierachy() {
        super.configureHierachy()

        [lottoButton, movieButton].forEach { view.addSubview($0) }
    }

    override func configureUI() {
        super.configureUI()

        lottoButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        movieButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    override func setConstraints() {
        super.setConstraints()

        [lottoButton, movieButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            lottoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            lottoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            lottoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            lottoButton.heightAnchor.constraint(equalToConstant: 40),

            movieButton.topAnchor.constraint(equalTo: lottoButton.bottomAnchor, constant: 20),
            movieButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            movieButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            movieButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func buttonTapped(_ sender: UIButton) {
        if sender.currentTitle == ButtonsTitle.lotto.rawValue {
            let vc = LottoViewController()
            present(vc, animated: true)
        } else {
            print("무비 버튼 클릭")
        }
    }
}

enum ButtonsTitle: String {
    case lotto = "Lotto 버튼"
    case movie = "Movie 버튼"
}
