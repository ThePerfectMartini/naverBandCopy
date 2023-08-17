//
//  TableViewCell.swift
//  naverBandCopy
//
//  Created by t2023-m0078 on 2023/08/17.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var homeTitle: UILabel!
    @IBOutlet weak var homeContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
