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
    
    public var ownerId: String {
        return comment.user.id
    }
    
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
    
    var imageEXE: ImageEXE {
        guard let url = URL(string: imageUrl) else { return .image}
        return url.pathExtension == "gif" ? .gif : .image
    }
    
    private var smallHeight: CGFloat = 150
        
    func imageWidth(_ image: UIImage?) -> CGFloat {
        if aspectRatio(image) == .landscape {
            return (UIScreen.main.bounds.width * 0.83)
        } else {
            return smallHeight
        }
    }
    
    func imageHeight(_ image: UIImage?) -> CGFloat {
        if imageUrl != "" {
            switch aspectRatio(image) {
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
            }
        } else {
            return 0
        }
    }

    func aspectRatio(_ image: UIImage?) -> ImageAspectRatio {
        guard let imageSize = image?.cgImage else { return .squre}
        if imageSize.width < imageSize.height {
            return .portraint
        } else if imageSize.width > imageSize.height {
            return .landscape
        } else {
            return .squre
        }
    }
    
    public init(comment: BJCommentListModel, indexPath: IndexPath) {
        self.comment = comment
        self.indexPath = indexPath
    }
}

enum ImageAspectRatio {
    case squre
    case portraint
    case landscape
}

enum ImageEXE {
    case gif
    case image
}
