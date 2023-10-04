//
//  TimeSettingViewController.swift
//  GodSaengLife
//
//  Created by playhong on 2023/09/25.
//

import UIKit

final class TimeSettingViewController: UIViewController {
    private let screenHeight = UIScreen.main.bounds.size.height
    private var hourRange = [Int](0...23)
    private var minuteRange = [Int](0...59)
    private var secondsRange = [Int](0...59)
    private var selectedHour: Int = 0
    private var selectedMinute: Int = 0
    private var selectedSecond: Int = 0
    private var settingInfomation: Infomation? {
        didSet {
            let time = DataManager.shared.convertTime(toSeconds: settingInfomation?.objectiveTime)
            setSelectRow(time: time)
        }
    }
    
    // MARK: - Component
    private lazy var timePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
        setConstraints()
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        view.addSubview(timePickerView)
        NSLayoutConstraint.activate([
            timePickerView.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight / 8),
            timePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            timePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            timePickerView.heightAnchor.constraint(equalToConstant: (screenHeight / 8) + 45),
        ])
        view.addSubview(saveButton)
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            saveButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    // MARK: - Setting
    private func setSelectRow(time: (Int, Int, Int)) {
        timePickerView.selectRow(time.0, inComponent: 0, animated: true)
        timePickerView.selectRow(time.1, inComponent: 1, animated: true)
        timePickerView.selectRow(time.2, inComponent: 2, animated: true)
    }
    
    func setInfomation(_ infomation: Infomation) {
        self.settingInfomation = infomation
    }

    
    // MARK: - Actions
    @objc private func saveButtonTapped() {
        if let _ = self.settingInfomation as? StudyInfo {
            let info = DataManager.shared.getStudyInfo()
            info.objectiveTime = DataManager.shared.convertSeconds(toHour: self.selectedHour,
                                                                   toMinute: self.selectedMinute,
                                                                   toSeconds: self.selectedSecond)
            DataManager.shared.updateObjectiveTime(info)
        }
        if let _ = self.settingInfomation as? ExerciseInfo {
            let info = DataManager.shared.getExerciseInfo()
            info.objectiveTime = DataManager.shared.convertSeconds(toHour: self.selectedHour,
                                                                   toMinute: self.selectedMinute,
                                                                   toSeconds: self.selectedSecond)
            DataManager.shared.updateObjectiveTime(info)
        }
        self.dismiss(animated: true)
    }
}

extension TimeSettingViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hourRange.count
        case 1:
            return minuteRange.count
        case 2:
            return secondsRange.count
        default:
            return 0
        }
    }
}

extension TimeSettingViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(hourRange[row])시간"
        case 1:
            return "\(minuteRange[row])분"
        case 2:
            return "\(secondsRange[row])초"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedHour = hourRange[row]
        case 1:
            selectedMinute = minuteRange[row]
        case 2:
            selectedSecond = secondsRange[row]
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return screenHeight / 14
    }
}
