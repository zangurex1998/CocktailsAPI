//
//  CocktailTableViewCell.swift
//  CocktailsAPI
//
//  Created by technomix on 02.01.23.
//

import UIKit
import Kingfisher
class CocktailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var drinkImage: UIImageView!
    @IBOutlet weak var nammeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        drinkImage.layer.cornerRadius = drinkImage.frame.width / 2
        
        
    }
    
    
    //MARK: - Methods
    
    func configure(with drink : DrinkCattegories){
        nammeLabel.text = drink.strDrink
        drinkImage.kf.setImage(with: URL(string: drink.strDrinkThumb))
        
    }

  
    
}
