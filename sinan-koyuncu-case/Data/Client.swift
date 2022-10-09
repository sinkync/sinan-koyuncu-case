//
//  Client.swift
//  sinan-koyuncu-case
//
//  Created by Sinan Koyuncu on 6.10.2022.
//

import Foundation
import Alamofire

class Client<T: Codable> {
    
    func request(_ request: Request, completion: @escaping (Swift.Result<T, AFError>) -> Void) {
        AF.request(request.url, method: request.method, parameters: request.parameters).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data, let parsedData = try? JSONDecoder().decode(T.self, from: data) else {
                    // Parsing error
                    return
                }
                
                completion(Result.success(parsedData))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
}
