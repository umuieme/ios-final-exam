//
//  CocktailDetailViewController.swift
//  iOS-FinalExam
//
//  Created by Umesh Basnet on 11/04/2025.
//

import UIKit

class CocktailDetailViewController: UIViewController, CocktailDetailFetchDelegate {
   

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var instructionESLabel: UILabel!
    
    @IBOutlet weak var instructionDELabel: UILabel!
    
    var id: String?
    
    let networkManager = NetworkManager.shared;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkManager.cocktailDetailDelegate = self
        if let id = id {
            networkManager.fetchCocktailDetail(id: id)
        }
        
        // Do any additional setup after loading the view.
    }
    
    func didFetchCocktailDetail(data: CocktailDetail) {
        
        nameLabel.text = data.strDrink
        categoryLabel.text = data.strCategory
        typeLabel.text = data.strAlcoholic
        instructionsLabel.text = data.strInstructions
        instructionESLabel.text = data.strInstructionsDE
        instructionDELabel.text = data.strInstructionsDE
        
        ImageDownloader.downloadImage(imagePath: data.strDrinkThumb) { error, imageData in
            if let imageData = imageData {
                self.imageView.image = UIImage(data: imageData)
            }
        }
        
        
    }
    
    func didFailWithError(error: String) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
