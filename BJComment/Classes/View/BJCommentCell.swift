//
//  BJCommentCell.swift
//  BJComment
//
//  Created by Sovannra on 27/12/21.
//

import UIKit
import BJTextView

public class BJCommentCell: UICollectionViewCell {
        
    var data: BJCommentViewModel? {
        didSet {
            updateView()
        }
    }
    var deleate: BJDelegate?
    
    let profileSize: CGFloat = 40
    let usernameFontSize: UIFont = .systemFont(ofSize: 14, weight: .semibold)
    let usernameTextColor: UIColor = .black
    let timeFontSize: UIFont = .systemFont(ofSize: 12)
    let timeTextColor: UIColor =  #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1) //#999999
    let captionFontSize: UIFont = .systemFont(ofSize: 14)
    let captionTextColor: UIColor = .black
    
    fileprivate var imageWidth: CGFloat {
        return (UIScreen.main.bounds.width * 0.83)
    }
    fileprivate var imageHeight: CGFloat = 150
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    fileprivate var imageWidthConstraint: NSLayoutConstraint?
    fileprivate var imageHeightConstraint: NSLayoutConstraint?
    fileprivate var imageBottomConstraint: NSLayoutConstraint?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupComponent()
        setupConstraint()
        setupAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 999))
    }
    
    private func setupComponent() {
        contentView.addSubview(vProfile)
        contentView.addSubview(vStackView)
        vStackView.addArrangedSubview(vUsername)
        vStackView.addArrangedSubview(vCaption)
        contentView.addSubview(vImage)
        vImage.addSubview(vGifImage)
        vReplyConstainer.addSubview(vTime)
        vReplyConstainer.addSubview(vReply)
        contentView.addSubview(vReplyStackView)
        vReplyStackView.addArrangedSubview(vReplyConstainer)
        vReplyStackView.addArrangedSubview(vPreviousReply)
    }
    
    private func setupConstraint() {
        //vProfile
        vProfile.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        vProfile.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        vProfile.widthAnchor.constraint(equalToConstant: profileSize).isActive = true
        vProfile.heightAnchor.constraint(equalToConstant: profileSize).isActive = true
        
        //vContainer
        vStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        vStackView.leftAnchor.constraint(equalTo: vProfile.rightAnchor, constant: 10).isActive = true
        vStackView.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor, constant: -10).isActive = true
        
        //vImage
        vImage.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 4).isActive = true
        vImage.leftAnchor.constraint(equalTo: vStackView.leftAnchor).isActive = true
        imageWidthConstraint = vImage.widthAnchor.constraint(equalToConstant: 0)
        imageWidthConstraint?.isActive = true
        imageHeightConstraint = vImage.heightAnchor.constraint(equalToConstant: 0)
        imageHeightConstraint?.isActive = true
        imageBottomConstraint = vImage.bottomAnchor.constraint(equalTo: vReplyStackView.topAnchor, constant: -4)
        imageBottomConstraint?.priority = UILayoutPriority(90)
        imageBottomConstraint?.isActive = true
        
        //vGifImage
        vGifImage.topAnchor.constraint(equalTo: vImage.topAnchor).isActive = true
        vGifImage.leftAnchor.constraint(equalTo: vImage.leftAnchor).isActive = true
        vGifImage.rightAnchor.constraint(equalTo: vImage.rightAnchor).isActive = true
        vGifImage.bottomAnchor.constraint(equalTo: vImage.bottomAnchor).isActive = true
        
        //vReplyStackView
        vReplyStackView.leftAnchor.constraint(equalTo: vImage.leftAnchor).isActive = true
        vReplyStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        //vReplyContainer
        vReplyConstainer.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //vTime
        vTime.topAnchor.constraint(equalTo: vReplyConstainer.topAnchor).isActive = true
        vTime.leftAnchor.constraint(equalTo: vReplyConstainer.leftAnchor).isActive = true
        vTime.bottomAnchor.constraint(equalTo: vReplyConstainer.bottomAnchor).isActive = true
        
        //vReply
        vReply.topAnchor.constraint(equalTo: vReplyConstainer.topAnchor).isActive = true
        vReply.leftAnchor.constraint(equalTo: vTime.rightAnchor, constant: 10).isActive = true
        vReply.widthAnchor.constraint(equalToConstant: 50).isActive = true
        vReply.bottomAnchor.constraint(equalTo: vReplyConstainer.bottomAnchor).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
        }
    }

    lazy var vProfile: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = profileSize / 2
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var vStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 0
        view.distribution = .fill
        view.axis = .vertical
        view.contentMode = .left
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 14
        view.backgroundColor =  #colorLiteral(red: 0.9411764706, green: 0.9490196078, blue: 0.9607843137, alpha: 1) //#F0F2F5
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.isLayoutMarginsRelativeArrangement = true
        return view
    }()
    
    lazy var vUsername: BJUILabel = {
        let view = BJUILabel(padding: UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Sovannra Kong"
        view.textColor = usernameTextColor
        view.font = usernameFontSize
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var vCaption: BJUILabel = {
        let view = BJUILabel(padding: UIEdgeInsets(top: 0, left: 0, bottom: 6, right: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Hello."
        view.textColor = captionTextColor
        view.font = captionFontSize
        view.numberOfLines = 0
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var vImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.layer.cornerRadius = 14
        view.isHidden = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var vGifImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.layer.cornerRadius = 14
        view.isHidden = true
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let vReplyStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 6
        view.distribution = .fill
        view.axis = .vertical
        view.contentMode = .left
        view.clipsToBounds = true
        return view
    }()
    
    let vReplyConstainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var vTime: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "1 minute ago"
        view.textColor = timeTextColor
        view.font = timeFontSize
        return view
    }()
    
    lazy var vReply: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Reply", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        return view
    }()
    
    lazy var vPreviousReply: BJPreviousReplyView = {
        let view = BJPreviousReplyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

extension BJCommentCell {
    
    private func updateView() {
        //User
        vProfile.loadImage(with: data?.user.imageUrl ?? "")
        vUsername.text = data?.user.username
        
        //Caption
        vCaption.text = data?.comment.caption
        vCaption.isHidden = data?.isHideCaption ?? false
        
        //Image
        vImage.loadImage(with: data?.imageUrl ?? "")
        vGifImage.loadGif(with: data?.imageUrl ?? "")
        vGifImage.isHidden = data?.imageEXE == .image
        vImage.isHidden = data?.isHideImage ?? false
        imageWidthConstraint?.constant = data?.imageWidth(vImage.image) ?? 0
        imageHeightConstraint?.constant = data?.imageHeight(vImage.image) ?? 0
        
        //Previous reply
        vPreviousReply.isHidden = data?.isHidePreviousReply ?? false
        vPreviousReply.vViewReply.isHidden = data?.isHideReply ?? false
        vPreviousReply.vUsername.text = data?.replyUser.username
        vPreviousReply.vViewReply.text = data?.viewPreviousReply
        vPreviousReply.vCaption.text = data?.replyCaption
        vPreviousReply.vProfile.loadImage(with: data?.replyUser.imageUrl ?? "")
    }
    
    func setupAction() {
        //Cell
        let cellLongGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.addGestureRecognizer(cellLongGesture)
        
        //Profile
        let profileGesture = UITapGestureRecognizer(target: self, action: #selector(hanleProfile))
        vProfile.addGestureRecognizer(profileGesture)
        let usernameGesture = UITapGestureRecognizer(target: self, action: #selector(hanleProfile))
        vUsername.addGestureRecognizer(usernameGesture)
        
        //Caption
        let captionGesture = UITapGestureRecognizer(target: self, action: #selector(handleCaption))
        vCaption.addGestureRecognizer(captionGesture)
        
        //Image
        let imageGesture = UITapGestureRecognizer(target: self, action: #selector(hanlePreviewImage))
        vImage.addGestureRecognizer(imageGesture)
        
        //Reply
        let replyGesture = UITapGestureRecognizer(target: self, action: #selector(handleReply))
        vPreviousReply.addGestureRecognizer(replyGesture)
        vReply.addTarget(self, action: #selector(handleReply), for: .touchUpInside)
    }
    
    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            deleate?.didLongPress(data!)
        }
    }
    
    @objc func hanleProfile() {
        deleate?.didSelect(.profile, data!)
    }
    
    @objc func handleCaption() {
        deleate?.didSelect(.caption, data!)
    }
    
    @objc func handleReply() {
        deleate?.didSelect(.reply, data!)
    }
    
    @objc func hanlePreviewImage() {
        guard let photo = vImage.image else {return}
        let statusImageView = vImage
        statusImageView.alpha = 0
        
        if let startingFrame = statusImageView.superview?.convert(statusImageView.frame, to: nil) {
            let viewController = UIApplication.shared.keyWindow!.rootViewController!
            viewController.popImageViewer(
                photos: [photo],
                outsideFrame: startingFrame,
                statusImageView: statusImageView,
                currentIndex: 0,
                imageViewerDelegate: self
            )
        }
    }
}

extension BJCommentCell: ImageViewerDelegate{

    public func imageViewer(imageViewerView: ImageViewerView, getCurrentIndex index: Int) {
       
    }

    public func imageViewer(imageViewerView: ImageViewerView, graggingView state: ImageViewerView.DraggingState) {
        switch state {
        case .ended:
            let statusImageView = vImage
            statusImageView.alpha = 1
        default:
            break
        }
    }
}
