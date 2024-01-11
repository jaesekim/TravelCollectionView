//
//  AdListTableViewCell.swift
//  TravelCollectionView
//
//  Created by 김재석 on 1/12/24.
//

import UIKit

class AdListTableViewCell: UITableViewCell {

    @IBOutlet var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .systemGreen
        self.layer.cornerRadius = 10
    }

    func setDataInCell(travelInfo: TravelInfo) {
        contentLabel.text = travelInfo.title
    }
    
}
