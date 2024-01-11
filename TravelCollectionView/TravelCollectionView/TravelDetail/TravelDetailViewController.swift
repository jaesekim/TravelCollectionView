//
//  TravelDetailViewController.swift
//  TravelCollectionView
//
//  Created by 김재석 on 1/12/24.
//

import UIKit

class TravelDetailViewController: UIViewController, ViewProtocol {
    
    
    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = "관광지 화면"
        mainLabel.font = .systemFont(ofSize: 28)
        
        view.backgroundColor = .systemGray3
    }
    
    @IBAction func popOnCilck(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension TravelDetailViewController {
    func configureView() {
        navigationItem.title = "관광지 화면"
    }
}
