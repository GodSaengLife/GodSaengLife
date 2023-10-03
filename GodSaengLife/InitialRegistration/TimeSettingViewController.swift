//
//  TimeSettingViewController.swift
//  GodSaengLife
//
//  Created by playhong on 2023/09/25.
//

import UIKit

enum SelectedCategory {
    case study
    case exercise
}

final class TimeSettingViewController: UIViewController {
    private let screenHeight = UIScreen.main.bounds.size.height
    private var selectedCategory: SelectedCategory?
    private var hour = [Int](0...23)
    private var minute = [Int](0...59)
    private var second = [Int](0...59)
    private var selectedHour: Int = 0
    private var selectedMinute: Int = 0
    private var selectedSecond: Int = 0
    private var computedHour: Int { selectedHour * 3600 }
    private var computedMinute: Int { selectedMinute * 60 }
    private var computedSecond: Int { selectedSecond }
    private var computedTime: Int { computedHour + computedMinute + computedSecond }
    var studyInfo: StudyInfo? {
        didSet {
            let time = DataManager.shared.convertTime(toSeconds: studyInfo?.objectiveTime)
            setSelectRow(time: time)
        }
    }
    var exerciseInfo: ExerciseInfo? {
        didSet {
            let time = DataManager.shared.convertTime(toSeconds: exerciseInfo?.objectiveTime)
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

    
    // MARK: - Actions
    func setSelectedCategory(_ selectedCategory: SelectedCategory) {
        self.selectedCategory = selectedCategory
    }
    
    @objc private func saveButtonTapped() {
        if self.selectedCategory == .study {
            let info = DataManager.shared.getStudyInfo()
            info.objectiveTime = self.computedTime
            DataManager.shared.updateObjectiveTime(info)
        }
        if self.selectedCategory == .exercise {
            let info = DataManager.shared.getExerciseInfo()
            info.objectiveTime = self.computedTime
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
            return hour.count
        case 1:
            return minute.count
        case 2:
            return second.count
        default:
            return 0
        }
    }
}

extension TimeSettingViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(hour[row])시간"
        case 1:
            return "\(minute[row])분"
        case 2:
            return "\(second[row])초"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedHour = hour[row]
        case 1:
            selectedMinute = minute[row]
        case 2:
            selectedSecond = second[row]
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return screenHeight / 14
    }
}
