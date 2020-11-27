//
//  DataService.swift
//  EarthQuake
//
//  Created by admin on 11/18/20.
//  Copyright © 2020 Long. All rights reserved.
//

import Foundation
class dataService {
    static let shared = dataService() // tạo ra để gọi phần tử ra.
    var urlString: String = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/4.5_week.geojson"
    
// request data
    func requestDataTask(completion: @escaping (QuakeInfo) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        /*
         dataTask: tạo môt đối tuơngj truy suất, và gọi xử lý nd
         */
        let task = URLSession.shared.dataTask(with: urlRequest) {
            // gửi các yêu cầu
            (data, response, error) in
            guard error == nil else {
                return
            }
            /*
             JSONSerialization: convert thành kiểu dữ liệu json.
             */
            guard let dataResponse = data else {
                return
            }
            guard let jsonObject = try? JSONDecoder().decode(QuakeInfo.self, from: dataResponse) else {
                return
            }
//            print(dataReponse)
            // lay du lieu json sau khi request
            guard let json = jsonObject as? QuakeInfo else {
                return
            }
            // tại sao phải thêm mấy cái này vào, thực hiện
            DispatchQueue.main.async {
                print(json)
                // call backd
                completion(json)
                
            }
        }
        task.resume()
    }
    
}

