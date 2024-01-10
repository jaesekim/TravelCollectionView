//
//  UISegmentedControl.swift
//  TravelCollectionView
//
//  Created by 김재석 on 1/10/24.
//

import UIKit

extension UISegmentedControl {
    func segmentExtension() {
        // 타이틀 명 바꾸기
        self.setTitle("모두", forSegmentAt: 0)
        self.setTitle("국내", forSegmentAt: 1)
        // 타이틀 삽입
        self.insertSegment(withTitle: "해외", at: 2, animated: true)
    }
}
