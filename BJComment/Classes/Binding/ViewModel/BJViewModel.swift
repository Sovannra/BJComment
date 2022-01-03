//
//  BJViewModel.swift
//  BJComment
//
//  Created by Sovannra on 28/12/21.
//

import BJTextView
import UIKit

public struct BJCommentViewModel {
    
    public var comment: BJCommentListModel!
    public var indexPath: IndexPath?
    
    public var commentId: String {
        return comment.id
    }
    
    public var ownerId: String {
        return comment.user.id
    }
    
    public var commentType: String {
        return comment.type.rawValue
    }
    
    public var createdAt: Double {
        return comment.createdAt
    }
    
    public var stickerId: String {
        return ""
    }
    
    public var imageView: UIImage?
    
    public var user: BJUser {
        return comment.user
    }
    
    public var caption: String {
        return comment.caption
    }
    
    public var imageUrl: String {
        return comment.imageUrl
    }
    
    public var longGestureType: BJLongGestureType = .caption
    
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
    
    var timeAgo: String {
        let date = comment.createdAt.getDateFromUTC()
        return date.getElapsedInterval()
    }
    
    public var replyUser: BJUser {
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
    
    var imageEXE: ImageEXE {
        guard let url = URL(string: imageUrl) else { return .image}
        return url.pathExtension == "gif" ? .gif : .image
    }
    
    private var smallHeight: CGFloat = 150
        
    func imageWidth(_ image: UIImage?) -> CGFloat {
        if imageUrl != "" {
            if comment.aspectRatioType == .landscape {
                return (UIScreen.main.bounds.width * 0.83)
            } else {
                return smallHeight
            }
        } else {
            return 0
        }
    }
    
    func imageHeight(_ image: UIImage?) -> CGFloat {
        if imageUrl != "" {
            switch comment.aspectRatioType {
            case .squre:
                return smallHeight
            case .portraint:
                let aspect: CGFloat = 4 / 3
                let height = smallHeight * aspect
                return height
            case .landscape:
                let aspect: CGFloat = 4 / 6
                let height = (UIScreen.main.bounds.width * 0.83) * aspect
                return height
            case .none:
                return 0
            }
        } else {
            return 0
        }
    }
    
    public init(comment: BJCommentListModel, indexPath: IndexPath) {
        self.comment = comment
        self.indexPath = indexPath
        let img = UIImageView()
        img.loadImage(with: comment.imageUrl)
        self.imageView = img.image
    }
}

public enum ImageAspectRatio {
    case squre
    case portraint
    case landscape
    case none
}

enum ImageEXE {
    case gif
    case image
}
