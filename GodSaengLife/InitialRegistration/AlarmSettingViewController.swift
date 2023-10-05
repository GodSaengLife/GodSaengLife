//
//  AlarmSettingViewController.swift
//  GodSaengLife
//
//  Created by playhong on 2023/09/27.
//

import UIKit

class AlarmSettingViewController: UIViewController {
    // MARK: - Constants
    var onTimeSelected: ((String, String) -> Void)?
    private let screenHeight = UIScreen.main.bounds.size.height
    
    // MARK: - Components
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

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setConstraints()
        setSelectedTime()
    }
    
    // MARK: - Add Views
    private func addViews() {
        let views: [UIView] = [datePicker, saveButton]
        views.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // MARK: - Constraints
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
    
    private func setSelectedTime() {
        guard let wakeUpTime = DataManager.shared.getAlarmInfo()?.wakeUpTime else { return }
        datePicker.setDate(wakeUpTime, animated: true)
    }
    
    // MARK: - Actions
    @objc private func saveButtonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a"

        // 메리디움 :: 오전, 오후 구분
        let meridiem = dateFormatter.string(from: datePicker.date)

        // 시간 형식 설정
        dateFormatter.dateFormat = "hh:mm"
        let time = dateFormatter.string(from: datePicker.date)
        
        // 데이터 저장
        let alarmInfo = DataManager.shared.getAlarmInfo()
        alarmInfo?.wakeUpTime = datePicker.date
        DataManager.shared.update(alarmInfo)
        // 데이터 전달 - 클로저 사용
        onTimeSelected?(time, meridiem)
        
        NotificationManager.shared.scheduleNotification(at: datePicker.date, title: "기상알람", body: "기상알람", identifier: "alarm")
        
        self.dismiss(animated: true)
    }
}
