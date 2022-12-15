//
//  MovieTableViewCell.swift
//  Movie API TRUNG
//
//  Created by trung on 15/12/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblSummary: UILabel!
    
    @IBOutlet weak var lblRating: UILabel!
    
    @IBOutlet weak var lblPopular: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configData() {
        
    }
    
}
