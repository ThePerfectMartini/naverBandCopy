//
//  MyPageDetailViewController.swift
//  naverBandCopy
//
//  Created by t2023-m0048 on 2023/08/14.
//

import UIKit
import PhotosUI // PHPicekr 사용방법 (1) PhotosUI import하기

class MyPageEditViewController: UIViewController {
    @IBOutlet weak var editProfileImage: UIImageView!
    @IBOutlet weak var editUserNickname: UITextField!
    @IBOutlet weak var editUserIntroduction: UITextField!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var firstVC: MyPageViewController?
    var image : UIImage?
    var nickname: String?
    var introduction: String?
    var picker: PHPickerViewController?  // (2) picker 인스턴스 만들기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker?.delegate = self
        editUserNickname.delegate = self
        editUserIntroduction.delegate = self
        scrollView.delegate = self
        
        setupImage(editProfileImage)
        setupButton(photoButton)
        setupButton(saveButton)
        
        editProfileImage.image = image
        editUserNickname.text = nickname
        editUserIntroduction.text = introduction

        
        // (3) 기본값 1, 0 설정시 시스템이 지원하는 최대값으로 설정
        // 기본적으로 이미지, 라이브포토, 비디오와 같은 모든 에셋타입 표시
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        picker = PHPickerViewController(configuration: configuration)
        
        // 키보드
        self.setTapGesture() // 키보드 꺼지기
        NotificationCenter.default.addObserver(self, selector: #selector(keyboard), name:UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    
    // 첫번째 화면에 변경사항 반영
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let image = image {
            firstVC?.profileImage.image = image
        }
        if let nickname = nickname {
            firstVC?.userNickname.text = nickname
            profileList["의적"]?.name = nickname
        }
        if let introduction = introduction {
            firstVC?.userIntroduction.text = introduction
            profileList["의적"]?.introduce = introduction
        }
    }
    
    
    @objc func keyboard(notification: Notification){
        scrollView.setContentOffset(CGPoint(x: 1 ,y: 250), animated: true)
    }
    
    
    // 사진 저장 함수
    @IBAction func editPhotoButtonPressed(_ sender: UIButton) {
        if let picker = picker {
            picker.delegate = self
            present(picker, animated: true, completion: nil)
        }
        
    }
    
    // 프로필 저장 함수
    @IBAction func saveProfileButtonPressed(_ sender: UIButton) {
        if editProfileImage.image != nil {
            image = editProfileImage.image
        }
        if editUserNickname.text != "" {
            nickname = editUserNickname.text
        }
        if editUserIntroduction.text != "" {
            introduction = editUserIntroduction.text
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


// MARK: -UITextFieldDelegate

extension MyPageEditViewController: UITextFieldDelegate {
    
    func setTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 닉네임 텍스트필드에서 return키 누르면 자기소개 텍스트필드로 이동
        if textField == self.editUserNickname {
            self.editUserIntroduction.becomeFirstResponder()
            // 자기소개 텍스트필드에서 return키 누르면 save됨
        } else if textField == self.editUserIntroduction {
               self.saveProfileButtonPressed(self.saveButton)
           }
           return true
       }
}


// MARK: - PHPickerViewControllerDelegate
// (4) 유저가 선택을 완료했거나 취소 버튼으로 닫았을 때 알려주는 delegate, 프로토콜 준수
// PHPickerResult : 선택된 에셋을 나타내는 타입
// itemProvider : 선택된 에셋의 respresentation
extension MyPageEditViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        let itemProvider = results.first?.itemProvider
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                DispatchQueue.main.sync {
                    self.editProfileImage.image = image as? UIImage
                }
            }
        }
    }
}


// MARK: -UIScrollViewDelegate
extension MyPageEditViewController: UIScrollViewDelegate{
    
    //        func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //            let position = scrollView.contentOffset.y
    //            let offSetMatch = scrollView.contentSize.height - scrollView.frame.size.height
    //            print(scrollView.contentSize.height)
    //            print("화면 끝 : \(scrollView.frame.size.height)")
    //            if position > offSetMatch {
    //                print("화면 끝 도달")
    //            }
    //        }
    
    
}
