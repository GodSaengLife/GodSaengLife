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
        label.font = .systemFont(ofSize: 17, weight: .medium)
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
            nicknameTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
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
    
    // MARK: - Actions
    @objc private func editButtonTapped() {
        
    }
}
