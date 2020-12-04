//
//  EWTitleLabel.swift
//  GHFollowers
//
//  Created by Elliot Waddington on 16/10/2020.
//

import UIKit

class EWTitleLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  init(textAlign: NSTextAlignment, fontSize: CGFloat ) {
    super.init(frame: .zero)
    self.textAlignment = textAlign
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    textColor = .label
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.9
    lineBreakMode = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false
  }

}
