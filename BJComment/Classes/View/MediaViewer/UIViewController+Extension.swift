//
//  UIViewController+Extension.swift
//  iOS-adc-app
//
//  Created by Sovannra on 28/6/21.
//  Copyright © 2021 Core-MVVM. All rights reserved.
//

import UIKit

//MARK: - Popup Image Viewer
extension UIViewController{
    
    func popImageViewer(photos: [UIImage],outsideFrame: CGRect, statusImageView: UIImageView, currentIndex: Int, imageViewerDelegate: ImageViewerDelegate ) {
        let showView = ImageViewerView.init(frame: UIScreen.main.bounds, photos: photos, currentIndex: currentIndex)
        showView.imageViewerDelegate = imageViewerDelegate
        showView.imageView.image = statusImageView.image
        showView.outsideFrame    = outsideFrame
        showView.insideFrame     = getInsideFrame(image: statusImageView.image)
        showView.show()
    }
    
    func updateImageViewer(imageViewerView: ImageViewerView, outsideFrame: CGRect, statusImageView: UIImageView) {
        imageViewerView.outsideFrame    = outsideFrame
        imageViewerView.insideFrame     = getInsideFrame(image: statusImageView.image)
        imageViewerView.imageView.image = statusImageView.image
        imageViewerView.imageView.frame = imageViewerView.insideFrame
    }
    
    /** Get image from collectionview base on index */
    func getImageView(collectionView: UICollectionView,index: Int) ->  UIImageView {
        let cell = getImageViewerCell(collectionView: collectionView, indexPath: getIndexPath(index: index))
        return cell.zoomImageView
    }
    
    func getIndexPath(index: Int, section: Int = 0) -> IndexPath {
        return IndexPath(row: index, section: section)
    }
    
    func getImageViewerCell(collectionView: UICollectionView,indexPath: IndexPath) -> ImageViewerCell {
        return collectionView.cellForItem(at: indexPath) as! ImageViewerCell
    }
    
    func getInsideFrame(image: UIImage?) -> CGRect {
        if let image = image{
            let scale = image.size.height/image.size.width
            let insideWidth = UIScreen.main.bounds.width
            let insideHeight = insideWidth * scale
            return CGRect.init(x: 0, y: (UIScreen.main.bounds.height - insideHeight) * 0.5,
                               width: insideWidth, height: insideHeight)
        }
        return view.frame
    }
}
//MARK: -
