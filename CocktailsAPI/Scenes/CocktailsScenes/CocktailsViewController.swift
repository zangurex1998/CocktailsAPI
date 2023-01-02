//
//  CocktailsViewController.swift
//  CocktailsAPI
//
//  Created by technomix on 02.01.23.
//

import UIKit

class CocktailsViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Properties
    var decode : APIManagerProtocol?
    
    var drinks : [DrinkCattegories] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
       decode = APIManager()
        tableView.reloadData()
       
        decode?.fetchCoctkails(completion: { drink in
            self.drinks = drink.drinks
            
        })
        
        
    }
    
    //MARK: - Methods
    
    func setUpView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CocktailTableViewCell", bundle: nil), forCellReuseIdentifier: "CocktailTableViewCell")
    }

}
extension CocktailsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailTableViewCell", for: indexPath) as! CocktailTableViewCell
        cell.configure(with: drinks[indexPath.row])
        return cell
        
        
    }
    
    
}
