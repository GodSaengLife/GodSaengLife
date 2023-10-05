//
//  MyPageViewController.swift
//  GodSaengLife
//
//  Created by t2023-m0045 on 2023/09/27.
//

import UIKit

class MyPageViewController: UIViewController {
    // MARK: - Components
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.clipsToBounds = true
        iv.image = UIImage(named: "profileImage")
        iv.layer.cornerRadius = 60
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.lightGray.cgColor
        return iv
    }()
    
    private lazy var nicknameTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .medium)
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("프로필 수정", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setConstraints()
        setUserData()
    }
    
    // MARK: - Add Views
    private func addViews() {
        let views: [UIView] = [imageView, nicknameTitleLabel, editButton]
        views.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120)
        ])
        NSLayoutConstraint.activate([
            nicknameTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nicknameTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nicknameTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: nicknameTitleLabel.bottomAnchor, constant: 20),
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            editButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Setting
    private func setUserData() {
        if let imageData = UserDefaults.standard.data(forKey: "userImage") {
            let image = UIImage(data: imageData)
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "profileImage")
        }
        let nickname = UserDefaults.standard.string(forKey: "nickname")
        nicknameTitleLabel.text = nickname
    }
    
    // MARK: - Present
    private func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    private func presentNicknameEditAlert() {
        let alert = UIAlertController(title: "닉네임 변경하기", message: "변경할 닉네임을 입력해주세요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let save = UIAlertAction(title: "저장", style: .default) { _ in
            let nickname = alert.textFields?.first?.text
            UserDefaults.standard.set(nickname, forKey: "nickname")
            self.nicknameTitleLabel.text = nickname
        }
        alert.addAction(cancel)
        alert.addAction(save)
        alert.addTextField { textField in
            textField.placeholder = UserDefaults.standard.string(forKey: "nickname")
        }
        present(alert, animated: true)
    }
    
    private func presentActionSheet() {
        let alert = UIAlertController(title: "프로필 수정", message: nil, preferredStyle: .actionSheet)
        let editProfileImage = UIAlertAction(title: "이미지 변경하기", style: .default) { _ in
            self.presentImagePicker()
        }
        let editNickname = UIAlertAction(title: "닉네임 변경하기", style: .default) { _ in
            self.presentNicknameEditAlert()
        }
        let cancel = UIAlertAction(title: "취소하기", style: .cancel)
        alert.addAction(editProfileImage)
        alert.addAction(editNickname)
        alert.addAction(cancel)
        present(alert, animated: true)
    }

    // MARK: - Actions
    @objc private func editButtonTapped() {
        presentActionSheet()
    }
}

extension MyPageViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            let imageData = image?.jpegData(compressionQuality: 0.0)
            UserDefaults.standard.set(imageData, forKey: "userImage")
            self.imageView.image = image
        }
    }
}

extension MyPageViewController: UINavigationControllerDelegate {
    
}
