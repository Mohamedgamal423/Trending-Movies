//
//  Moviecell.swift
//  Trending Movies
//
//  Created by Mohamed on 28/11/2023.
//

import UIKit
import SDWebImage

class Moviecell: UITableViewCell {

    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var ratelbl: UILabel!
    @IBOutlet weak var movieimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backview.addBorder(color: .label, width: 1)
        backview.round()
        movieimg.round(5)
        backview.backgroundColor = .systemGray5
    }
    func setCell(viewmodel: MovieTableCellViewModel){
        namelbl.text = viewmodel.title
        datelbl.text = viewmodel.date
        ratelbl.text = viewmodel.rating
        movieimg.sd_setImage(with: viewmodel.imageUrl)
    }
    
}
