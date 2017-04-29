//
//  PlayerTableViewCell.swift
//  fb pagination
//
//  Created by Ymmanuel on 4/20/17.
//  Copyright © 2017 Hedgehog Labs. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var view: UIView!
    
    var player:Player!{
        didSet {
            imgAvatar.image = UIImage(named: player.avatar!)
            lblName.text = player.name.uppercased()
            lblScore.text = "\(player.score!)"
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.white.cgColor
    }
}
