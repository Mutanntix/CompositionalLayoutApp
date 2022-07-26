//
//  CompositionalLayoutHelper.swift
//  CollectioinView
//
//  Created by Мурад Чеерчиев on 23.07.2022.
//

import UIKit

enum LayoutAligment {
    case vertical, horizontal
}

enum SupplementaryItemType {
    case header, footer
}

//MARK: - Section components builder -
public struct CompositionalLayoutHelper {
    static func makeItem(width: NSCollectionLayoutDimension,
                         height: NSCollectionLayoutDimension
    ) -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: width,
                              heightDimension: height))
        
        return item
    }
    
    static func makeGroup(aligment: LayoutAligment,
                          width: NSCollectionLayoutDimension,
                          height: NSCollectionLayoutDimension,
                          spacing: CGFloat,
                          items: [NSCollectionLayoutItem]
    ) -> NSCollectionLayoutGroup {
        switch aligment {
        case .vertical:
            let group =  NSCollectionLayoutGroup.vertical(
                layoutSize: .init(widthDimension: width,
                                  heightDimension: height),
                subitems: items)
            group.contentInsets = .init(top: spacing,
                                        leading: spacing,
                                        bottom: spacing,
                                        trailing: spacing)
            
            return group
        case .horizontal:
            let group =  NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(widthDimension: width,
                                  heightDimension: height),
                subitems: items)
            group.contentInsets = .init(top: spacing,
                                        leading: spacing,
                                        bottom: spacing,
                                        trailing: spacing)
            return group
            
        default: fatalError("something went wrong")
        }
    }
    
    static func makeGroup(aligment: LayoutAligment,
                          width: NSCollectionLayoutDimension,
                          height: NSCollectionLayoutDimension,
                          spacing: CGFloat,
                          item: NSCollectionLayoutItem,
                          count: Int
    ) -> NSCollectionLayoutGroup {
        switch aligment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(
                layoutSize:
                        .init(widthDimension: width,
                              heightDimension: height),
                subitem: item,
                count: count)
                
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(
                layoutSize:
                        .init(widthDimension: width,
                              heightDimension: height),
                subitem: item,
                count: count)
        default: fatalError("something went wrong")
        }
    }
    
    static func makeSection(
        from group: NSCollectionLayoutGroup,
        scrollBehavior: UICollectionLayoutSectionOrthogonalScrollingBehavior? = nil)
    -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        if let scrollBehavior = scrollBehavior {
            section.orthogonalScrollingBehavior = scrollBehavior
        }
        
        return section
    }
}

//MARK: - SupplementaryItem builder -
extension CompositionalLayoutHelper {
    static func makeSupplementaryItems(with types: [SupplementaryItemType])
    -> [SupplementaryItem] {
        var supItemArr = [SupplementaryItem]()
        
        for type in types {
            switch type {
            case .header:
                supItemArr.append(self.makeHeader())
            case .footer:
                break
            }
        }
        
        return supItemArr
    }
    
    static func makeHeader() -> SupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.02))
        let supItem =
        SupplementaryItem(layoutSize: layoutSize,
                          elementKind: UICollectionView.elementKindSectionHeader,
                          alignment: .top)
        supItem.contentInsets = .init(top: -15, leading: 0, bottom: 0, trailing: 0)
        return supItem
    }
}

//MARK: - Default sections builder -
extension CompositionalLayoutHelper {
    static func getStoriesSection()
    -> NSCollectionLayoutSection {
        let item = CompositionalLayoutHelper
            .makeItem(width: .fractionalWidth(1),
                      height: .fractionalWidth(1))
        let group = CompositionalLayoutHelper
            .makeGroup(aligment: .horizontal,
                       width: .fractionalWidth(0.2),
                       height: .fractionalWidth(0.2),
                       spacing: 5,
                       items: [item])
        let section =
        CompositionalLayoutHelper.makeSection(from: group,
                                              scrollBehavior: .continuous)
        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = CompositionalLayoutHelper.makeSupplementaryItems(with: [.header])
        
        return section
    }
    
    static func getPopularSection()
    -> NSCollectionLayoutSection {
        let item = CompositionalLayoutHelper
            .makeItem(width: .fractionalWidth(1),
                      height: .fractionalHeight(1))
        let group = CompositionalLayoutHelper
            .makeGroup(aligment: .horizontal,
                       width: .fractionalWidth(1),
                       height: .fractionalHeight(0.5),
                       spacing: 10,
                       items: [item])
        let section =
        CompositionalLayoutHelper
            .makeSection(from: group,
                         scrollBehavior: .groupPagingCentered)
        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = CompositionalLayoutHelper
            .makeSupplementaryItems(with: [.header])
        
        return section
    }
    
    static func getComingSoonSection()
    -> NSCollectionLayoutSection {
        let item = CompositionalLayoutHelper
            .makeItem(width: .fractionalWidth(1),
                      height: .fractionalHeight(1))
        let group = CompositionalLayoutHelper
            .makeGroup(aligment: .horizontal,
                       width: .fractionalWidth(0.7),
                       height: .fractionalHeight(0.25),
                       spacing: 10,
                       items: [item])
        let section =
        CompositionalLayoutHelper
            .makeSection(from: group,
                         scrollBehavior: .continuousGroupLeadingBoundary)
        section.supplementariesFollowContentInsets = false
        section.boundarySupplementaryItems = CompositionalLayoutHelper.makeSupplementaryItems(with: [.header])
        
        return section
    }
    
    
}
