//
//  PickerViewData.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/24/25.
//

import Foundation

struct PickerViewData {
    //TODO: 하드코딩 개선하기
    let pickerData = 1...1181

    var pickerArr: [Int] {
        return [Int](pickerData)
    }
}
