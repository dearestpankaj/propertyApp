//
//  NetworkOperations.swift
//  PropertyApp
//
//  Created by Pankaj Sachdeva on 31/08/19.
//  Copyright © 2019 Pankaj Sachdeva. All rights reserved.
//

import Foundation
import Alamofire

public enum NetworkError: Error {
    case unknownError
    case noDataFound
    case invalidResponse
    case timeOut
    case decodeError
}
class NetworkOperations {
    
    class func fetchResponse<T: Decodable>(url: String, completion: @escaping (Swift.Result<T, NetworkError>) -> Void) {
        Alamofire.request(url).responseJSON { response in
            guard let data = response.data else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            do {
                let values = try JSONDecoder().decode(T.self, from: data)
                completion(.success(values))
            } catch {
                completion(.failure(.decodeError))
            }
        }
    }
}
