//
//  LotteryModel.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/24/25.
//

import Foundation

// 서버에서 오는걸 조작해서 Int배열로 담아주는 방법 : CodingKey
struct LotteryModel: Decodable {
    let drwNo: Int
    let drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6: Int
    let bnusNo: Int
    let drwNoDate: String

    var lottoArray: [Int] {
        return [drwtNo1, drwtNo2, drwtNo3, drwtNo4, drwtNo5, drwtNo6, bnusNo]
    }

}
