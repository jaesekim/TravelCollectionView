//
//  TravelListTableViewCell.swift
//  TravelCollectionView
//
//  Created by 김재석 on 1/12/24.
//

import UIKit
import Kingfisher

class TravelListTableViewCell: UITableViewCell {

    @IBOutlet var placeImageView: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    @IBOutlet var starIconImageView: UIImageView!
    @IBOutlet var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        contentLabel.font = .systemFont(ofSize: 12)
        contentLabel.textColor = .gray
        contentLabel.numberOfLines = 0
        
        countLabel.font = .systemFont(ofSize: 12)
        countLabel.textColor = .gray
        
        placeImageView.layer.cornerRadius = 8
    }

    func setDataInCell(travelInfo: TravelInfo) {
        let imgUrl = URL(string: travelInfo.travel_image!)
        placeImageView.kf.setImage(with: imgUrl)
        placeImageView.contentMode = .scaleAspectFill
        
        titleLabel.text = travelInfo.title
        
        contentLabel.text = travelInfo.description
        
        starIconImageView.image = UIImage(systemName: "star.fill")
        starIconImageView.tintColor = .systemYellow
        countLabel.text = "(\(travelInfo.grade!)) 저장 \(travelInfo.save!)"
    }
    
}
