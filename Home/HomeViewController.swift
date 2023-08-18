import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var newJoin: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    
    struct Sunset {
        let title: String
        let imageName: String
        let middle: String
        let writer: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            guard let vc = segue.destination as? DetailPageViewController,
                  let index = sender as? Int else {return}
            vc.index = index
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = postList[indexPath.row].title
        cell.label2.text = postList[indexPath.row].content
        cell.label3.text = postList[indexPath.row].writer
        cell.iconImageView.image = UIImage(named: "photo\(indexPath.row % 5 + 1)")
        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath.row)
    }
}




