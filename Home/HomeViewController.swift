import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var search: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var newJoin: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    // 디테일뷰로 데이터전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            guard let vc = segue.destination as? DetailPageViewController,
                  let cellData = sender as? postContent else {return}
            vc.titleString = cellData.title
            vc.contentString = cellData.content
            vc.writerString = cellData.writer
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "homeTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self

    }


}

extension HomeViewController: UITableViewDelegate{
    
    
}

extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.homeTitle.text = postList[indexPath.row].title
        cell.homeContent.text = postList[indexPath.row].content
        cell.writer.text = postList[indexPath.row].writer
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: postList[indexPath.row])
    }
    
    
}
