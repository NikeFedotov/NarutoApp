//
//  NetworkManager.swift
//  NarutoApp
//
//  Created by Никита on 13.03.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
}
