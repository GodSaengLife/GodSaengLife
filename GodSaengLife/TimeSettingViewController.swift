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
    
    private lazy var timeTextField: UITextField = {
        let tx = UITextField()
        tx.translatesAutoresizingMaskIntoConstraints = false
        tx.tintColor = .clear
        tx.font = .systemFont(ofSize: 50, weight: .regular)
        tx.textAlignment = .center
        tx.text = "00:00:00"
        tx.inputView = timePickerView
        return tx
    }()
    
    private lazy var timePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
    }
    
    private func setConstraints() {
        view.addSubview(timeTextField)
        NSLayoutConstraint.activate([
            timeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timeTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
            return "\(hour[row])시간"
        case 1:
            return "\(minute[row])분"
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
