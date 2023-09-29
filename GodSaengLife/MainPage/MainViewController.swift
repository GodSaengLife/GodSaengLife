//
//  MainViewController.swift
//  GodSaengLife
//
//  Created by t2023-m0045 on 2023/09/25.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    
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
    
    //MARK: - Actions
    // 버튼을 눌렀을 때의 액션
   
    
    
    //MARK: - Settings
    
    private func changeButtonColor(button: UIButton, backgroundColor: UIColor, titleColor: UIColor) {
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
    }
    
    private func showAlarmSettingView(_ viewConroller: UIViewController) {
        viewConroller.title = "시간 설정"
       
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

    private func showTimeSettingView(_ viewConroller: UIViewController) {
        viewConroller.title = "시간 설정"
       
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
        showAlarmSettingView(moveVC)
    }
    
    func exerciseSettingButtonTapped() {
        let moveVC = TimeSettingViewController()
        showTimeSettingView(moveVC)
    }
    
    func studySettingButtonTapped() {
        let moveVC = TimeSettingViewController()
        showTimeSettingView(moveVC)
    }
}
