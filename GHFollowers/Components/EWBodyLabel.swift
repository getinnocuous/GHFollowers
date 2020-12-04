//
//  EWBodyLabel.swift
//  GHFollowers
//
//  Created by Elliot Waddington on 16/10/2020.
//

import UIKit

class EWBodyLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  init(textAlign: NSTextAlignment) {
    super.init(frame: .zero)
    self.textAlignment = textAlign
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    textColor = .secondaryLabel
    font = UIFont.preferredFont(forTextStyle: .body)
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.75
    lineBreakMode = .byWordWrapping
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
