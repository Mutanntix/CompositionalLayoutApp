//
//  ViewController.swift
//  MultiSectionCompositionalLayout
//
//  Created by Мурад Чеерчиев on 26.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = self.createLayout()
        self.collectionView.collectionViewLayout = layout
    }
}

