//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Mehmet Ali Özdemir on 9.04.2024.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
