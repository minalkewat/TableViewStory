//
//  AttractionTableViewController.swift
//  TableViewStory
//
//  Created by Meenal Kewat on 5/14/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit

class AttractionTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractionNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AttractionTableViewCell
        let row = indexPath.row
        
        cell.lbl.font = UIFont.preferredFont(forTextStyle: .headline)
        cell.img.image = UIImage(named: attractionImages[indexPath.row])
        cell.lbl.text = attractionNames[row]
        return cell
    }
    

    @IBOutlet weak var tableview: UITableView!
    
    
    var attractionImages = [String]()
    var attractionNames = [String]()
    var webAddresses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        attractionNames = ["Buckingham Palace",
                           "The Eiffel Tower",
                           "The Grand Canyon",
                           "Windsor Castle",
                           "Empire State Building"]
        
        webAddresses = ["https://en.wikipedia.org/wiki/Buckingham_Palace",
                        "https://en.wikipedia.org/wiki/Eiffel_Tower",
                        "https://en.wikipedia.org/wiki/Grand_Canyon",
                        "https://en.wikipedia.org/wiki/Windsor_Castle",
                        "https://en.wikipedia.org/wiki/Empire_State_Building"]
        
        attractionImages = ["Buckingham_Palace.jpg",
                            "Eiffel.jpg",
                            "Empire_State_Building.jpg",
                            "Grand_Canyon.jpg",
                            "Windsor_Castle.jpg"]
        
        tableview.estimatedRowHeight = 50
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detail"{

            let detailVC = segue.destination as! AttractionDetailViewController
            let myIndexPAth = self.tableview.indexPathForSelectedRow
            let row = myIndexPAth?.row
            detailVC.website = webAddresses[row!]
        }
    }
}
