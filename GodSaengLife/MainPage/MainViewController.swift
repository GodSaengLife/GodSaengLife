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
        
        alarmSwitchIsOn()
        setTimeSettingView()
        setStopwatchButtons()
    }
    
    
    //MARK: - Properties
    
    let mainView = MainView()
    var exerciseStopwatch = Stopwatch()
    var studyStopwatch = Stopwatch()
    
    var selectedTime: String = ""
    var selectedMeridiem: String = ""
    
    
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
    
    
    //MARK: - Actions
    
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
    
    @objc func exerciseStartButtonTapped(_ sender: UIButton) {
        print ("운동 시작 버튼 탭")
        
        if exerciseStopwatch.timer == nil || !exerciseStopwatch.isStarted {
                createExerciseTimer()
                mainView.exerciseTimeLabel.textColor = .black
                exerciseStopwatch.isStarted = true
            }
    }
    
    @objc func exerciseStopButtonTapped(_ sender: UIButton) {
        print ("운동 정지 버튼 탭")
        if exerciseStopwatch.isStarted {
            exerciseStopwatch.isStarted = false
            exerciseStopwatch.timer?.invalidate()
            mainView.exerciseTimeLabel.textColor = .gray
        }
    }
    
    @objc func exerciseDoneButtonTapped(_ sender: UIButton) {
        print ("운동 완료 버튼 탭")
        
        let alert = UIAlertController(title: "운동하기 종료", message: "종료를 누르면 타이머가 초기화됩니다.\n운동을 종료하시겠습니까?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: { (_) in }))
        alert.addAction(UIAlertAction(title: "종료", style: .default, handler: { (_) in
            
            self.exerciseStopwatch.counter = 0
            self.exerciseStopwatch.isStarted = false
            self.exerciseStopwatch.timer?.invalidate() // 타이머를 중지하는 invalidate 호출
            self.mainView.exerciseTimeLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.mainView.exerciseTimeLabel.textColor = .lightGray
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @objc func studyStartButtonTapped(_ sender: UIButton) {
        print ("공부 시작 버튼 탭")
        
        var isStarted = studyStopwatch.isStarted
        
        // 타이머가 생성되어 있는지 확인
        if studyStopwatch.timer == nil {
            createStudyTimer()
        }
        isStarted = !isStarted
        if(isStarted){
            mainView.studyTimeLabel.textColor = .black
        } else {
            mainView.studyTimeLabel.textColor = .lightGray
        }
    }
    
    @objc func updateExerciseTimeCounting() -> Void {
        exerciseStopwatch.counter = exerciseStopwatch.counter + 1
        
        let time = secondsToHoursMinitesSeconds(seconds: exerciseStopwatch.counter)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        
        DispatchQueue.main.async {
            self.mainView.exerciseTimeLabel.text = timeString
        }
    }
    
    @objc func updateStudyTimeCounting() -> Void {
        studyStopwatch.counter = studyStopwatch.counter + 1
        
        let time = secondsToHoursMinitesSeconds(seconds: studyStopwatch.counter)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        
        DispatchQueue.main.async {
            self.mainView.studyTimeLabel.text = timeString
        }
    }
    
    
    
    
    //MARK: - Setting:: Stopwatch
    
    private func setStopwatchButtons(){
        startExerciseStopwatch()
        stopExerciseStopwatch()
        doneExerciseStopwatch()
        
        startStudyStopwatch()
        
    }
    
    private func startExerciseStopwatch() {
        mainView.exerciseStartButton.addTarget(self, action: #selector(exerciseStartButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func stopExerciseStopwatch() {
        mainView.exerciseStopButton.addTarget(self, action: #selector(exerciseStopButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func doneExerciseStopwatch(){
        mainView.exerciseDoneButton.addTarget(self, action: #selector(exerciseDoneButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    
    
    
    
    
    private func startStudyStopwatch() {
        mainView.studyStartButton.addTarget(self, action: #selector(studyStartButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    
    
    
    
    
    
    private func secondsToHoursMinitesSeconds(seconds: Int) -> (Int, Int, Int) {
        // 초에서 시간 : 분 : 초로 바꾸어주는 함수
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    private func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        // 초에서 시간, 분, 초로 바꾼 숫자를 문자열 형태로 변환해주는 함수
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += String(format: ":%02d", minutes)
        timeString += String(format: ":%02d", seconds)
        
        return timeString // hours : minutes : seconds 형태로 출력
    }
    
    private func createExerciseTimer(){
        // 운동용 타이머 생성
        exerciseStopwatch.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateExerciseTimeCounting), userInfo: nil, repeats: true)
    }
    
    private func createStudyTimer(){
        // 공부용 타이머 생성
        studyStopwatch.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateStudyTimeCounting), userInfo: nil, repeats: true)
    }
    
    
    //MARK: - Settings
    
    
    
    
}
