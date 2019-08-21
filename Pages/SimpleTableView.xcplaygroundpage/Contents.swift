import PlaygroundSupport
import UIKit

class ViewController: UIViewController {
    var tableView: UITableView?
    let items = [ "Hello", "Hallo", "Hullo" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        print(self.view.frame)
        self.tableView = UITableView(frame: self.view.frame)
        self.tableView?.dataSource = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(self.items[indexPath.row])"
        return cell
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.items.count
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "\(self.items[indexPath.row])"
//        return cell
//    }
}

var ctrl = ViewController()
PlaygroundPage.current.liveView = ctrl
