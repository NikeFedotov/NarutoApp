//
//  Naruto.swift
//  NarutoApp
//
//  Created by Никита on 13.03.2024.
//

import Foundation

struct Naruto: Decodable {
    let characters: [Character]
}

struct Character: Decodable {
    let name: String
    let images: [URL]
    let family: [String: String]?
    let jutsu: [String]?
    let natureType: [String]?
    let personal: [Personal]?
    let uniqueTraits: [String]?
    
    var description: String {
        """
    Name: \(name)
    """
    }
}

struct Personal: Decodable {
    let birthdate: String?
    let sex: String?
    let age: Parameters?
    let status: String?
    let height: Parameters?
    let weight: Parameters?
    let bloodType: String?
    let occupation: String?
    let team: String?
    let partner: String?
}

struct Parameters: Decodable {
    let partOne: String?
    let partTwo: String?
    
    enum CodingKeys: String, CodingKey {
        case partOne = "Part I"
        case partTwo = "Part II"
    }
}

enum NarutoAPI {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://narutodb.xyz/api/character")!
        }
    }
}
