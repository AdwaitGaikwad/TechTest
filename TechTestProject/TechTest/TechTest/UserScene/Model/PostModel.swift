//
//  UserModel.swift
//  TechTest
//
//  Created by Adwait Gaikwad on 28/05/24.
//

import Foundation

// MARK: - PostModelElement
struct PostModelElement: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PostModel = [PostModelElement]
