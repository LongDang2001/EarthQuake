//
//  TableViewCell.swift
//  EarthQuake
//
//  Created by admin on 11/18/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lbMag: UILabel!
    @IBOutlet weak var lbPlace: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbUpdated: UILabel!
    @IBOutlet weak var lbTsunami: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
//
@IBDesignable
class customLabel: UILabel {
    private var _cornerRadius: CGFloat = 0.0

    @IBInspectable
    var cornerRadius: CGFloat {
        set (newValue) {
            _cornerRadius = newValue
            setCornerRadius()
        }
        get {
            return _cornerRadius
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setCornerRadius()
    }
    func setCornerRadius() {
        if _cornerRadius == -1 {
            layer.cornerRadius = frame.height * 0.5
        } else {
            layer.cornerRadius = _cornerRadius
        }
    }
}
