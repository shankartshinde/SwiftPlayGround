//: [Previous](@previous)

import PlaygroundSupport
import UIKit

class WWDCMasterViewController: UITableViewController {
    var reasons = ["the labs are great", "the sessions teach new things", "the people are awesome", "the keynote rocks", "I must hug Joe Groff"]
    
    override func viewDidLoad() {
        title = "Reasons I should attend WWDC"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = reasons[indexPath.row]
        return cell
    }
}

let master = WWDCMasterViewController()
let nav = UINavigationController(rootViewController: master)
PlaygroundPage.current.liveView = nav
