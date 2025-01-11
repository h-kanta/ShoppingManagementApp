//
//  Group.swift
//  ShoppingManagementApp
//
//  Created by 堀川貫太 on 2025/01/06.
//

import Foundation

struct Group {
    let id: String
    let ownerId: String
    let members: [String]
    let createdAt: Date
    let updatedAt: Date
}
