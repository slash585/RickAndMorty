//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 30.08.2024.
//

import Foundation

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethods { get }
    var header: [String: String]? { get }
    
    func request() -> URLRequest
}

enum Endpoint {
    case getCharacters
    case getLocations
    case getEpisodes
}

extension Endpoint: EndpointProtocol {
    var baseUrl: String {
        return "https://rickandmortyapi.com/api"
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/character"
        case .getEpisodes:
            return "/location"
        case .getLocations:
            return "/episode"
        }
    }
    
    var method: HTTPMethods {
        switch self {
        case .getCharacters:
            return .get
        case .getEpisodes:
            return .get
        case .getLocations:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard let url = URL(string: baseUrl + path) else {
            fatalError("URL ERROR")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
    
    
}

enum HTTPMethods: String {
    case get = "GET"
}

