//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 30.08.2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func request<T: Codable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) }

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    func request<T: Codable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
                    
            let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                    let errorDescription = "Invalid Response. Status code: \(statusCode)"
                    completion(.failure(NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: errorDescription])))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "Invalid Response data", code: 0)))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                }catch let error {
                    completion(.failure(error))
                }
                        
            }
                
            
            task.resume()
        }
}
