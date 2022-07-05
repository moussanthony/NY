//
//  ViewController.swift
//  NY Times
//
//  Created by anthony moussa on 04/07/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var refresh = UIRefreshControl()
    var newsData = [Article]()
    
    let options = ["Last Day", "Last Week", "Last Month"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ParsingJson { data in
            self.newsData = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        self.tableView.addSubview(refresh)
        catButton()
        
    }

    
    @IBAction func catButtonPressed(_ sender: UIButton) {
        
    }
    
    func catButton() {

        let optionClosure = { (action: UIAction) in
            print(action.title)
            
            
        }

        categoryButton.menu = UIMenu(children: [
            UIAction(title: options[0], state: .on, handler: optionClosure),
            UIAction(title: options[1], handler: optionClosure),
            UIAction(title: options[2], handler: optionClosure)
        ])

        categoryButton.showsMenuAsPrimaryAction = true
        categoryButton.changesSelectionAsPrimaryAction = true

      
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = newsData[indexPath.row].title
        refresh.endRefreshing()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ArticlePage", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ArticleViewController {
            destination.new = newsData[tableView.indexPathForSelectedRow!.row]
        }
    }
}
