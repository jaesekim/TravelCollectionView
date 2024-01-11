//
//  AdDetailViewController.swift
//  TravelCollectionView
//
//  Created by 김재석 on 1/12/24.
//

import UIKit

class AdDetailViewController: UIViewController, ViewProtocol {

    @IBOutlet var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = "광고 화면"
        mainLabel.font = .systemFont(ofSize: 28)
        
        view.backgroundColor = .systemGray3
    }
    @IBAction func dismissOnClick(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

  

}

extension AdDetailViewController {
    func configureView() {
        navigationItem.title = "광고 화면"
    }
}
