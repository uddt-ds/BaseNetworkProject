//
//  PickerViewData.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/24/25.
//

import Foundation

/*
 1. 현재 시점에서 가장 최근의 토요일 찾기(BaseDate)
 2. 해당 토요일을 Date로 변환
 3. Calendar로 7 더하기
 4. 3번에서 7 더할때마다 회차에 += 1
 5. 최근 토요일을 BaseDate로 바꿔주기
 */

struct PickerViewData {
    // 기준 회차, 기준 Date
    static var baseLotteryCount = 1181

    static var baseDate: String = ""

    static var lotteryCount: Int {
        if DateFormat.isUpdateDay() {
            return baseLotteryCount + 1
        } else {
            return baseLotteryCount
        }
    }

    let pickerData = 1...Self.lotteryCount

    var pickerArr: [Int] {
        return [Int](pickerData)
    }
}
