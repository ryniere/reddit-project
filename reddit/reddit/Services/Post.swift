//
//  Post.swift
//  reddit
//
//  Created by Ryniere dos Santos Silva on 2022-01-03.
//

import Foundation

struct PostListing: Codable {
    let data:ListingData
}

struct ListingData: Codable {
    let children:[Post]
}

struct Post: Codable {
    
    let data:PostData
}

struct PostData: Codable {
    
    let author:String
    let created: Date
    let downvotes: Int
    let numComments: Int
    let title: String
    let upvotes: Int
    
    enum CodingKeys: String, CodingKey {
        case author
        case created = "created_utc"
        case downvotes  = "downs"
        case numComments = "num_comments"
        case title
        case upvotes = "ups"
    }
}
