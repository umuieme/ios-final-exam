//
//  ViewController.swift
//  iOS-FinalExam
//
//  Created by Umesh Basnet on 11/04/2025.
//

import UIKit

class ViewController: UIViewController, CocktailListFetchDelegate, UITableViewDataSource, UITableViewDelegate {
    
    
   
    let networkManager = NetworkManager.shared;
    
    var drinkType = "Alcoholic";
    var cocktailList : [CocktailItem] = []

    @IBOutlet weak var cocktailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkManager.cocktailListDelegate = self
        cocktailTableView.delegate = self
        cocktailTableView.dataSource = self
        fetchData()
    }
    
    func fetchData() {
        networkManager.fetchCocktailApiList(type: drinkType)
    }

    func didFetchCocktailList(data: [CocktailItem]) {
        cocktailList = data
        cocktailTableView.reloadData()
    }
    
    func didFailWithError(error: String) {
        print(error)
    }
    
    
    @IBAction func onCocktailTypeChanged(_ sender: UISwitch) {
        drinkType = sender.isOn ? "Alcoholic" : "Non_Alcoholic"
        fetchData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cocktailCell", for: indexPath) as! CocktailItemTableViewCell
        
        cell.setData(cocktail: cocktailList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(cocktailTableView.indexPathForSelectedRow!.row)
        if let cocktailDetailViewController =  segue.destination as? CocktailDetailViewController {
            cocktailDetailViewController.id = cocktailList[cocktailTableView.indexPathForSelectedRow!.row].idDrink
            cocktailTableView.deselectRow(at: cocktailTableView.indexPathForSelectedRow!, animated: false)
        }
    }
    
}

