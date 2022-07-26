//
//  CollectionViewHeaderReusableView.swift
//  MultiSectionCompositionalLayout
//
//  Created by Мурад Чеерчиев on 26.07.2022.
//

import UIKit

final class CollectionViewHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var cellTitleLbl: UILabel!
    
    func setup(_ title: String) {
        cellTitleLbl.text = title
    }
}
