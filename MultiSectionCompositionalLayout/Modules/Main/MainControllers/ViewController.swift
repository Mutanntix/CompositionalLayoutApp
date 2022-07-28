//
//  ViewController.swift
//  MultiSectionCompositionalLayout
//
//  Created by Мурад Чеерчиев on 26.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    
    var dataSource: UICollectionViewDiffableDataSource<ListSection, ListItem>!
    let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setDataSource()
        setSnapshot()
    }
    
    private func setupCollectionView() {
        let layout = self.createLayout()
        self.collectionView.collectionViewLayout = layout
        setupRefreshControl()
    }
    
    private func setupRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self,
                                      action: #selector(refresh(_:)),
                                      for: .valueChanged)

        refreshControl.addSubview(setupRefreshLabel())
        self.collectionView.refreshControl = refreshControl
    }
}

extension ViewController {
    private func setupRefreshLabel() -> UILabel {
        let refreshLabel = UILabel()
        refreshLabel.text = "Loading..."
        refreshLabel.font  = .systemFont(ofSize: 12)
        refreshLabel.textColor = .gray
        refreshLabel.textAlignment = .center
        refreshLabel.frame.size = CGSize(width: view.bounds.width,
                                         height: 25)
        refreshLabel.frame.origin.y = refreshControl.frame.maxY
        refreshLabel.center.x = refreshControl.frame.midX
        
        return refreshLabel
    }
}


