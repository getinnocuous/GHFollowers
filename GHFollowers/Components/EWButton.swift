//
//  EWButton.swift
//  GHFollowers
//
//  Created by Elliot Waddington on 16/10/2020.
//

import UIKit

class EWButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame) // do everything that UIButton would do
    // custom stuff here
  }
  
  //  handles initialisation by Storyboard
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(backgroundColor: UIColor, title: String) {
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    self.setTitle(title, for: .normal)
    configure()
  }
  
  private func configure() {
    layer.cornerRadius = 10
    setTitleColor(.white, for: .normal)
    titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
