//
//  ViewController + CompositionalLayout.swift
//  MultiSectionCompositionalLayout
//
//  Created by Мурад Чеерчиев on 26.07.2022.
//

import UIKit

extension ViewController {
    func createLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex,
            layoutEnvironment in
            switch self.sections[sectionIndex] {
            case .stories:
                return CompositionalLayoutHelper
                    .getStoriesSection()
            case .popular:
                return CompositionalLayoutHelper
                    .getPopularSection()
            case .comingSoon:
                return CompositionalLayoutHelper
                    .getComingSoonSection()
            }
        }
    }
}
