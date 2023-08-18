import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var newJoin: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    var isFiltering: Bool = false
    var filteredArr: [postContent] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = false
        
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
        return isFiltering ? filteredArr.count : postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        let data: postContent
        if isFiltering {
            data = filteredArr[indexPath.row]
        } else {
            data = postList[indexPath.row]
        }
        
        cell.label.text = data.title
        cell.label2.text = data.content
        cell.label3.text = data.writer
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


// MARK: -UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isFiltering = true
        searchBar.showsCancelButton = true
        table.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text?.lowercased() else { return }
        filteredArr = postList.filter{$0.title.localizedCaseInsensitiveContains(text)}
        table.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        filteredArr = []
        isFiltering = false
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        table.reloadData()
    }
    
}
