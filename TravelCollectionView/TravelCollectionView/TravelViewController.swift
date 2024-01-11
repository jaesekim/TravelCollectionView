//
//  TravelViewController.swift
//  TravelCollectionView
//
//  Created by 김재석 on 1/10/24.
//

import UIKit


class TravelViewController: UIViewController, ViewProtocol {
    var city: [City] = []  // segment 클릭될 때마다 업데이트 되면서 실질적으로 화면 보여줄 데이터 리스트
    
    @IBOutlet var segControl: UISegmentedControl!
    @IBOutlet var travelCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        
        // collection view와 view controller 연결
        travelCollection.delegate = self
        travelCollection.dataSource = self
        
        // segmentedController 설정
        setSegmented()
        
        // extension XIB 연결
        connectXibToCell(nibName: "TravelCollectionViewCell", targetCollection: travelCollection)
        
        // layout 관련 변수 선언
        let spacing: CGFloat = 16
        let cellWidth = (UIScreen.main.bounds.width - spacing * 3) / 2
        
        // extension 활용한 layout 설정
        setCollectionViewLayout(spacing: spacing, cellWidth: cellWidth, cellHeight: cellWidth, targetCollection: travelCollection)
    }
    

    
    // segmented 설정하는 함수
    func setSegmented() {
        segControl.segmentExtension()
        city = City.cityOriginal
        segControl.addTarget(self, action: #selector(showAllCityList), for: .valueChanged)
    }
    
    @objc func showAllCityList(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            city = City.cityOriginal.filter { (element) -> Bool in
                return element.domestic_travel
            }
        } else if sender.selectedSegmentIndex == 2{
            city = City.cityOriginal.filter { (element) -> Bool in
                return !element.domestic_travel
            }
        } else {
            city = City.cityOriginal
        }
        travelCollection.reloadData()
    }
    
}

extension TravelViewController {
    func configureView() {
        // title 설정
        navigationItem.title = "인기 도시"
    }
}

extension TravelViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // collection view 객체 생성
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TravelCollectionViewCell", for: indexPath) as! TravelCollectionViewCell
        
        // data view에 올리기
        cell.setDataInCell(city: city[indexPath.row])
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "TravelList", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "TravelListViewController") as! TravelListViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
