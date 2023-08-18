import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var newJoin: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    var isFiltering: Bool = false
    var filteredArr: [postContent] = []
    
//    struct Sunset {
//        let title: String
//        let imageName: String
//        let middle: String
//        let writer: String
//    }
    
//    let data: [Sunset] = [
//        Sunset(title: "팀스파르타,코딩교육 순풍타고 상반기 200억돌파", imageName: "photo1", middle: "국비지원 부트캠프 ‘내일배움캠프’ 주효 실전 프로젝트 수행과 검증된 강사진으로 수강생 신뢰 확보한 팀스파르타판 K-디지털트레이닝 코딩 교육 스타트업 팀스파르타는 2023년 상반기", writer: "매일경제"),
//        Sunset(title: "팀스파르타, 창업 부트캠프 졸업한 우수팀 5곳에 시드투자", imageName: "photo2", middle: "팀스파르타가 운영하는 부트캠프 '창'은 예비창업자들을 대상으로 팀 빌딩부터 네트워킹 서비스, 실전 창업 강의 등의 창업 기초 교육을 진행하는 사업이다. 현재까지 5개 기수를 운영했고", writer: "머니투데이"),
//        Sunset(title: "스타트업 불황에도 호실적! 남다른 전략으로 ‘성장세’ 이어가는 다양한 스타", imageName: "photo3", middle: "지난 5월에는 기존 단어, 리스닝 학습 기능에 이어 문법모드를 정식 론칭하며 더욱 풍성한 학습 기능을 제공하는 중이다. 팀스파르타, 직장인 창업 부트캠프 ‘창’ 우수팀에 직접 시드 투자 진행", writer: "벤처스퀘어"),
//        Sunset(title: "팀스파르타, ‘호주 개발자 부트캠프’ 실시", imageName: "photo4", middle: "디지털 인사이트 | 장준영 기자 에듀테크 스타트업 팀스파르타가 개발자의 호주 취업을 돕는 부트캠프를 실시한다. 팀스파르타는 미국 직무교육 전문 기업‘제너럴어셈블리’와세계 최대HR서", writer: "다이아투데이"),
//        Sunset(title: "직장병행 IT부트캠프 , 팀스파르타 마케터 코스 론칭", imageName: "photo5", middle: "기사내용 요약 교육기간 12주 과정…5월7일까지 모집 에듀테크 스타트업 팀스파르타가 직장을 다니며 병행할 수 있는 IT 부트캠프 'SW캠프' 내 마케터 코스를 론칭했다고 6일 밝혔다. 마케터", writer: "뉴시스")]
    
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
        //cell.iconImageView.image = UIImage(named: sunset.imageName)
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
