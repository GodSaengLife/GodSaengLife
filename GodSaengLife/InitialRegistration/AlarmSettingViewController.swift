//
//  AlarmSettingViewController.swift
//  GodSaengLife
//
//  Created by playhong on 2023/09/27.
//

import UIKit

class AlarmSettingViewController: UIViewController {
    private let screenHeight = UIScreen.main.bounds.size.height
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .time
        return picker
    }()
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setConstraints()
    }
    
    private func addViews() {
        let views: [UIView] = [datePicker, saveButton]
        views.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight / 8),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            datePicker.heightAnchor.constraint(equalToConstant: (screenHeight / 8) + 45),
        ])
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            saveButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    // MARK: - Actions
    @objc private func saveButtonTapped() {
        self.dismiss(animated: true)
    }
}
