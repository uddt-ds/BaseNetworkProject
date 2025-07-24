//
//  MovieViewController.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/23/25.
//

import UIKit
import Alamofire

class MovieViewController: UIViewController, BaseVCProtocol {

    var currentData: [MovieData] = []
    var currentDate: String = ""

    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.keyboardType = .default
        textField.font = .boldSystemFont(ofSize: 16)
        textField.textColor = .white
        return textField
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("검색", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(searchTapped), for: .touchUpInside)
        return button
    }()

    private let tableView = UITableView()

    override func viewDidLoad() {
        view.backgroundColor = .black
        configureHierachy()
        configureUI()
        setConstraints()

//        currentData = MovieInfo.movies
        currentDate = DateFormat.makeYesterDay()
        print(currentDate)
        fetch(date: currentDate)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.id)

        textField.delegate = self
    }

    override func viewDidLayoutSubviews() {
        let underLine = CALayer()
        underLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        underLine.backgroundColor = UIColor.white.cgColor

        textField.layer.addSublayer(underLine)
    }

    func configureHierachy() {
        [textField, button, tableView].forEach { view.addSubview($0) }
    }

    func configureUI() {
        tableView.rowHeight = 50
        tableView.backgroundColor = .clear
    }


    func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalTo(button.snp.leading).offset(-16)
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

    private func fetch(date: String) {
        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=db57e192674e643639b0af1738f61186&targetDt=\(date)"

        AF.request(url, method: .get).responseDecodable(of: MovieResult.self) { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.currentData = data.boxOfficeResult.rankInData
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    @objc private func searchTapped(_ sender: Any) {
        guard let text = textField.text else { return }
//        let vc = EasyMovieViewController(date: text)
//        present(vc, animated: true)
//        currentDate = text
        fetch(date: text)
        view.endEditing(true)
    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.id, for: indexPath) as! MovieTableViewCell
        cell.configureCell(data: currentData[indexPath.row])
        return cell
    }
}

extension MovieViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTapped(textField)
        return true
    }
}
