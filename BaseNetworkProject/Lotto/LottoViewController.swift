//
//  LottoViewController.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/23/25.
//

import UIKit
import SnapKit

class LottoViewController: BaseViewController {

    let pickerViewData = PickerViewData()

    private var currentNum: Int = 0

    private let pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .line
        textField.inputView = pickerView
        textField.font = .boldSystemFont(ofSize: 14)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 6
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.clipsToBounds = true
        return textField
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        let title = "당첨번호 안내"
        label.designLabel(title: title, font: .boldSystemFont(ofSize: 12), color: .black)
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        let title = "2020-05-30 추첨"
        label.designLabel(title: title, font: .systemFont(ofSize: 10), color: .lightGray)
        return label
    }()

    private let separateLine: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()
        let title = ""
        let fullText = title
        label.designLabel(title: title, font: .boldSystemFont(ofSize: 16), color: .black)
        label.textAlignment = .center
        return label
    }()

    private let leftBallStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.alignment = .center
        return stackView
    }()

    private let plusLabel: UILabel = {
        let label = UILabel()
        label.designLabel(title: "+", font: .boldSystemFont(ofSize: 12), color: .black)
        label.textAlignment = .center
        return label
    }()

    private let lastButton: UIButton = {
        let button = UIButton()
        button.setTitle("12", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemYellow
        button.isUserInteractionEnabled = false
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        return button
    }()

    private let bonusLabel: UILabel = {
        let label = UILabel()
        let title = "보너스"
        label.designLabel(title: title, font: .boldSystemFont(ofSize: 10), color: .black)
        return label
    }()

    private let lastStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.alignment = .center
        return stackView
    }()

    private let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .top
        stackView.spacing = 8
        return stackView
    }()

    var buttonArray: [UIButton] = []
    var numberArray: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtons()

        pickerView.dataSource = self
        pickerView.delegate = self
        let row = pickerView.numberOfRows(inComponent: 0) - 1
        pickerView.selectRow(row, inComponent: 0, animated: true)

        initialSet()

        backgroundTapped()
    }

    private func initialSet() {
        currentNum = pickerViewData.pickerArr.last ?? 0
        let num = currentNum
        let fullText = "\(num)회 당첨결과"
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "\(num)회")
        attributedString.addAttributes([.foregroundColor: UIColor.systemYellow], range: range)
        resultLabel.attributedText = attributedString

        textField.text = "\(num)"
    }

    override func configureHierachy() {
        super.configureHierachy()
        [textField, titleLabel, dateLabel, separateLine, resultLabel, totalStackView].forEach { view.addSubview($0) }
        [lastButton, bonusLabel].forEach { lastStackView.addArrangedSubview($0) }
        [leftBallStackView, plusLabel, lastStackView].forEach { totalStackView.addArrangedSubview($0) }

    }

    override func configureUI() {
        super.configureUI()
    }

    override func setConstraints() {
        super.setConstraints()

        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.directionalHorizontalEdges.equalToSuperview().inset(8)
            make.height.equalTo(44)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.height.equalTo(30)
        }

        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(30)
        }

        separateLine.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.directionalHorizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }

        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(separateLine.snp.bottom).offset(20)
            make.directionalHorizontalEdges.equalToSuperview().inset(50)
            make.height.equalTo(40)
        }

        leftBallStackView.snp.makeConstraints { make in
            make.height.equalTo(36)
        }

        plusLabel.snp.makeConstraints { make in
            make.height.equalTo(36)
        }

        lastButton.snp.makeConstraints { make in
            make.size.equalTo(36)
        }

        bonusLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }

        totalStackView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(16)
            make.directionalHorizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(60)
        }
    }

    private func makeButtons() {
        for i in 0..<7 {
            let button = UIButton()
            button.setTitle("12", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemYellow
            button.isUserInteractionEnabled = false
            button.tag = i

            button.layer.cornerRadius = 18
            button.clipsToBounds = true

            button.snp.makeConstraints { make in
                make.size.equalTo(36)
            }

            leftBallStackView.addArrangedSubview(button)
            buttonArray.append(button)
        }
    }
}

extension LottoViewController {
    func backgroundTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tap)
    }

    @objc private func viewTapped() {
        view.endEditing(true)
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.pickerArr.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerViewData.pickerArr[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        let num = row + 1
        let fullText = "\(num)회 당첨결과"
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "\(num)회")
        attributedString.addAttributes([.foregroundColor: UIColor.systemYellow], range: range)
        resultLabel.attributedText = attributedString

        textField.text = "\(num)"
    }
}
