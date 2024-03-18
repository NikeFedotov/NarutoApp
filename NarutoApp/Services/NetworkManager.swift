//
//  NetworkManager.swift
//  NarutoApp
//
//  Created by Никита on 13.03.2024.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchNaruto(from url: URL, completion: @escaping(Result<[Character], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: Naruto.self) { dataResponse in
                switch dataResponse.result {
                case .success(let naruto):
                    let characters = naruto.characters
                    completion(.success(characters))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
