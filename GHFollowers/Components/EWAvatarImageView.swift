//
//  EWAvatarImageView.swift
//  GHFollowers
//
//  Created by Elliot Waddington on 26/10/2020.
//

import UIKit

class EWAvatarImageView: UIImageView {
  
  let cache = NetworkManager.shared.cache
  
  let placeholderImage = UIImage(named: "avatar-placeholder")
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure() {
    layer.cornerRadius = 10
    clipsToBounds = true
    image = placeholderImage
    translatesAutoresizingMaskIntoConstraints = false
  }
  
  func downloadImage(from imageURL: String) {
    
    let cacheKey = NSString(string: imageURL)
    
    if let cachedImage = cache.object(forKey: cacheKey) {
      self.image = cachedImage
      return
    }
    
    guard let imageURL = URL(string: imageURL) else { return }
    
    let task = URLSession.shared.dataTask(with: imageURL) { [weak self] data, response, error in
      guard let self = self else { return }
      
      if error != nil { return }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
      
      guard let data = data else { return }
      
      guard let image = UIImage(data: data) else { return }
      
      self.cache.setObject(image, forKey: cacheKey)
      
      DispatchQueue.main.async {
        self.image = image
      }
      
    }
    
    task.resume()
  }
  
}
