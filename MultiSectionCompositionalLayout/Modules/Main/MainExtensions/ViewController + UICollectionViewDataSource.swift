//
//  ViewController.swift
//  MultiSectionCompositionalLayout
//
//  Created by Мурад Чеерчиев on 26.07.2022.
//

import UIKit

//MARK: - Diffable data source -
extension ViewController {
    func setDataSource() {
        self.dataSource =
        UICollectionViewDiffableDataSource<ListSection, ListItem>(
            collectionView: self.collectionView,
            cellProvider: {
                (collectionView, indexPath, itemIdentifier) in
                let section = self.sections[indexPath.section]
                return CompositionalLayoutHelper
                    .getCellFor(section,
                                collectionView,
                                indexPath)
                
            })
        self.dataSource.supplementaryViewProvider = {
            (collectionView, kind, indexPath)
            -> UICollectionReusableView? in
            let reusableView = CompositionalLayoutHelper
                .getReusableViewFor(collectionView,
                                    of: kind, indexPath,
                                    self.sections)
            return reusableView
        }
    }
    
    func setSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<ListSection,
                                                    ListItem>()
        snapshot.appendSections(self.sections)
        self.sections.forEach({
            snapshot.appendItems($0.items, toSection: $0)
        })
        self.dataSource.apply(snapshot)
    }
}
