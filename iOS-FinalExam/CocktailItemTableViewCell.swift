//
//  CocktailItemTableViewCell.swift
//  iOS-FinalExam
//
//  Created by Umesh Basnet on 11/04/2025.
//

import UIKit

class CocktailItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var drinkImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(cocktail: CocktailItem){
        nameLabel.text = cocktail.strDrink
        ImageDownloader.downloadImage(imagePath: cocktail.strDrinkThumb) { error, imageData in
            if let imageData = imageData {
                self.drinkImageView.image = UIImage(data: imageData)
            }
        }
    }

}
