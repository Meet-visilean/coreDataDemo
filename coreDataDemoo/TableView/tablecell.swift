//
//  tablecell.swift
//  coreDataDemoo
//
//  Created by Visilean Meet on 08/02/22.
//

import UIKit

class tablecell: UITableViewCell {

    @IBOutlet var UsernameLBL: UILabel!
    @IBOutlet var emailLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
