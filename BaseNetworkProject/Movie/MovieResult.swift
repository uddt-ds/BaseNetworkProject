//
//  MovieResult.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/24/25.
//

import Foundation

struct MovieResult: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    let dailyBoxOfficeList: [MovieData]

    var rankInData: [MovieData] {
        return [MovieData](dailyBoxOfficeList.prefix(3))
    }
}

struct MovieData: Decodable {
    let rank: String
    let movieNm: String
    let openDt: String
}
