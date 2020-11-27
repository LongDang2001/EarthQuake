//
//  FromaterData.swift
//  EarthQuake
//
//  Created by admin on 11/19/20.
//  Copyright © 2020 Long. All rights reserved.
//

import Foundation

class ForMater {
    static let shared = ForMater()
    var quakeInfoss: QuakeInfo?
    var placeFirst: String = ""
    var placeLast: String = ""
    var timeInter: String = ""
    var date: String = ""
    func updateData(place: String, time: Double) {
        
        if place.contains("of") {
            let placeArray = place.components(separatedBy: "of")
            self.placeFirst = placeArray.first ?? ""
            self.placeLast = placeArray.last ?? ""
        } else {
            self.placeFirst = "THE NERVER"
            self.placeLast = place
        }
        
        let dateForMatter = DateFormatter()
        dateForMatter.timeStyle = .short
        self.timeInter = dateForMatter.string(from: Date(timeIntervalSince1970: time / 1000))
        dateForMatter.timeStyle = .none
        dateForMatter.dateStyle = .medium
        self.date = dateForMatter.string(from: Date(timeIntervalSince1970: time / 1000))
        
    }
    
}
