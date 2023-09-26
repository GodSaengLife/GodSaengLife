//
//  TimeSettingViewController.swift
//  GodSaengLife
//
//  Created by playhong on 2023/09/25.
//

import UIKit


final class TimeSettingViewController: UIViewController {
    private var hour = [Int](0...23)
    private var minute = [Int](0...59)
    private var selectedHour: Int = 0
    private var selectedMinute: Int = 0
    private let timePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    private func configure(_ pickerView: UIPickerView) {
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    private func setConstraints() {
        view.addSubview(timePicker)
        NSLayoutConstraint.activate([
            timePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

extension TimeSettingViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hour.count
        case 1:
            return minute.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(hour)시간"
        case 1:
            return "\(minute)분"
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
        default:
            break
        }
    }
}

extension TimeSettingViewController: UIPickerViewDelegate {
    
}
