//
//  Common.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/24/25.
//

import Foundation

enum DateType: String {
    case justStr = "yyyyMMdd"
    case hyphenDate = "yyyy-MM-dd"
    case dateWithTime = "yyyyMMddHHmm"
}

struct DateFormat {
    static let dateFormatter = DateFormatter()
    static let dateFormatter2 = DateFormatter()
    static let dateFormatter3 = DateFormatter()

    static func getDate(str: String) -> Date {
        dateFormatter.dateFormat = DateType.justStr.rawValue
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return DateFormat.dateFormatter.date(from: str) ?? Date()
    }

    static func makeYesterDay() -> String {
        let yDay = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        dateFormatter.dateFormat = DateType.justStr.rawValue
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: yDay)
    }

    static func getString(date: Date) -> String {
        dateFormatter2.dateFormat = DateType.hyphenDate.rawValue
        dateFormatter2.locale = Locale(identifier: "ko_KR")
        return dateFormatter2.string(from: date)
    }

    static func getStringWithTime(date: Date) -> String {
        dateFormatter3.dateFormat = DateType.dateWithTime.rawValue
        dateFormatter3.locale = Locale(identifier: "ko_KR")
        return dateFormatter3.string(from: date)
    }

    static func getDateWithTime(str: String) -> Date {
        dateFormatter3.dateFormat = DateType.dateWithTime.rawValue
        dateFormatter3.locale = Locale(identifier: "ko_KR")
        return dateFormatter3.date(from: str) ?? Date()
    }

    //TODO: BaseDate가 정상적으로 바뀌는지 테스트가 필요함
    static func isUpdateDay() -> Bool {
        // 로또 당첨시간 고려 22시 30분에 업데이트
        let baseDate = getDateWithTime(str: PickerViewData.baseDate)
        let currentDate = Date()
        guard let nextSaturday = Calendar.current.date(byAdding: .day, value: 7, to: baseDate) else { return false }
        PickerViewData.baseDate = getStringWithTime(date: baseDate)
        return Calendar.current.isDate(nextSaturday, inSameDayAs: currentDate)
    }
}
