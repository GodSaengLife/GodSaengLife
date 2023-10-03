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
}

extension MainViewController: MainViewDelegate {
    func wakeUpSettingButtonTapped() {
        let moveVC = AlarmSettingViewController()
        showAlarmSettingView(moveVC)
    }
    
    func exerciseSettingButtonTapped() {
        let moveVC = TimeSettingViewController()
        moveVC.setInfomation(DataManager.shared.getExerciseInfo())
        showTimeSettingView(moveVC)
    }
    
    func studySettingButtonTapped() {
        let moveVC = TimeSettingViewController()
        moveVC.setInfomation(DataManager.shared.getStudyInfo())
        showTimeSettingView(moveVC)
    }
}
