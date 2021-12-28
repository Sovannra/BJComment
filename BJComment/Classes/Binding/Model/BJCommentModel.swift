//
//  BJCommentModel.swift
//  BJComment
//
//  Created by Sovannra on 28/12/21.
//

import Foundation

public struct BJCommentModel{
    let id: String
    let user: BJUser
    let caption: String
    let imageUrl: String
    let createdAt: Double
    let type: BJCommentType
    let reply: [BJReplyCommentModel]
    
    public init(
        id: String,
        user: BJUser,
        caption: String,
        imageUrl: String,
        createdAt: Double,
        type: BJCommentType,
        reply: [BJReplyCommentModel]
    ) {
        self.id = id
        self.user = user
        self.caption = caption
        self.imageUrl = imageUrl
        self.createdAt = createdAt
        self.type = type
        self.reply = reply
    }
}

public struct BJUser {
    let id: String
    let username: String
    let imageUrl: String
    
    public init (
        id: String,
        username: String,
        imageUrl: String
    ) {
        self.id = id
        self.username = username
        self.imageUrl = imageUrl
    }
}

public struct BJReplyCommentModel {
    let id: String
    let user: BJUser
    let caption: String
    let imageUrl: String
    let createdAt: Double
    let type: BJCommentType
    
    public init(
        id: String,
        user: BJUser,
        caption: String,
        imageUrl: String,
        createdAt: Double,
        type: BJCommentType
    ) {
        self.id = id
        self.user = user
        self.caption = caption
        self.imageUrl = imageUrl
        self.createdAt = createdAt
        self.type = type
    }
}

public enum BJCommentType {
    case caption
    case image
    case sticker
}
