//
//  LandscapeCollectionViewCell.swift
//  MultiSectionCompositionalLayout
//
//  Created by Мурад Чеерчиев on 26.07.2022.
//

import UIKit

final class LandscapeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellTitleLbl.text = item.title
    }
}
