//
//  BaseViewController.swift
//  NetworkBaseProject
//
//  Created by Lee on 7/23/25.
//

import UIKit

// Protocol로 사용하면 메서드 사용의 강제가 가능한 장점 외에 다른게 또 있을까
// 둘다 private 접근제어를 못하는데...

// 규칙을 만드는 (prefix를 붙이는) 뭐가 있는지 보는 형태로..
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        configureHierachy()
        configureUI()
        setConstraints()
    }

    func configureHierachy() {
        ///
    }

    func configureUI() {

    }

    func setConstraints() {

    }
}


