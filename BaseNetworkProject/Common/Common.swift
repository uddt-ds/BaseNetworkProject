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
}

struct DateFormat {
    static let dateFormatter = DateFormatter()
    static let dateFormatter2 = DateFormatter()

    static func getDate(str: String) -> Date {
        dateFormatter.dateFormat = DateType.justStr.rawValue
        return DateFormat.dateFormatter.date(from: str) ?? Date()
    }

    static func getString(date: Date) -> String {
        dateFormatter2.dateFormat = DateType.hyphenDate.rawValue
        return DateFormat.dateFormatter2.string(from: date)
    }
}
