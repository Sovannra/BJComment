//
//  BJViewModel.swift
//  BJComment
//
//  Created by Sovannra on 28/12/21.
//

import Foundation

public struct BJCommentViewModel {
    
    var comment: BJCommentModel!
    
    var user: BJUser {
        return comment.user
    }
    
    var caption: String {
        return comment.caption
    }
    
    var imageUrl: String {
        return comment.imageUrl
    }
    
    var isHideCaption: Bool {
        return comment.caption == ""
    }
    
    var isHidePreviousReply: Bool {
        return comment.reply.count == 0
    }
    
    var isHideImage: Bool {
        return comment.imageUrl == ""
    }
    
    var viewPreviousReply: String {
        let count = comment.reply.count - 1
        return (count > 0) ? "View \(count) previous replies..." : ""
    }
    
    var isHideReply: Bool {
        return comment.reply.count == 1
    }
    
    var replyUser: BJUser {
        let option = BJUser(id: "", username: "", imageUrl: "")
        guard let reply = comment.reply.last else { return option }
        return reply.user
    }
    
    var replyCaption: String {
        guard let type = comment.reply.last?.type else { return ""}
        switch type {
        case .caption:
            return comment.reply.last?.caption ?? ""
        case .image:
            return "replied with image"
        case .sticker:
            return "replied with sticker"
        }
    }
    
    var image: UIImage {
        return UIImage(named: comment.imageUrl)!
    }
    
    var imageHeight: CGFloat {
        switch aspectRatio {
        case .squre:
            return 100
        case .portraint:
            let aspect: CGFloat = 4 / 3
            let height = imageWidth * aspect
            return height
        case .landscape:
            let aspect: CGFloat = 4 / 6
            let height = imageWidth * aspect
            return height
        }
    }
    
    var imageWidth: CGFloat {
        if comment.type == .image {
            return (aspectRatio == .landscape) ? (UIScreen.main.bounds.width * 0.85) + 2 : 150
        } else {
            return 100
        }
    }
    
    var aspectRatio: ImageAspectRatio {
        guard let imageSize = image.cgImage else { return .squre}
        if imageSize.width < imageSize.height {
            return .portraint
        } else if imageSize.width > imageSize.height {
            return .landscape
        } else {
            return .squre
        }
    }
    
    public init(comment: BJCommentModel) {
        self.comment = comment
    }
}

enum ImageAspectRatio {
    case squre
    case portraint
    case landscape
}
