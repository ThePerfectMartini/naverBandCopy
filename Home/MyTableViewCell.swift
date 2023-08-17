//
//  MyTableViewCell.swift
//  naverBandCopy
//
//  Created by 정일한 on 2023/08/17.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var TableViewCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
