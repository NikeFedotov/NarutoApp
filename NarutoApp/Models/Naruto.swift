//
//  Naruto.swift
//  NarutoApp
//
//  Created by Никита on 13.03.2024.
//

import Foundation

//MARK: NarutoAPI
enum NarutoAPI {
    case baseURL
    
    var url: URL {
        switch self {
        case .baseURL:
            return URL(string: "https://narutodb.xyz/api/character?page=1&limit=1431")!
        }
    }
}

//MARK: Naruto
struct Naruto: Decodable {
    let characters: [Character]
}

//MARK: Character
struct Character: Decodable {
    let name: String
    let images: [String]?
//    let personal: Personal?
    let jutsu: [String]?
    let natureType: [String]?
    
    var description: String {
        """
        Name:   \(name)
        
        Jutsu:  \(jutsu?.formatted() ?? "Unknown")
        
        Nature Type: \(natureType?.formatted() ?? "Unknown")
        """
    }
    
    init(name: String, images: [String]?, jutsu: [String]?, natureType: [String]?) {
        self.name = name
        self.images = images
        self.jutsu = jutsu
        self.natureType = natureType
    }
    
}

//MARK: Personal
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

//MARK: Status
enum Status: String, Decodable {
    case deceased = "Deceased"
    case incapacitated = "Incapacitated"
}

//MARK: Sex
enum Sex: String, Decodable {
    case female = "Female"
    case male = "Male"
}

//MARK: Weight
struct Weight: Codable {
    let partTwo, partOne: String?

    enum CodingKeys: String, CodingKey {
        case partTwo = "Part II"
        case partOne = "Part I"
    }
}

//MARK: Height
struct Height: Decodable {
    let partII, partI, blankPeriod, gaiden: String?

    enum CodingKeys: String, CodingKey {
        case partII = "Part II"
        case partI = "Part I"
        case blankPeriod = "Blank Period"
        case gaiden = "Gaiden"
    }
}

//MARK: Age
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

//MARK: Family
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


