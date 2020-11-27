//
//  DetailViewController.swift
//  EarthQuake
//
//  Created by admin on 11/19/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var QuakeInfoDetail: QuakeInfo?
    @IBOutlet weak var lbMang: UILabel!
    @IBOutlet weak var lbDetail: UILabel!
    
    var dataSing: String = ""
    var dataDetail: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        pustData()
    }
    
    func pustData() {
        lbDetail.text = dataDetail
        lbMang.text = dataSing
        
        
//        dataService.shared.requestDataTask(completion:{ dataDetail in
//            self.QuakeInfoDetail = dataDetail
//            self.lbMang.text = String(self.QuakeInfoDetail?.features[7].properties.detail ?? "")
//
//        })
    }
    
}
