//
//  EventsCustomCell.swift
//  UWTSDEvents
//
//  Created by Sophie Novak on 09/05/2018.
//  Copyright © 2018 Sophie Novak. All rights reserved.
//

import UIKit

class EventsCustomCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var eventImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
