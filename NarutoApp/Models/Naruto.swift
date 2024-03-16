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
    let images: [URL]?
    let family: Family?
//    let personal: Personal?
    let jutsu: [String]?
    let natureType: [String]?
    
    var description: String {
        """
        Name: \(name)
        """
    }
    
}

struct Personal: Decodable {
    let species: String?
    let status: Status?
    let kekkeiGenkai, classification: String?
    let jinchūriki, titles: [String]?
    let birthdate: String?
    let sex: Sex?
    let height: Height?
    let weight: Weight?
    let bloodType: String?
    let partner: String?
    let age: Age?
    let clan: String?
}

enum Status: String, Decodable {
    case deceased = "Deceased"
    case incapacitated = "Incapacitated"
}

enum Sex: String, Decodable {
    case female = "Female"
    case male = "Male"
}

struct Weight: Codable {
    let partTwo, partOne: String?

    enum CodingKeys: String, CodingKey {
        case partTwo = "Part II"
        case partOne = "Part I"
    }
}

struct Height: Decodable {
    let partII, partI, blankPeriod, gaiden: String?

    enum CodingKeys: String, CodingKey {
        case partII = "Part II"
        case partI = "Part I"
        case blankPeriod = "Blank Period"
        case gaiden = "Gaiden"
    }
}

struct Age: Decodable {
    let partTwo, partOne, academyGraduate, chuninPromotion: String?
    let borutoManga: String?

    enum CodingKeys: String, CodingKey {
        case partTwo = "Part II"
        case partOne = "Part I"
        case academyGraduate = "Academy Graduate"
        case chuninPromotion = "Chunin Promotion"
        case borutoManga = "Boruto Manga"
    }
}

struct Family: Decodable {
    let incarnationWithTheGodTree, depoweredForm, son, nephew: String?
    let adoptiveSon, father, adoptiveBrother, cousin: String?
    let adoptiveFather, brother, husband: String?

    enum CodingKeys: String, CodingKey {
        case incarnationWithTheGodTree = "incarnation with the god tree"
        case depoweredForm = "depowered form"
        case son, nephew
        case adoptiveSon = "adoptive son"
        case father
        case adoptiveBrother = "adoptive brother"
        case cousin
        case adoptiveFather = "adoptive father"
        case brother, husband
    }
}

enum NarutoAPI {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://narutodb.xyz/api/character?page=1&limit=1431")!
        }
    }
}
