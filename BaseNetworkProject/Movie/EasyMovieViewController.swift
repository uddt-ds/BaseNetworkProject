//
//  EasyMovieViewController.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/24/25.
//

import UIKit
import Alamofire

class EasyMovieViewController: UIViewController, BaseVCProtocol {

    private var labels: [UILabel] = []

    var date: String

    var currentData: [MovieData] = []

    init(date: String) {
        self.date = date
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: labels)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        configureHierachy()
        configureUI()
        setConstraints()
        checkInitialDate()
        self.fecth(date: date)
    }

    private func checkInitialDate() {
        if self.date == "" {
            date = "20250723"
        }
    }

    private func setupLabel() {
        for _ in 0..<9 {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.textColor = .black
            label.textAlignment = .center
            label.text = ""
            labels.append(label)
        }
    }

    func configureHierachy() {
        [stackView, button].forEach { view.addSubview($0) }
    }

    func configureUI() {
        view.backgroundColor = .white
    }

    func setConstraints() {
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(300)
        }

        button.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(40)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(44)
        }
    }

    private func fecth(date: String) {
        let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=db57e192674e643639b0af1738f61186&targetDt=\(date)"

        AF.request(url, method: .get).responseDecodable(of: MovieResult.self) { response in
            switch response.result {
            case .success(let data):
                self.currentData = data.boxOfficeResult.rankInData
                DispatchQueue.main.async {
                    self.setupLabel(data: self.currentData)
                    print(self.currentData)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    private func setupLabel(data: [MovieData]) {
        labels[0].text = data[0].rank
        labels[1].text = data[0].movieNm
        labels[2].text = data[0].openDt
        labels[3].text = data[1].rank
        labels[4].text = data[1].movieNm
        labels[5].text = data[1].openDt
        labels[6].text = data[2].rank
        labels[7].text = data[2].movieNm
        labels[8].text = data[2].openDt
    }

    @objc private func buttonTapped() {
        dismiss(animated: true)
    }
}
