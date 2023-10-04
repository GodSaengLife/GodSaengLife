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
        stopwatchButtonisEnabaled()
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
        pageSheet?.detents = [.medium()] // Sheet의 멈추는 높이 :: 절반 높이에서 멈춤
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
    
    
    //MARK: - Settings :: Stopwatch
    
    // 초기에 완료 버튼 비활성화
    private func stopwatchButtonisEnabaled(){
        mainView.exerciseStopButton.isEnabled = false
        mainView.exerciseDoneButton.isEnabled = false
        mainView.studyStopButton.isEnabled = false
        mainView.studyDoneButton.isEnabled = false
    }
    
    // 운동용 타이머 생성
    private func createExerciseTimer(){
        exerciseStopwatch.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateExerciseTimeCounting), userInfo: nil, repeats: true)
    }
    
    // 공부용 타이머 생성
    private func createStudyTimer(){
        studyStopwatch.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateStudyTimeCounting), userInfo: nil, repeats: true)
    }
    
    // 초에서 시간 : 분 : 초로 바꾸어주는 함수
    private func secondsToHoursMinitesSeconds(seconds: Int) -> (Int, Int, Int) {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    // 초에서 시간, 분, 초로 바꾼 숫자를 문자열 형태로 변환해주는 함수
    private func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += String(format: ":%02d", minutes)
        timeString += String(format: ":%02d", seconds)
        
        return timeString // hours : minutes : seconds 형태로 출력
    }
    
    // 스톱워치 버튼 세팅
    private func setStopwatchButtons(){
        startExerciseStopwatch()
        stopExerciseStopwatch()
        doneExerciseStopwatch()
        
        startStudyStopwatch()
        stopStudyStopwatch()
        doneStudyStopwatch()
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
    
    private func stopStudyStopwatch() {
        mainView.studyStopButton.addTarget(self, action: #selector(studyStopButtonTapped(_:)), for: .touchUpInside)
    }
    
    private func doneStudyStopwatch(){
        mainView.studyDoneButton.addTarget(self, action: #selector(studyDoneButtonTapped(_:)), for: .touchUpInside)
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
        // moveVC.setInfomation(DataManager.shared.getExerciseInfo())
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
        // moveVC.setInfomation(DataManager.shared.getStudyInfo())
        moveVC.onTimeSelected = { [weak self] (selectedTime, selectedMeridiem)  in
            self?.selectedTime = selectedTime
            
            let formattedTime = "\(selectedTime)"
            self?.mainView.studySetTheTimeLabel.text = formattedTime
        }
        showTimeSettingView(moveVC)
    }
    
    
    //MARK: - Actions :: Exercise Stopwatch
    
    @objc func updateExerciseTimeCounting() -> Void {
        exerciseStopwatch.counter = exerciseStopwatch.counter + 1
        
        let time = secondsToHoursMinitesSeconds(seconds: exerciseStopwatch.counter)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        
        print("timeString: \(timeString), selectedTime: \(selectedTime)")
        
        // 설정된 시간과 타이머 시간이 동일한 경우 텍스트 컬러 변경
        if timeString == selectedTime {
            mainView.exerciseSetTheTimeLabel.text = "목표 달성!"
            mainView.exerciseSetTheTimeLabel.textColor = .gray
            mainView.exerciseSetTheTimeLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
            
            mainView.exerciseDoneButton.isEnabled = true
            mainView.exerciseDoneButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.4).cgColor
            mainView.exerciseDoneButton.setTitleColor(UIColor.systemBlue, for: .normal)
        }
        DispatchQueue.main.async {
            self.mainView.exerciseTimeLabel.text = timeString
        }
    }
    
    @objc func exerciseStartButtonTapped(_ sender: UIButton) {
        print ("운동 시작 버튼 탭")
        
        // 운동시간이 설정되어 있는지 확인
        if selectedTime.isEmpty {
            let alert = UIAlertController(title: "운동 시간 미설정", message: "운동 시간을 먼저 설정해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (_) in
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            // 운동시간이 설정되어 있는 경우 타이머 작동
            if exerciseStopwatch.timer == nil || !exerciseStopwatch.isStarted {
                createExerciseTimer()
                exerciseStopwatch.isStarted = true
                mainView.exerciseStopButton.isEnabled = true
                mainView.exerciseTimeSettingButton.isEnabled = false
                mainView.exerciseTimeLabel.textColor = .black
            }
        }
    }
    
    @objc func exerciseStopButtonTapped(_ sender: UIButton) {
        print ("운동 정지 버튼 탭")
        if exerciseStopwatch.isStarted {
            exerciseStopwatch.isStarted = false
            exerciseStopwatch.timer?.invalidate()
            mainView.exerciseTimeLabel.textColor = UIColor(named: "Main Color 4")
        }
    }
    
    @objc func exerciseDoneButtonTapped(_ sender: UIButton) {
        print ("운동 완료 버튼 탭")
        
        let alert = UIAlertController(title: "운동하기 종료", message: "완료를 누르면 운동한 시간이 초기화됩니다.\n운동을 종료하시겠습니까?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "종료", style: .default, handler: { (_) in
            self.exerciseStopwatch.counter = 0
            self.exerciseStopwatch.isStarted = false
            self.exerciseStopwatch.timer?.invalidate() // 타이머를 중지하는 invalidate 호출
            
            self.mainView.exerciseTimeLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.mainView.exerciseTimeLabel.textColor = .lightGray
    
            self.mainView.exerciseSetTheTimeLabel.text = "운동 목표 시간"
            self.mainView.exerciseSetTheTimeLabel.textColor = .lightGray
            self.mainView.exerciseSetTheTimeLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
            
            self.mainView.exerciseTimeSettingButton.isEnabled = true
            self.mainView.exerciseDoneButton.isEnabled = false
            
            self.mainView.exerciseDoneButton.layer.borderColor = UIColor.gray.withAlphaComponent(0.4).cgColor
            self.mainView.exerciseDoneButton.setTitleColor(UIColor.gray, for: .normal)
        }))
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: { (_) in }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Actions :: Study Stopwatch
    
    @objc func updateStudyTimeCounting() -> Void {
        studyStopwatch.counter = studyStopwatch.counter + 1
        
        let time = secondsToHoursMinitesSeconds(seconds: studyStopwatch.counter)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        
        print("timeString: \(timeString), selectedTime: \(selectedTime)")
        
        // 설정된 시간과 타이머 시간이 동일한 경우 텍스트 컬러 변경
        if timeString == selectedTime {
            //            mainView.studyTimeLabel.textColor = .systemBlue
            mainView.studySetTheTimeLabel.text = "목표 달성!"
            mainView.studySetTheTimeLabel.textColor = .gray
            mainView.studySetTheTimeLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
           
            mainView.studyDoneButton.isEnabled = true
            mainView.studyDoneButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.4).cgColor
            mainView.studyDoneButton.setTitleColor(UIColor.systemBlue, for: .normal)
        }
        DispatchQueue.main.async {
            self.mainView.studyTimeLabel.text = timeString
        }
    }
    
    @objc func studyStartButtonTapped(_ sender: UIButton) {
        print ("공부 시작 버튼 탭")
        
        // 공부시간이 설정되어 있는지 확인
        if selectedTime.isEmpty {
            let alert = UIAlertController(title: "공부 시간 미설정", message: "공부 시간을 먼저 설정해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (_) in
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            // 공부시간이 설정되어 있는 경우 타이머 작동
            if studyStopwatch.timer == nil || !studyStopwatch.isStarted {
                createStudyTimer()
                studyStopwatch.isStarted = true
                mainView.studyStopButton.isEnabled = true
                mainView.studyTimeSettingButton.isEnabled = false
                mainView.studyTimeLabel.textColor = .black
            }
        }
    }
    
    @objc func studyStopButtonTapped(_ sender: UIButton) {
        print ("공부 정지 버튼 탭")
        if studyStopwatch.isStarted {
            studyStopwatch.isStarted = false
            studyStopwatch.timer?.invalidate()
            mainView.studyTimeLabel.textColor = UIColor(named: "Main Color 4")
        }
    }
    
    @objc func studyDoneButtonTapped(_ sender: UIButton) {
        print ("공부 완료 버튼 탭")
        let alert = UIAlertController(title: "공부하기 완료", message: "완료를 누르면 공부한 시간이 초기화됩니다.\n공부를 종료하시겠습니까?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "완료", style: .default, handler: { (_) in
            self.studyStopwatch.counter = 0
            self.studyStopwatch.isStarted = false
            self.studyStopwatch.timer?.invalidate() // 타이머를 중지하는 invalidate 호출
            
            self.mainView.studyTimeLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.mainView.studyTimeLabel.textColor = .lightGray
            
            self.mainView.studySetTheTimeLabel.text = "공부 목표 시간"
            self.mainView.studySetTheTimeLabel.textColor = .lightGray
            self.mainView.studySetTheTimeLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
           
            self.mainView.studyTimeSettingButton.isEnabled = true
            self.mainView.studyDoneButton.isEnabled = false
            
            self.mainView.studyDoneButton.layer.borderColor = UIColor.gray.withAlphaComponent(0.4).cgColor
            self.mainView.studyDoneButton.setTitleColor(UIColor.gray, for: .normal)
        }))
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: { (_) in }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
