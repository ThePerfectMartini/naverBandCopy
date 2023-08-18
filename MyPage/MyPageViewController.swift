//
//  MyPageViewController.swift
//  naverBandCopy
//
//  Created by t2023-m0048 on 2023/08/14.
//


import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNickname: UILabel!
    @IBOutlet weak var userIntroduction: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var nicknameView: UIView!
    @IBOutlet weak var introductionView: UIView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImage(profileImage)
        setupLabel(userNickname)
        setupLabel(userIntroduction)
        setupButton(editProfileButton)
        setupButton(editButton)
        setupView(nicknameView)
        setupView(introductionView)
        
        tableView.delegate = self
        tableView.dataSource = self
        // 테이블뷰에 xib파일 등록
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        userNickname.text = profileList["의적"]?.name
        userIntroduction.text = profileList["의적"]?.introduce
        
    }
    
    @IBAction func editProfileButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "myToEditMy", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "myToEditMy" {
            if let secondVC = segue.destination as? MyPageEditViewController {
                secondVC.firstVC = self
                secondVC.image = profileImage.image
                secondVC.nickname = userNickname.text
                secondVC.introduction = userIntroduction.text
            }
        }
        if segue.identifier == "toDetail" {
            guard let vc = segue.destination as? DetailPageViewController,
                  let cellData = sender as? postContent else {return}
            vc.titleString = cellData.title
            vc.contentString = cellData.content
            vc.writerString = cellData.writer
        }
    }
    
}



//MARK: -UI func

// UI 함수
func setupImage(_ imageView: UIImageView) {
    imageView.layer.cornerRadius = imageView.frame.height / 2
    imageView.clipsToBounds = true
}

func setupView(_ view: UIView){
    view.layer.cornerRadius = 10
}

func setupLabel(_ label: UILabel){
    label.layer.cornerRadius = 10
}

func setupButton(_ button: UIButton){
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.gray.cgColor
    button.layer.cornerRadius = 10
}



// MARK: -UITableViewDataSource
extension MyPageViewController: UITableViewDelegate {
    
}


extension MyPageViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        cell.postTitle.text = postList[indexPath.row].title
        cell.postContent.text = postList[indexPath.row].content
        // cell.postImage.image =
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: postList[indexPath.row])
    }
    
}
