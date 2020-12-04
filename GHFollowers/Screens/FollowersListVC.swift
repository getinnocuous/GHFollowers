//
//  FollowersListVC.swift
//  GHFollowers
//
//  Created by Elliot Waddington on 16/10/2020.
//

import UIKit

class FollowersListVC: UIViewController {
  
  enum Section {
    case main
  }
  
  var userName: String!
  var collectionView: UICollectionView!
  var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
  var followers: [Follower] = []
  var page = 1
  var hasMoreFollowers = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureVC()
    configureCollectionView()
    configureDataSource()
    getFollowers(userName: userName, page: page)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  func configureVC() {
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func getFollowers(userName: String, page: Int) {
    NetworkManager.shared.getFollowers(for: userName, page: page) { [weak self] (result) in
      guard let self = self else { return }
      switch result {
      case .success(let followers):
        if (followers.count < 100) { self.hasMoreFollowers = false }
        self.followers.append(contentsOf: followers)
        self.updateData()
      case .failure(let error):
        self.presentEWAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "Dismiss")
      }
    }
  }
  
  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
    view.addSubview(collectionView)
    collectionView.backgroundColor = .systemBackground
    collectionView.delegate = self
    collectionView.register(EWFollowerCell.self, forCellWithReuseIdentifier: EWFollowerCell.reuseID)
  }
  
  func createFlowLayout() -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 12
    let minSpacing: CGFloat = 12
    let availableWidth = width - (padding * 2) - (minSpacing * 2)
    let itemWidth = availableWidth / 3
    
    let flow = UICollectionViewFlowLayout()
    flow.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flow.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
    
    return flow
  }
  
  func configureDataSource() {
    dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EWFollowerCell.reuseID, for: indexPath) as! EWFollowerCell
      cell.set(follower: follower)
      return cell
    })
  }
  
  func updateData() {
    var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
    snapshot.appendSections([.main])
    snapshot.appendItems(followers)
    DispatchQueue.main.async {
      self.dataSource.apply(snapshot, animatingDifferences: true)
    }
    
  }
  
}

extension FollowersListVC: UICollectionViewDelegate {
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    let height = scrollView.frame.size.height
    
    if (offsetY >= (contentHeight - height)) {
      guard hasMoreFollowers else { return }
      page += 1
      getFollowers(userName: userName, page: page)
    }
    
  }
}
