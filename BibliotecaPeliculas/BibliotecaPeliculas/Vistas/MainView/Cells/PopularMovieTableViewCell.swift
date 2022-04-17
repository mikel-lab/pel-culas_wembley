//
//  PopularMovieTableViewCell.swift
//  BibliotecaPeliculas
//
//  Created by Mikel Cobian on 15/4/22.
//

import Foundation
import UIKit

class PopularMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView?
    @IBOutlet weak var imageCell: UIImageView?
    @IBOutlet weak var title: UILabel?
    @IBOutlet weak var overviewLabel: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCell?.layer.cornerRadius = 4.0
        viewCell?.layer.shadowColor = UIColor.black.cgColor
        viewCell?.layer.shadowOffset = CGSize.zero
        viewCell?.layer.shadowOpacity = 0.6
        viewCell?.layer.shadowRadius = 4.0
        
        imageCell?.layer.cornerRadius = 4.0
        imageCell?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageCell?.image = nil
        title?.text = nil
        overviewLabel?.text = nil
    }
    
    func configureViews(image: String? = nil, title: String? = nil, description: String? = nil){
        
        //self.imageCell?.image = UIImage(named: image ?? "")
        self.imageCell?.kf.setImage(with: URL(string: "http://image.tmdb.org/t/p/w185\(image ?? "launch_cinema")"))
        self.title?.text = title
        self.overviewLabel?.text = description
 
    }
}
