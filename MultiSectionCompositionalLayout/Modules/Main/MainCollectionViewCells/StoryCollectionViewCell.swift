//
//  StoryCollectionViewCell.swift
//  MultiSectionCompositionalLayout
//
//  Created by Мурад Чеерчиев on 26.07.2022.
//

import UIKit

final class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setCircleImageView()
    }
    
    func setup(_ item: ListItem) {
        cellImageView.image = UIImage(named: item.image)
        cellImageView.layoutIfNeeded()
    }
    
    func setCircleImageView() {
        cellImageView.layer.cornerRadius = cellImageView.frame.height / 2
    }
}
