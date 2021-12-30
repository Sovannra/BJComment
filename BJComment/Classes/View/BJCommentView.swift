//
//  BJCommentView.swift
//  BJComment
//
//  Created by Sovannra on 27/12/21.
//

import UIKit
import BJCollection

public class BJCommentView: UIView {
    
    public var comment: [BJCommentListModel]?
    
    public var delegate: BJDelegate?
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 999)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupComponent()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponent() {
        addSubview(vCollection)
    }
    
    private func setupConstraint() {
        vCollection.fillSuperview()
    }
    
    public lazy var vCollection: BJCollectionView = {
        let view = BJCollectionView(frame: .zero, collectionViewLayout: layout)
        view.showScrollIndicator = false
        view.register(cell: BJCommentCell.self)
        view.delegate = self
        view.dataSource = self
        return view
    }()
}

extension BJCommentView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comment?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BJCommentCell = collectionView.dequeue(for: indexPath)
        guard let data = comment?[indexPath.row] else { return cell }
        cell.data = BJCommentViewModel(comment: data, indexPath: indexPath)
        cell.deleate = self
        return cell
    }
    
    public func deleteRow(_ indexPath: IndexPath) {
        vCollection.performBatchUpdates({
            vCollection.deleteItems(at: [indexPath])
        }, completion:nil)
    }
    
//    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard let data = comment?[indexPath.row] else { return }
//        if !data.isLoaded && data.type == .image {
//            collectionView.reloadItems(at: [indexPath])
//        }
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard let data = comment?[indexPath.row] else { return }
//        if !data.isLoaded && data.imageUrl != "" {
//            comment?[indexPath.row].isLoaded = true
//        }
//    }
}

extension BJCommentView: BJDelegate {
    public func didSelect(_ type: BJActionType, _ comment: BJCommentViewModel) {
        delegate?.didSelect(type, comment)
    }
    
    public func didLongPress(_ comment: BJCommentViewModel) {
        delegate?.didLongPress(comment)
    }
}
