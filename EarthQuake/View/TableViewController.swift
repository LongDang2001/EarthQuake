//
//  TableViewController.swift
//  EarthQuake
//
//  Created by admin on 11/18/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // dây nó đang là phần tử,
    var quakeInfos: QuakeInfo?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 90
        
        dataService.shared.requestDataTask { data in
            self.quakeInfos = data
            //print(self.quakeInfos)
            self.tableView.reloadData() // load lại các data để hiển thị lên màn hình.
        }

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("fsdfs \(quakeInfos[quakeInfos.count].features.count)")
        // print(quakeInfos?.features.count ?? 0)
        return quakeInfos?.features.count ?? 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as! TableViewCell
        let index = indexPath.row
        
        ForMater.shared.updateData(place: quakeInfos?.features[index].properties.place ?? "", time: Double(quakeInfos?.features[index].properties.time ?? 0))
        
//        cell.lbMag.text = String(quakeInfos?.features[index].properties.mag ?? 0.0 )
//        cell.lbPlace.text = quakeInfos?.features[index].properties.place
//        cell.lbTsunami.text = String(quakeInfos?.features[index].properties.tsunami ?? 0)
//        cell.lbTime.text = String(quakeInfos?.features[index].properties.time ?? 0)
//        cell.lbUpdated.text = String(quakeInfos?.features[index].properties.updated ?? 0)
        cell.lbMag.text = String(quakeInfos?.features[index].properties.mag ?? 0.0 )
        cell.lbPlace.text = ForMater.shared.placeFirst
        cell.lbTime.text = String(ForMater.shared.timeInter)
        cell.lbTsunami.text = String(ForMater.shared.date)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let selectionView = tableView.indexPathForSelectedRow?.row else {
//            return
//        }
//        let indexDetail: Int = {
//            selectionView in
//
//        }
//        print(quakeInfos?.features[selectionView].properties.mag ?? 0.0)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow?.row else {
            return
        }
        // phần chuyển đổi giá trị
        ForMater.shared.updateData(place: quakeInfos?.features[index].properties.place ?? "", time: Double(quakeInfos?.features[index].properties.time ?? 0))
        
        let detailView = segue.destination as? DetailViewController
        detailView?.dataSing = String("ids: " + ForMater.shared.placeFirst)
        detailView?.dataDetail = String("Detail:  " + (quakeInfos?.features[index].properties.detail ?? ""))
        
        
//        let detailViewController = segue.destination as? DetailViewController
//        detailViewController?.lbMang.text = "String(quakeInfos?.features[0].properties.mag ?? 0)"

    }
    
}


