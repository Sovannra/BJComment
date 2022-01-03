//
//  BJCommentModel.swift
//  BJComment
//
//  Created by Sovannra on 28/12/21.
//

import Foundation

public struct BJCommentListModel{
    public let id: String
    public let user: BJUser
    public let caption: String
    public var imageUrl: String
    public let stickerId: String
    public let createdAt: Double
    public let type: BJCommentType
    public let reply: [BJReplyCommentModel]
    public let aspectRatioType: ImageAspectRatio
    
    public init(
        id: String,
        user: BJUser,
        caption: String,
        imageUrl: String,
        stickerId: String,
        createdAt: Double,
        type: BJCommentType,
        reply: [BJReplyCommentModel],
        aspectRatioType: ImageAspectRatio?=nil
    ) {
        self.id = id
        self.user = user
        self.caption = caption
        self.imageUrl = imageUrl
        self.stickerId = stickerId
        self.createdAt = createdAt
        self.type = type
        self.reply = reply
        self.aspectRatioType = aspectRatioType ?? .none
    }
}

public struct BJUser {
    public let id: String
    public let username: String
    public let imageUrl: String
    
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
    public let id: String
    public let user: BJUser
    public let caption: String
    public let imageUrl: String
    public let stickerId: String
    public let createdAt: Double
    public let type: BJCommentType
    
    public init(
        id: String,
        user: BJUser,
        caption: String,
        imageUrl: String,
        stickerId: String,
        createdAt: Double,
        type: BJCommentType
    ) {
        self.id = id
        self.user = user
        self.caption = caption
        self.imageUrl = imageUrl
        self.stickerId = stickerId
        self.createdAt = createdAt
        self.type = type
    }
}

public enum BJCommentType: String, CaseIterable {
    case caption = "caption"
    case image   = "image"
    case sticker = "sticker"
}
