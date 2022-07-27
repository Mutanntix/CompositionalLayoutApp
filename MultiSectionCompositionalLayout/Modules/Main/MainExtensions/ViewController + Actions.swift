//
//  ViewController + Actions.swift
//  MultiSectionCompositionalLayout
//
//  Created by Мурад Чеерчиев on 27.07.2022.
//

import Foundation
import UIKit

extension ViewController {
    @objc func refresh(_ sender: UIRefreshControl) {
        guard sender == self.refreshControl
        else { return }
        self.collectionView
            .scrollToItem(at: IndexPath(row: 0, section: 0),
                          at: .centeredHorizontally, animated: true)
        sender.endRefreshing()
    }
}
