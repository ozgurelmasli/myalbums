//
//  Photo.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import Foundation

struct Photo: Codable {
    let id: Int?
    let albumId: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}
