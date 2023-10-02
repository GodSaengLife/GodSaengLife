//
//  MainViewController.swift
//  GodSaengLife
//
//  Created by t2023-m0045 on 2023/09/25.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = mainView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        mainView.delegate = self
        
        alarmSwitchIsOn()
        setTimeSettingView()
    }
    
    //MARK: - Properties
    
    let mainView = MainView()
    
    var selectedTime: String = ""
    var selectedMeridiem: String = ""
    
    private var timer: Timer?
    private var startTime: Date?
    private var elapsedTime: TimeInterval = 0
    
    
    //MARK: - Actions
    // 버튼을 눌렀을 때의 액션
    
    @objc func onClickSwitch(sender: UISwitch) {
        // 알람 스위치 on/off에 따라 색상 변경
        if sender.isOn {
            mainView.wakeUpTimeLabel.textColor = .black
            mainView.wakeUpTimeMeridiemLabel.textColor = .black
        } else {
            mainView.wakeUpTimeLabel.textColor = .lightGray
            mainView.wakeUpTimeMeridiemLabel.textColor = .lightGray
        }
    }
    
    @objc private func wakeUpSettingButtonTapped() {
        // 기상 시간 세팅버튼
        let moveVC = AlarmSettingViewController()
        moveVC.onTimeSelected = { [weak self] (selectedTime, selectedMeridiem) in
            self?.selectedTime = selectedTime
            self?.selectedMeridiem = selectedMeridiem
            
            self?.mainView.wakeUpTimeLabel.text = selectedTime
            self?.mainView.wakeUpTimeMeridiemLabel.text = selectedMeridiem
        }
        showAlarmSettingView(moveVC)
    }
    
    @objc private func exerciseSettingButtonTapped() {
        // 운동 시간 세팅버튼
        let moveVC = TimeSettingViewController()
        moveVC.onTimeSelected = { [weak self] (selectedTime, selectedMeridiem)  in
            self?.selectedTime = selectedTime
            
            let formattedTime = "\(selectedTime)"
            self?.mainView.exerciseSetTheTimeLabel.text = formattedTime
        }
        showTimeSettingView(moveVC)
    }
    
    @objc private func studySettingButtonTapped() {
        // 공부 시간 세팅버튼
        let moveVC = TimeSettingViewController()
        moveVC.onTimeSelected = { [weak self] (selectedTime, selectedMeridiem)  in
            self?.selectedTime = selectedTime
            
            let formattedTime = "\(selectedTime)"
            self?.mainView.studySetTheTimeLabel.text = formattedTime
        }
        showTimeSettingView(moveVC)
    }
    

    //MARK: - Settings
    
    private func alarmSwitchIsOn() {
        mainView.alarmSwitchButton.addTarget(self, action: #selector(onClickSwitch(sender:)), for: .touchUpInside)
    }
    
    private func setTimeSettingView() {
        mainView.wakeUpTimeSettingButton.addTarget(self, action: #selector(wakeUpSettingButtonTapped), for: .touchUpInside)
        mainView.exerciseTimeSettingButton.addTarget(self, action: #selector(exerciseSettingButtonTapped), for: .touchUpInside)
        mainView.studyTimeSettingButton.addTarget(self, action: #selector(studySettingButtonTapped), for: .touchUpInside)
    }
    
    private func showAlarmSettingView(_ viewController: UIViewController) {
        viewController.title = "기상 시간 설정"
        
        let naviVC = UINavigationController(rootViewController: viewController)
        naviVC.modalPresentationStyle = .pageSheet
        
        
        let pageSheet = naviVC.presentationController as? UISheetPresentationController
        pageSheet?.detents = [.medium()]                    // Sheet의 멈추는 높이 :: 절반 높이에서 멈춤
        pageSheet?.selectedDetentIdentifier = .medium
        pageSheet?.prefersGrabberVisible = false
        pageSheet?.preferredCornerRadius = 8
        pageSheet?.animateChanges { pageSheet?.selectedDetentIdentifier = .medium }
        
        present(naviVC, animated: true)
    }
    
    private func showTimeSettingView(_ viewConroller: UIViewController) {
        viewConroller.title = "목표 시간 설정"
        
        let naviVC = UINavigationController(rootViewController: viewConroller)
        naviVC.modalPresentationStyle = .pageSheet
        
        let pageSheet = naviVC.presentationController as? UISheetPresentationController
        pageSheet?.detents = [.medium()]
        pageSheet?.selectedDetentIdentifier = .medium
        pageSheet?.prefersGrabberVisible = false
        pageSheet?.preferredCornerRadius = 8
        pageSheet?.animateChanges { pageSheet?.selectedDetentIdentifier = .medium }
        present(naviVC, animated: true)
    }
    
    private func changeButtonColor(button: UIButton, backgroundColor: UIColor, titleColor: UIColor) {
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
    }
    
    private func setStopWatchAttribute(_ button: UIButton) {
        
    }

}
