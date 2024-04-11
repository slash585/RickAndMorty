//
//  RMService.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 9.04.2024.
//

import Foundation

enum RMServiceErrors: Error {
    case failedToCreateRequest
    case failedToGetData
    case failedToDecodeError
}

/// Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init(){}
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    func execute<T: Codable>(_ request: RMRequest, expecting type: T.Type, completion: @escaping(Result<T, RMServiceErrors>) -> Void) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.failedToGetData))
                return
            }
                        
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch let error {
                print(error)
                completion(.failure(.failedToDecodeError))
            }
        }
        
        task.resume()
    }
    
    // MARK: - Private methods
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
}
