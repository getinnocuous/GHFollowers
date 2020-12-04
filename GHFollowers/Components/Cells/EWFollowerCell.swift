//
//  EWFollowerCell.swift
//  GHFollowers
//
//  Created by Elliot Waddington on 26/10/2020.
//

import UIKit

class EWFollowerCell: UICollectionViewCell {
  static let reuseID = "EWFollowerCell"
  
  let avatarImageView = EWAvatarImageView(frame: .zero)
  let userNameLabel = EWTitleLabel(textAlign: .center, fontSize: 16)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func set(follower:Follower) {
    userNameLabel.text = follower.login
    avatarImageView.downloadImage(from: follower.avatarUrl)
  }
  
  private func configure() {
    addSubview(avatarImageView)
    addSubview(userNameLabel)
    let padding: CGFloat = 8
    NSLayoutConstraint.activate([
      avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
      avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
      userNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
      userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
      userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
      userNameLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
}
