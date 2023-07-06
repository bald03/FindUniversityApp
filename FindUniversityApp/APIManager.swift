//
//  APIManager.swift
//  FindUniversityApp
//
//  Created by Bariev Daniil on 06.07.2023.
//

import Foundation

struct Universities: Decodable {
    let name: String
    let code: String
    let webPages: [String]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case code = "alpha_two_code"
        case webPages = "web_pages"
    }
}
