//
//  APIClient.swift
//  alamotest
//
//  Created by David_Ch_L on 12/11/16.
//  Copyright © 2016 David_Ch_L. All rights reserved.
//

import Foundation
import Alamofire

struct APIClient {
    
    enum Router: URLRequestConvertible {
        static let baseURLString = "https://plasticfishes.herokuapp.com/"
        case fish
        
        var method: HTTPMethod {
            switch self {
            case .fish: return .get
            }
        }
        
        var path: String {
            switch self {
            case .fish: return "random.json"
            }
        }
        
        var params: [String: AnyObject] {
            switch self {
            case .fish: return [:]
            }
        }
        
        func asURLRequest() throws -> URLRequest {
            let baseURL = try Router.baseURLString.asURL()
            var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            return try URLEncoding.default.encode(urlRequest, with: params)
        }
    }
    
}
