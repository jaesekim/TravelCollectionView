//
//  TravelListViewController.swift
//  TravelCollectionView
//
//  Created by 김재석 on 1/12/24.
//

import UIKit

class TravelListViewController: UIViewController, ViewProtocol {

    @IBOutlet var travelListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureView()
        configureTableView()
        
    }
    


}

extension TravelListViewController {
    func configureView() {
        navigationItem.title = "도시 상세 정보"
    }
}

extension TravelListViewController {
    func configureTableView() {
        
        travelListTableView.delegate = self
        travelListTableView.dataSource = self
        
        // xib 연결
        let xib = UINib(nibName: "TravelListTableViewCell", bundle: nil)
        travelListTableView.register(xib, forCellReuseIdentifier: "TravelListTableViewCell")
        
        let xibAd = UINib(nibName: "AdListTableViewCell", bundle: nil)
        travelListTableView.register(xibAd, forCellReuseIdentifier: "AdListTableViewCell")
    }
}

extension TravelListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TravelInfo.travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let isAd = TravelInfo.travel[indexPath.row].ad
        
        if !isAd { // 여행지
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelListTableViewCell", for: indexPath) as! TravelListTableViewCell
            cell.setDataInCell(travelInfo: TravelInfo.travel[indexPath.row])
            cell.selectionStyle = .none
            return cell
        } else {  // 광고
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdListTableViewCell", for: indexPath) as! AdListTableViewCell
            cell.setDataInCell(travelInfo: TravelInfo.travel[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let isAd = TravelInfo.travel[indexPath.row].ad
        
        if !isAd {
            let sb = UIStoryboard(name: "TravelDetail", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "TravelDetailViewController")
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let sb = UIStoryboard(name: "AdDetail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "AdDetailViewController")
            
            // fullscreen으로 띄워주기
            vc.modalPresentationStyle = .fullScreen
            
            // present로 모달 띄우기
            present(vc, animated: true)
        }
    }
}
