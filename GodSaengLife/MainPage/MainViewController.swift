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
        mainView.delegate = self
    }
    
    // 버튼을 누르고 난 후
    override func viewWillAppear(_ animated: Bool) {
        changeButtonColor(button: mainView.exerciseStartButton, backgroundColor: .white, titleColor: .systemCyan)
        changeButtonColor(button: mainView.exerciseStopButton, backgroundColor: .white, titleColor: .systemRed)
        changeButtonColor(button: mainView.exerciseDoneButton, backgroundColor: .white, titleColor: .systemBlue)
    }
    
    //MARK: - Properties
    
    let mainView = MainView()
    
    var selectedTime: String = ""
    var selectedMeridiem: String = ""
    
    
    //MARK: - Actions
    // 버튼을 눌렀을 때의 액션
    
    
    
    //MARK: - Settings
    
    private func changeButtonColor(button: UIButton, backgroundColor: UIColor, titleColor: UIColor) {
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
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
    
    private func timerSettingView(_ button: UIButton) {
        
    }
    
}


//MARK: - Delegate

extension MainViewController: MainViewDelegate {
    
    func wakeUpSettingButtonTapped() {
        let moveVC = AlarmSettingViewController()
        
        moveVC.onTimeSelected = { [weak self] (selectedTime, selectedMeridiem) in
            self?.selectedTime = selectedTime
            self?.selectedMeridiem = selectedMeridiem
            
            self?.mainView.wakeUpTimeLabel.text = selectedTime
            self?.mainView.wakeUpTimeMeridiemLabel.text = selectedMeridiem
        }
        showAlarmSettingView(moveVC)
    }
    
    func exerciseSettingButtonTapped() {
        let moveVC = TimeSettingViewController()
        
        moveVC.onTimeSelected = { [weak self] (selectedTime, selectedMeridiem)  in
            // 이 클로저가 호출될 때 선택된 시간(selectedTime)을 받아올 수 있습니다.
            self?.selectedTime = selectedTime
            
            let formattedTime = "\(selectedTime)"
            self?.mainView.exerciseSetTheTimeLabel.text = formattedTime
        }
        showTimeSettingView(moveVC)
    }
    
    func studySettingButtonTapped() {
        
    }
    
    private func updateExerciseTimeLabel(hour: Int, minute: Int, second: Int) {
        let formattedTime = String(format: "%02d:%02d:%02d", hour, minute, second)
        mainView.exerciseSetTheTimeLabel.text = formattedTime
    }
}
