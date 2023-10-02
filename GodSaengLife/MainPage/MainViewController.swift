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
        startExerciseStopwatch()
        startStudyStopwatch()
    }
    
    //MARK: - Properties
    
    let mainView = MainView()
    var stopwatch = Stopwatch()
    
    var selectedTime: String = ""
    var selectedMeridiem: String = ""
    
    var elapsedMiliSecond = 0
    var elapsedSecond = 0
    var elapsedMinute = 0
    
    
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
    
    
    private func startExerciseStopwatch() {
        mainView.exerciseStartButton.addTarget(self, action: #selector(startButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func startStudyStopwatch() {
        mainView.studyStartButton.addTarget(self, action: #selector(startButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    // MARK: -  Settings:: Exercise StopWatch
    
    @objc func startButtonTapped(_ sender: UIButton) {
        print ("시작 버튼 탭")
        var isStarted = stopwatch.isStarted
        
        // 타이머가 생성되어 있는지 확인
        if stopwatch.timer == nil {
            createTimer()
        }
        
        isStarted = !isStarted
        if(isStarted){
            mainView.exerciseStartButton.backgroundColor = .systemBlue
            mainView.exerciseStartButton.setTitleColor(UIColor.white, for: .normal)
        } else{
            mainView.exerciseStartButton.backgroundColor = .white
            mainView.exerciseStartButton.setTitleColor(UIColor.systemBlue, for: .normal)
        }
    }
    
    private func createTimer(){
        // 타이머 중복 생성 방지
        if stopwatch.timer == nil {
            // 1초 간격으로 updateTimeCounting 함수 호출하여 경과된 시간을 업데이트
            stopwatch.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimeCounting), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateTimeCounting() -> Void {
        stopwatch.counter = stopwatch.counter + 1
        
        let time = secondsToHoursMinitesSeconds(seconds: stopwatch.counter)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        
        DispatchQueue.main.async {
            self.mainView.exerciseTimeLabel.text = timeString
        }
    }
    
    private func secondsToHoursMinitesSeconds(seconds: Int) -> (Int, Int, Int) {
        // 초에서 시간 : 분 : 초로 바꾸어주는 함수
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    private func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        // 초에서 시간, 분, 초로 바꾼 숫자를 문자열 형태로 변환해주는 함수
        var timeString = ""
        timeString += String(format: "%02d", hours)
//        timeString += " : "
        timeString += String(format: ":%02d", minutes)
//        timeString += " : "
        timeString += String(format: ":%02d", seconds)
        
        return timeString // hours : minutes : seconds 형태로 출력
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //    @objc private func stopwatchStartButtonTapped() -> UIButton{
    //        print("스탑 버튼 탭")
    //    }
    //
    //    @objc private func stopwatchStopButtonTapped() {
    //
    //    }
    //
    //    @objc private func stopwatchCompleteButtonTapped() {
    //        print("완료 버튼 탭")
    //    }
    //
    //
    //    private func startButtonAttribute(_ sender: UIButton) {
    //        sender.addTarget(self, action: #selector(stopwatchStartButtonTapped), for: .touchUpInside)
    //    }
    //
    //    private func stopButtonAttribute() -> UIButton {
    //        let button = UIButton()
    //        // 버튼을 눌렀을 때 버튼 컬러
    //        button.backgroundColor = .systemRed
    //        button.setTitleColor(UIColor.white, for: .normal)
    //
    //        // 버튼을 눌렀을 때 액션stopWatchCompleteButtonTapped
    //        button.addTarget(self, action: #selector(stopwatchStopButtonTapped), for: .touchUpInside)
    //
    //        return button
    //    }
    //
    //    private func completeButtonAttribute() -> UIButton {
    //        let button = UIButton()
    //        // 버튼을 눌렀을 때 버튼 컬러
    //        button.backgroundColor = .systemRed
    //        button.setTitleColor(UIColor.white, for: .normal)
    //
    //        // 버튼을 눌렀을 때 액션
    //        button.addTarget(self, action: #selector(stopwatchCompleteButtonTapped), for: .touchUpInside)
    //
    //        return button
    //    }
}
