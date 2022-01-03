//
//  LocalData.swift
//  BJComment_Example
//
//  Created by Sovannra on 28/12/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import BJComment

struct LocalData {
    
    static func loadData(completed: @escaping(_ comment: [BJCommentListModel]) -> Void) {
        let replyCmt1 = [
            BJReplyCommentModel(
                id: "1",
                user: BJUser(id: "1", username: "Jonh", imageUrl: "https://bestprofilepictures.com/wp-content/uploads/2021/04/Cool-Profile-Picture-986x1024.jpg"),
                caption: "Yes, sure",
                imageUrl: "",
                stickerId: "",
                createdAt: 1641109663,
                type: .caption)]
        
        let replyCmt2 = [
            BJReplyCommentModel(
                id: "2",
                user: BJUser(id: "2", username: "Michael", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6Nyy0MfiDsyf-29ZFPfI9wrWW6CCB665WyA&usqp=CAU"),
                caption: "",
                imageUrl: "https://wallpapercave.com/wp/wp4937436.jpg",
                stickerId: "",
                createdAt: 1641196063,
                type: .image),
            BJReplyCommentModel(
                id: "3",
                user: BJUser(id: "3", username: "Kitty", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBcg5OV7m4Ojt-6P7o0JwzgBcZosZwisJw0A&usqp=CAU"),
                caption: "",
                imageUrl: "https://creoateprod.s3.eu-west-2.amazonaws.com/wp-content/uploads/2021/04/14063331/panda-sticker-mockup-wit.jpg",
                stickerId: "",
                createdAt: 1641196063,
                type: .image)
        ]
        
        let commentList = [
            BJCommentListModel(
                id: "0",
                user: BJUser(id: "3", username: "Sovannra Kong", imageUrl: "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
                caption: "Wow so beautiful",
                imageUrl: "",
                stickerId: "",
                createdAt: 1641109663,
                type: .caption,
                reply: []),
            BJCommentListModel(
                id: "1",
                user: BJUser(id: "3", username: "Sovannra Kong", imageUrl: "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
                caption: "Wow so beautiful",
                imageUrl: "https://img1.goodfon.com/wallpaper/nbig/7/5d/patagonia-landscape-panoramic.jpg",
                stickerId: "",
                createdAt: 1641196063,
                type: .image,
                reply: replyCmt1,
                aspectRatioType: .landscape),
            BJCommentListModel(
                id: "2",
                user: BJUser(id: "2", username: "David", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwSoQLn8t4J8qK3Hxf7HZoCt8o4bbPXbdypA&usqp=CAU"),
                caption: "You’re amazing!",
                imageUrl: "",
                stickerId: "",
                createdAt: 1641188863,
                type: .caption,
                reply: []),
            BJCommentListModel(
                id: "3",
                user: BJUser(id: "3", username: "Pharim", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWOdZJlzGgsaxupEmN1jGhRIn41F0Y-0ZR7A&usqp=CAU"),
                caption: "Look Great!",
                imageUrl: "https://www.whatsappprofiledpimages.com/wp-content/uploads/2021/08/Profile-Photo-Wallpaper.jpg",
                stickerId: "",
                createdAt: 1641196063,
                type: .image,
                reply: replyCmt2,
                aspectRatioType: .portraint),
            BJCommentListModel(
                id: "4",
                user: BJUser(id: "4", username: "Richard", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1kRIvrYp6bM4_LEKBL2OQau-jhZfNr0QKxw&usqp=CAU"),
                caption: "You continue to impress me.",
                imageUrl: "",
                stickerId: "",
                createdAt: 1641188863,
                type: .caption,
                reply: []),
            BJCommentListModel(
                id: "5",
                user: BJUser(id: "5", username: "Matthew", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsTgneEQcUq7bnHLXiR55MtyLUov4wjEH3CA&usqp=CAU"),
                caption: "So cool!",
                imageUrl: "https://payload.cargocollective.com/1/1/44904/10607674/regret-nothin-gif-edit-72dpi.gif",
                stickerId: "",
                createdAt: 1641196063,
                type: .image,
                reply: [],
                aspectRatioType: .landscape),
            BJCommentListModel(
                id: "6",
                user: BJUser(id: "6", username: "Richard", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1kRIvrYp6bM4_LEKBL2OQau-jhZfNr0QKxw&usqp=CAU"),
                caption: "You continue to impress me.",
                imageUrl: "https://stickerly.pstatic.net/sticker_pack/n3iEcJBsAgP2zLNWvsYUtQ/TFOH8Q/3/1565549049.png",
                stickerId: "",
                createdAt: 1641196063,
                type: .sticker,
                reply: replyCmt2,
                aspectRatioType: .squre),
            BJCommentListModel(
                id: "7",
                user: BJUser(id: "7", username: "Matthew", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsTgneEQcUq7bnHLXiR55MtyLUov4wjEH3CA&usqp=CAU"),
                caption: "Don’t shy away from giving someone a great compliment. Finding nice things to say to someone will make you feel happier, too. Kindness is infectious, so spread around those compliments today and watch as positivity blossoms.",
                imageUrl: "https://www.wallpapers13.com/wp-content/uploads/2015/11/Tower-for-surveillance-of-forest-fire-night-nature-landscape-Wallpaper-HD-1920x1080.jpg",
                stickerId: "",
                createdAt: 1641196063,
                type: .image,
                reply: [],
                aspectRatioType: .landscape),
            BJCommentListModel(
                id: "8",
                user: BJUser(id: "3", username: "Matthew", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsTgneEQcUq7bnHLXiR55MtyLUov4wjEH3CA&usqp=CAU"),
                caption: "",
                imageUrl: "https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?fit=476%2C280&ssl=1",
                stickerId: "",
                createdAt: 1641197139,
                type: .image,
                reply: [],
                aspectRatioType: .landscape),
            BJCommentListModel(
                id: "9",
                user: BJUser(id: "9", username: "Rock", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsTgneEQcUq7bnHLXiR55MtyLUov4wjEH3CA&usqp=CAU"),
                caption: "You're so beautiful!!",
                imageUrl: "",
                stickerId: "",
                createdAt: 1641197139,
                type: .caption,
                reply: replyCmt1),
            BJCommentListModel(
                id: "10",
                user: BJUser(id: "3", username: "Rock", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsTgneEQcUq7bnHLXiR55MtyLUov4wjEH3CA&usqp=CAU"),
                caption: "",
                imageUrl: "https://beta.techcrunch.com/wp-content/uploads/2018/01/instagram-giphy-search.gif",
                stickerId: "",
                createdAt: 1641196063,
                type: .sticker,
                reply: [],
                aspectRatioType: .portraint)
        ]
        completed(commentList)
    }
}
