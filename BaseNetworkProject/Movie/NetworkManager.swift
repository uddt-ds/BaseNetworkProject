//
//  NetworkManager.swift
//  BaseNetworkProject
//
//  Created by Lee on 7/27/25.
//

import Foundation

struct NetworkManager {
    static func makeComponents(date: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = APIData.scheme.rawValue
        components.host = APIData.host.rawValue
        components.path = APIData.path.rawValue
        components.queryItems = [
            Query.key.item,
            Query.targetDt(date).item
        ]
        return components
    }
}

enum APIData: String {
    case scheme = "https"
    case host = "kobis.or.kr"
    case path = "/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
}

enum Query {
    case key
    case targetDt(String)

    var item: URLQueryItem {
        switch self {
        case .key:
            return URLQueryItem(name: "key", value: "db57e192674e643639b0af1738f61186")
        case .targetDt(let date):
            return URLQueryItem(name: "targetDt", value: date)
        }
    }
}
