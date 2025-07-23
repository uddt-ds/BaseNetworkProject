//
//  MovieViewController.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/23/25.
//

import UIKit

class MovieViewController: UIViewController, BaseVCProtocol {

    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "날짜를 검색해주세요"
        textField.borderStyle = .none
        textField.keyboardType = .default
        textField.font = .boldSystemFont(ofSize: 14)
        textField.addBottomView(lineHeight: 3, color: UIColor.white.cgColor)
        return textField
    }()

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    let tableView = UITableView()

    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .black
        configureHierachy()
        setConstraints()
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.id)
    }

    func configureHierachy() {
        [textField, button, tableView].forEach { view.addSubview($0) }
    }

    func configureUI() {

    }


    func setConstraints() {

        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalTo(button.snp.leading).offset(16)
            make.height.equalTo(44)
        }

        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.top)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
            make.width.equalTo(60)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(12)
            make.directionalHorizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.id, for: indexPath) as! MovieTableViewCell
        return cell
    }
    

}
