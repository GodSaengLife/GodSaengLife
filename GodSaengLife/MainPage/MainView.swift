//
//  Main.swift
//  GodSaengLife
//
//  Created by t2023-m0045 on 2023/09/26.
//

import UIKit

class MainView: UIView {
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    //MARK: - Properties
    
    lazy var safeArea = safeAreaLayoutGuide
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 55 / 2
        imageView.layer.borderWidth = 0.2
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "김홍식님!"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        
        return label
    }()
    
    let userRandomLabel: UILabel = {
        let label = UILabel()
        label.text = "한번쯤은 갓생 살아보셔야죠?"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        return label
    }()
    
    let todayQuoteTitleLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: "NanumMyeongjoOTFBold", size: 14)
        
        label.text = "오늘의 한줄"
        label.font = font
        label.textColor = .gray
        label.textAlignment = .center
        
        return label
    }()
    
    let todayQuoteSentenceLabel: UILabel = {
        let label = UILabel()
        let text = quotes.randomElement()
        // 폰트 변경
        let font = UIFont(name: "NanumMyeongjoOTF", size: 13)
        
        // 행간 조절
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4
        
        // 폰트 스타일 적용
        let attributedText = NSMutableAttributedString(string: text!)
        attributedText.addAttribute(.paragraphStyle, value: style, range: NSMakeRange(0, attributedText.length))
        attributedText.addAttribute(.font, value: font as Any, range: NSMakeRange(0, attributedText.length))
        
        label.attributedText = attributedText
        label.numberOfLines = 2
        label.textColor = .gray
        label.textAlignment = .center
        
        return label
    }()
    
    let todayQuoteBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(named: "QuoteBackgroundImage")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(named: "Main Color 3")?.cgColor
       
        return imageView
    }()
    
    
    //MARK: - Property WakeUp
    
    let wakeUpTimeBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "Main Color 3")?.cgColor
        
        return view
    }()
    
    let wakeUpTimeSettingButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.tintColor = .systemGray

        return button
    }()
    
    let wakeUpTimeViewDivider: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "Main Color 3")?.cgColor
        
        return view
    }()
    
    let wakeUpTimeSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "갓생러의 아침"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    let wakeUpTimeSectionSemiTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "갓생살기 별거 없죠? 너무 잘하고 있습니다!"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        return label
    }()
    
    let wakeUpTimeIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "alarm")
        icon.layer.cornerRadius = 20
        icon.tintColor = .systemBlue
        
        return icon
    }()
    
    let wakeUpTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 44, weight: .thin)
        
        return label
    }()
    
    let wakeUpTimeMeridiemLabel: UILabel = {
        let label = UILabel()
        label.text = "오전"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
        return label
    }()
    
    let setAWakeUpTimeNotiLabel: UILabel = {
        let label = UILabel()
        label.text = "목표 기상 시간"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        
        return label
    }()
    
    let alarmSwitchButton: UISwitch = {
        let button = UISwitch()
        button.isOn = true
        
        return button
    }()
    
    
    //MARK: - Property Exercise
    
    let exerciseTimeBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "Main Color 3")?.cgColor
        
        return view
    }()
    
    lazy var exerciseTimeSettingButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.tintColor = .systemGray
        
        return button
    }()
    
    let exerciseTimeViewDivider: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "Main Color 3")?.cgColor
        
        return view
    }()
    
    lazy var  exerciseStartButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(UIColor.systemCyan, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemCyan.withAlphaComponent(0.5).cgColor
        
        return button
    }()
    
    let exerciseStopButton: UIButton = {
        let button = UIButton()
        button.setTitle("정지", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemRed.withAlphaComponent(0.3).cgColor
        
        return button
    }()
    
    let exerciseDoneButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.withAlphaComponent(0.4).cgColor
        
        return button
    }()
    
    let exerciseTimeIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "figure.run")
        icon.layer.cornerRadius = 20
        icon.tintColor = .systemBlue
       
        return icon
    }()
    
    let exerciseTimeSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "운동하기"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    let exerciseSetTheTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "운동 목표 시간"
        label.textColor = .darkGray
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.3
        label.layer.borderColor = UIColor.systemGray.cgColor
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
       
        return label
    }()
    
    let exerciseTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 44, weight: .thin)
        
        return label
    }()
    
    
    //MARK: - Property Study
    
    let studyTimeBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "Main Color 3")?.cgColor
        
        return view
    }()
    
    let studyTimeViewDivider: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "Main Color 3")?.cgColor
        
        return view
    }()
    
    let studyTimeIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "book.closed")
        icon.layer.cornerRadius = 20
        icon.tintColor = .systemBlue
        
        return icon
    }()
    
    let studyTimeSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "공부하기"
        label.textAlignment = .left
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    let studySetTheTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "공부 목표 시간"
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.3
        label.layer.borderColor = UIColor.systemGray.cgColor
       
        return label
    }()
    
    let studyTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 44, weight: .thin)
        
        return label
    }()
    let studyTimeSettingButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.tintColor = .systemGray
    
        return button
    }()
    
    let studyStartButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(UIColor.systemCyan, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemCyan.withAlphaComponent(0.5).cgColor
        
        return button
    }()
    
    let studyStopButton: UIButton = {
        let button = UIButton()
        button.setTitle("정지", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(UIColor.systemRed, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemRed.withAlphaComponent(0.3).cgColor
        
        return button
    }()
    
    let studyDoneButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.withAlphaComponent(0.4).cgColor
        
        return button
    }()
    
    //MARK: - UI
    
    func configureUI(){
        configureUser()
        configureWakeupTime()
        configureExerciseTime()
        configureStudyTime()
    }
    
    //MARK: - User
    
    func configureUser(){
        configureUserProfileImage()
        configureUserNameLabel()
        configureUserRandomLabel()
        configureTodayQoiteBackgroundImage()
        configureTodayQuoteTitleLabel()
        configureTodayQuoteSentenceLabel()
    }
    
    func configureUserProfileImage(){
        addSubview(userProfileImageView)
        
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userProfileImageView.widthAnchor.constraint(equalToConstant: 55),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 55),
            userProfileImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            userProfileImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10)
        ])
    }
    
    func configureUserNameLabel(){
        addSubview(userNameLabel)
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.widthAnchor.constraint(equalToConstant: 200),
            userNameLabel.heightAnchor.constraint(equalToConstant: 25),
            userNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 23),
            userNameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15)
        ])
    }
    
    func configureUserRandomLabel(){
        addSubview(userRandomLabel)
        
        userRandomLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userRandomLabel.widthAnchor.constraint(equalToConstant: 200),
            userRandomLabel.heightAnchor.constraint(equalToConstant: 20),
            userRandomLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            userRandomLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 48)
        ])
    }
    
    func configureTodayQoiteBackgroundImage(){
        addSubview(todayQuoteBackgroundImageView)
        
        todayQuoteBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayQuoteBackgroundImageView.widthAnchor.constraint(equalToConstant: 360),
            todayQuoteBackgroundImageView.heightAnchor.constraint(equalToConstant: 90),
            todayQuoteBackgroundImageView.topAnchor.constraint(equalTo: userRandomLabel.bottomAnchor, constant: 20),
            todayQuoteBackgroundImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureTodayQuoteTitleLabel(){
        addSubview(todayQuoteTitleLabel)
        
        todayQuoteTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayQuoteTitleLabel.widthAnchor.constraint(equalToConstant: 360),
            todayQuoteTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            todayQuoteTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 105),
            todayQuoteTitleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureTodayQuoteSentenceLabel(){
        addSubview(todayQuoteSentenceLabel)
        
        todayQuoteSentenceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayQuoteSentenceLabel.widthAnchor.constraint(equalToConstant: 325),
            todayQuoteSentenceLabel.heightAnchor.constraint(equalToConstant: 34),
            todayQuoteSentenceLabel.topAnchor.constraint(equalTo: todayQuoteTitleLabel.bottomAnchor, constant: 6),
            todayQuoteSentenceLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    
    //MARK: - WakeUp
    
    func configureWakeupTime(){
        configureWakeUpTimeBackgroundView()
        configureWakeUpSettingButton()
        configureWakeUpTimeViewDivider()
        configureWakeUpTimeSectionTitleLabel()
        configureWakeUpTimeSectionSemiTitleLabel()
        configureAlarmSwitchButton()
        configureSetAWakeUpTimeNotiLabel()
        configureWakeUpTimeLabel()
        configureWakeUpTimeMeridiemLabel()
        configureWakeUpTimeIcon()
    }
    
    func configureWakeUpTimeBackgroundView(){
        addSubview(wakeUpTimeBackgroundView)
        
        wakeUpTimeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeBackgroundView.widthAnchor.constraint(equalToConstant: 360),
            wakeUpTimeBackgroundView.heightAnchor.constraint(equalToConstant: 160),
            wakeUpTimeBackgroundView.topAnchor.constraint(equalTo: todayQuoteBackgroundImageView.bottomAnchor, constant: 10),
            wakeUpTimeBackgroundView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureWakeUpSettingButton(){
        addSubview(wakeUpTimeSettingButton)
        
        wakeUpTimeSettingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeSettingButton.widthAnchor.constraint(equalToConstant: 20),
            wakeUpTimeSettingButton.heightAnchor.constraint(equalToConstant: 20),
            wakeUpTimeSettingButton.topAnchor.constraint(equalTo: todayQuoteBackgroundImageView.bottomAnchor, constant: 25),
            wakeUpTimeSettingButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -35)
            ])
    }
    
    func configureWakeUpTimeViewDivider(){
        addSubview(wakeUpTimeViewDivider)
        
        wakeUpTimeViewDivider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeViewDivider.widthAnchor.constraint(equalToConstant: 330),
            wakeUpTimeViewDivider.heightAnchor.constraint(equalToConstant: 2),
            wakeUpTimeViewDivider.topAnchor.constraint(equalTo: todayQuoteBackgroundImageView.bottomAnchor, constant: 75),
            wakeUpTimeViewDivider.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureWakeUpTimeIcon(){
        addSubview(wakeUpTimeIcon)
        
        wakeUpTimeIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeIcon.widthAnchor.constraint(equalToConstant: 35),
            wakeUpTimeIcon.heightAnchor.constraint(equalToConstant: 35),
            wakeUpTimeIcon.topAnchor.constraint(equalTo: todayQuoteBackgroundImageView.bottomAnchor, constant: 27),
            wakeUpTimeIcon.leadingAnchor.constraint(equalTo: todayQuoteBackgroundImageView.leadingAnchor, constant: 17)
        ])
    }
    
    func configureWakeUpTimeSectionTitleLabel(){
        addSubview(wakeUpTimeSectionTitleLabel)
        
        wakeUpTimeSectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeSectionTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            wakeUpTimeSectionTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            wakeUpTimeSectionTitleLabel.topAnchor.constraint(equalTo: todayQuoteBackgroundImageView.bottomAnchor, constant: 25),
            wakeUpTimeSectionTitleLabel.leadingAnchor.constraint(equalTo: todayQuoteBackgroundImageView.leadingAnchor, constant: 65)
        ])
    }
    
    func configureWakeUpTimeSectionSemiTitleLabel(){
        addSubview(wakeUpTimeSectionSemiTitleLabel)
        
        wakeUpTimeSectionSemiTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeSectionSemiTitleLabel.widthAnchor.constraint(equalToConstant: 300),
            wakeUpTimeSectionSemiTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            wakeUpTimeSectionSemiTitleLabel.topAnchor.constraint(equalTo: todayQuoteBackgroundImageView.bottomAnchor, constant: 45),
            wakeUpTimeSectionSemiTitleLabel.leadingAnchor.constraint(equalTo: todayQuoteBackgroundImageView.leadingAnchor, constant: 65)
        ])
    }
    
    func configureSetAWakeUpTimeNotiLabel(){
        addSubview(setAWakeUpTimeNotiLabel)
        
        setAWakeUpTimeNotiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            setAWakeUpTimeNotiLabel.widthAnchor.constraint(equalToConstant: 250),
            setAWakeUpTimeNotiLabel.heightAnchor.constraint(equalToConstant: 15),
            setAWakeUpTimeNotiLabel.topAnchor.constraint(equalTo: wakeUpTimeViewDivider.bottomAnchor, constant: 14),
            setAWakeUpTimeNotiLabel.leadingAnchor.constraint(equalTo: todayQuoteBackgroundImageView.leadingAnchor, constant: 20)
        ])
    }
    
    func configureAlarmSwitchButton(){
        addSubview(alarmSwitchButton)
        
        alarmSwitchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            alarmSwitchButton.topAnchor.constraint(equalTo: wakeUpTimeViewDivider.bottomAnchor, constant: 38),
            alarmSwitchButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -38)
        ])
    }
    
    func configureWakeUpTimeLabel(){
        addSubview(wakeUpTimeLabel)
        
        wakeUpTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeLabel.widthAnchor.constraint(equalToConstant: 115),
            wakeUpTimeLabel.heightAnchor.constraint(equalToConstant: 35),
            wakeUpTimeLabel.topAnchor.constraint(equalTo: setAWakeUpTimeNotiLabel.bottomAnchor, constant: 7),
            wakeUpTimeLabel.leadingAnchor.constraint(equalTo: todayQuoteBackgroundImageView.leadingAnchor, constant: 18)
        ])
    }
    
    func configureWakeUpTimeMeridiemLabel(){
        addSubview(wakeUpTimeMeridiemLabel)
        
        wakeUpTimeMeridiemLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeMeridiemLabel.widthAnchor.constraint(equalToConstant: 30),
            wakeUpTimeMeridiemLabel.heightAnchor.constraint(equalToConstant: 16),
            wakeUpTimeMeridiemLabel.topAnchor.constraint(equalTo: wakeUpTimeLabel.topAnchor),
            wakeUpTimeMeridiemLabel.leadingAnchor.constraint(equalTo: wakeUpTimeLabel.trailingAnchor, constant: 2)
        ])
    }
    
    
    //MARK: - Exercise
    
    func configureExerciseTime(){
        configureExerciseTimeBackgroundView()
        configureExerciseTimeViewDivider()
        configureExerciseTimeIcon()
        configureExerciseSectionTitleLabel()
        configureExerciseTimeLabel()
        configureExerciseSetTheTimeLabel()
        configureExerciseSettingButton()
        configureExerciseStartButton()
        configureExerciseStopButton()
        configureExerciseDoneButton()
    }
    
    func configureExerciseTimeBackgroundView(){
        addSubview(exerciseTimeBackgroundView)
        
        exerciseTimeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeBackgroundView.widthAnchor.constraint(equalToConstant: 360),
            exerciseTimeBackgroundView.heightAnchor.constraint(equalToConstant: 158),
            exerciseTimeBackgroundView.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 10),
            exerciseTimeBackgroundView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureExerciseTimeViewDivider(){
        addSubview(exerciseTimeViewDivider)
        
        exerciseTimeViewDivider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeViewDivider.widthAnchor.constraint(equalToConstant: 330),
            exerciseTimeViewDivider.heightAnchor.constraint(equalToConstant: 2),
            exerciseTimeViewDivider.topAnchor.constraint(equalTo: exerciseTimeBackgroundView.bottomAnchor, constant: -65),
            exerciseTimeViewDivider.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureExerciseTimeIcon(){
        addSubview(exerciseTimeIcon)
        
        exerciseTimeIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeIcon.widthAnchor.constraint(equalToConstant: 35),
            exerciseTimeIcon.heightAnchor.constraint(equalToConstant: 35),
            exerciseTimeIcon.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 27),
            exerciseTimeIcon.leadingAnchor.constraint(equalTo: wakeUpTimeBackgroundView.leadingAnchor, constant: 17)
        ])
    }
    
    func configureExerciseSectionTitleLabel(){
        addSubview(exerciseTimeSectionTitleLabel)
        
        exerciseTimeSectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeSectionTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            exerciseTimeSectionTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            exerciseTimeSectionTitleLabel.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 25),
            exerciseTimeSectionTitleLabel.leadingAnchor.constraint(equalTo: exerciseTimeIcon.trailingAnchor, constant: 10)
        ])
    }

    func configureExerciseSetTheTimeLabel(){
        addSubview(exerciseSetTheTimeLabel)
        
        exerciseSetTheTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseSetTheTimeLabel.widthAnchor.constraint(equalToConstant: 100),
            exerciseSetTheTimeLabel.heightAnchor.constraint(equalToConstant: 20),
            exerciseSetTheTimeLabel.topAnchor.constraint(equalTo: exerciseTimeBackgroundView.topAnchor, constant: 14),
            exerciseSetTheTimeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }

    func configureExerciseSettingButton(){
        addSubview(exerciseTimeSettingButton)
        
        exerciseTimeSettingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeSettingButton.widthAnchor.constraint(equalToConstant: 20),
            exerciseTimeSettingButton.heightAnchor.constraint(equalToConstant: 20),
            exerciseTimeSettingButton.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 25),
            exerciseTimeSettingButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -35)
        ])
    }
    
    func configureExerciseTimeLabel(){
        addSubview(exerciseTimeLabel)
        
        exerciseTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeLabel.widthAnchor.constraint(equalToConstant: 300),
            exerciseTimeLabel.heightAnchor.constraint(equalToConstant: 32),
            exerciseTimeLabel.topAnchor.constraint(equalTo: exerciseTimeSectionTitleLabel.bottomAnchor, constant: 13),
            exerciseTimeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureExerciseStartButton(){
        addSubview(exerciseStartButton)
        
        exerciseStartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseStartButton.widthAnchor.constraint(equalToConstant: 105),
            exerciseStartButton.heightAnchor.constraint(equalToConstant: 35),
            exerciseStartButton.topAnchor.constraint(equalTo: exerciseTimeBackgroundView.bottomAnchor, constant: -50),
            exerciseStartButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32)
        ])
    }
    
    func configureExerciseStopButton(){
        addSubview(exerciseStopButton)
        
        exerciseStopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseStopButton.widthAnchor.constraint(equalToConstant: 105),
            exerciseStopButton.heightAnchor.constraint(equalToConstant: 35),
            exerciseStopButton.topAnchor.constraint(equalTo: exerciseTimeBackgroundView.bottomAnchor, constant: -50),
            exerciseStopButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureExerciseDoneButton(){
        addSubview(exerciseDoneButton)
        
        exerciseDoneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseDoneButton.widthAnchor.constraint(equalToConstant: 105),
            exerciseDoneButton.heightAnchor.constraint(equalToConstant: 35),
            exerciseDoneButton.topAnchor.constraint(equalTo: exerciseTimeBackgroundView.bottomAnchor, constant: -50),
            exerciseDoneButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32)
        ])
    }
    
    
    
    //MARK: - Study
    
    func configureStudyTime(){
        configureStudyTimeBackgroundView()
        configureStudyTimeViewDivider()
        configureStudyTimeIcon()
        configureStudySetTimeLabel()
        configureStudyTimeLabel()
        configureStudySettingButton()
        configureStudySectionTitleLabel()
        configureStudyStartButton()
        configureStudyStopButton()
        configureStudyDoneButton()
    }
    
    func configureStudyTimeBackgroundView(){
        addSubview(studyTimeBackgroundView)
        
        studyTimeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studyTimeBackgroundView.widthAnchor.constraint(equalToConstant: 360),
            studyTimeBackgroundView.heightAnchor.constraint(equalToConstant: 158),
            studyTimeBackgroundView.topAnchor.constraint(equalTo: exerciseTimeBackgroundView.bottomAnchor, constant: 10),
            studyTimeBackgroundView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureStudyTimeViewDivider(){
        addSubview(studyTimeViewDivider)
        
        studyTimeViewDivider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studyTimeViewDivider.widthAnchor.constraint(equalToConstant: 330),
            studyTimeViewDivider.heightAnchor.constraint(equalToConstant: 2),
            studyTimeViewDivider.topAnchor.constraint(equalTo: studyTimeBackgroundView.bottomAnchor, constant: -65),
            studyTimeViewDivider.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureStudyTimeIcon(){
        addSubview(studyTimeIcon)
        
        studyTimeIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studyTimeIcon.widthAnchor.constraint(equalToConstant: 35),
            studyTimeIcon.heightAnchor.constraint(equalToConstant: 35),
            studyTimeIcon.topAnchor.constraint(equalTo: exerciseTimeBackgroundView.bottomAnchor, constant: 27),
            studyTimeIcon.leadingAnchor.constraint(equalTo: exerciseTimeBackgroundView.leadingAnchor, constant: 17)
        ])
    }
    
    func configureStudySectionTitleLabel(){
        addSubview(studyTimeSectionTitleLabel)
        
        studyTimeSectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studyTimeSectionTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            studyTimeSectionTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            studyTimeSectionTitleLabel.topAnchor.constraint(equalTo: exerciseTimeBackgroundView.bottomAnchor, constant: 25),
            studyTimeSectionTitleLabel.leadingAnchor.constraint(equalTo: studyTimeIcon.trailingAnchor, constant: 10)
        ])
    }
    
    func configureStudySetTimeLabel(){
        addSubview(studySetTheTimeLabel)
        
        studySetTheTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studySetTheTimeLabel.widthAnchor.constraint(equalToConstant: 100),
            studySetTheTimeLabel.heightAnchor.constraint(equalToConstant: 20),
            studySetTheTimeLabel.topAnchor.constraint(equalTo: studyTimeBackgroundView.topAnchor, constant: 14),
            studySetTheTimeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureStudyTimeLabel(){
        addSubview(studyTimeLabel)
        
        studyTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studyTimeLabel.widthAnchor.constraint(equalToConstant: 200),
            studyTimeLabel.heightAnchor.constraint(equalToConstant: 32),
            studyTimeLabel.bottomAnchor.constraint(equalTo: studySetTheTimeLabel.bottomAnchor, constant: 45),
            studyTimeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureStudySettingButton(){
        addSubview(studyTimeSettingButton)
        
        studyTimeSettingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studyTimeSettingButton.widthAnchor.constraint(equalToConstant: 20),
            studyTimeSettingButton.heightAnchor.constraint(equalToConstant: 20),
            studyTimeSettingButton.topAnchor.constraint(equalTo: exerciseTimeBackgroundView.bottomAnchor, constant: 25),
            studyTimeSettingButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -35)
        ])
    }
    
    func configureStudyStartButton(){
        addSubview(studyStartButton)
        
        studyStartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studyStartButton.widthAnchor.constraint(equalToConstant: 105),
            studyStartButton.heightAnchor.constraint(equalToConstant: 35),
            studyStartButton.topAnchor.constraint(equalTo: studyTimeBackgroundView.bottomAnchor, constant: -50),
            studyStartButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32)
        ])
    }
    
    func configureStudyStopButton(){
        addSubview(studyStopButton)
        
        studyStopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studyStopButton.widthAnchor.constraint(equalToConstant: 105),
            studyStopButton.heightAnchor.constraint(equalToConstant: 35),
            studyStopButton.topAnchor.constraint(equalTo: studyTimeBackgroundView.bottomAnchor, constant: -50),
            studyStopButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureStudyDoneButton(){
        addSubview(studyDoneButton)
        
        studyDoneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studyDoneButton.widthAnchor.constraint(equalToConstant: 105),
            studyDoneButton.heightAnchor.constraint(equalToConstant: 35),
            studyDoneButton.topAnchor.constraint(equalTo: studyTimeBackgroundView.bottomAnchor, constant: -50),
            studyDoneButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32)
        ])
    }
}
