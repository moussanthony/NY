//
//  ArticleViewController.swift
//  NY Times
//
//  Created by anthony moussa on 05/07/2022.
//

import UIKit

class ArticleViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var new: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = new?.title
        authorLabel.text = new?.byline
        textFieldLabel.text = new?.abstract
        dateLabel.text = new?.published_date
    }
}
