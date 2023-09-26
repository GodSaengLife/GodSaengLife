//
//  Main.swift
//  GodSaengLife
//
//  Created by t2023-m0045 on 2023/09/26.
//

import UIKit

class MainView: UIView {
    
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
    
    let userRandomMentLabel: UILabel = {
        let label = UILabel()
        label.text = "한번쯤은 갓생 살아보셔야죠?"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        
        return label
    }()
    
    let todayQuoteTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 한줄"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12.5, weight: .regular)
        
        return label
    }()
    
    let todayQuoteSentenceLabel: UILabel = {
        let label = UILabel()
        label.text = "인생에서 한계는 없습니다.\n여러분 자신이 만드는 한계만 제외한다면..."
        label.numberOfLines = 2
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        return label
    }()
    
    let todayQuoteBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "QuoteBackgroundImage")
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor(named: "Main Color 3")?.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
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
    
    let wakeUpTimeViewDivider: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(named: "Main Color 3")?.cgColor
        
        return view
    }()
    
    let wakeUpTimeSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "기상 시간"
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
//        let imageConfig = UIImage.SymbolConfiguration(pointSize: 10, weight: .light)
        icon.image = UIImage(systemName: "alarm")
        icon.layer.cornerRadius = 20
        icon.tintColor = .systemBlue
        icon.backgroundColor = .systemBlue.withAlphaComponent(0.15)
        
        return icon
    }()
    
    let wakeUpTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "05:35"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 38, weight: .semibold)
        
        return label
    }()
    
    let wakeUpTimeMeridiemLabel: UILabel = {
        let label = UILabel()
        label.text = "AM"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        return label
    }()
    
    let todayWakeUpTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "The Time Woke Up Today"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
        return label
    }()
    
    let thumbsUpIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "hand.thumbsup")
        icon.tintColor = .systemBlue
        icon.layer.cornerRadius = 12
//        icon.layer.borderWidth = 1
//        icon.layer.borderColor = UIColor.systemBlue.cgColor
        
        return icon
    }()
    
    let wakeUpMissionSuccessCheckLabel: UILabel = {
        let label = UILabel()
        label.text = "미션 성공!"
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.backgroundColor = .systemBlue.withAlphaComponent(0.2)
        
        return label
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

    let exerciseStartButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8

        return button
    }()
    
    let exerciseStopButton: UIButton = {
        let button = UIButton()
        button.setTitle("정지", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.tintColor = .white
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8

        return button
    }()
    
    let exerciseDoneButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.tintColor = .white
        button.backgroundColor = .lightGray.withAlphaComponent(0.5)
        button.layer.cornerRadius = 8

        return button
    }()
    
    let exerciseTimeIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "figure.run")
        icon.layer.cornerRadius = 20
        icon.tintColor = .systemBlue
        icon.backgroundColor = .systemBlue.withAlphaComponent(0.15)
//        icon.tintColor = .white
//        icon.backgroundColor = .systemBlue
        
        return icon
    }()
    
    let exerciseTimeSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "운동 시간"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    let exerciseTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 44, weight: .semibold)
        
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

    let studyStartButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8

        return button
    }()
    
    let studyStopButton: UIButton = {
        let button = UIButton()
        button.setTitle("정지", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.tintColor = .white
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8

        return button
    }()
    
    let studyDoneButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.tintColor = .white
        button.backgroundColor = .lightGray.withAlphaComponent(0.5)
        button.layer.cornerRadius = 8

        return button
    }()
    
    let studyTimeIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "book.closed")
        icon.layer.cornerRadius = 20
        icon.tintColor = .systemBlue
        icon.backgroundColor = .systemBlue.withAlphaComponent(0.15)
//        icon.tintColor = .white
//        icon.backgroundColor = .systemBlue
        
        return icon
    }()
    
    let studyTimeSectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "공부 시간"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        return label
    }()
    
    let studyTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.textColor = .lightGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 44, weight: .semibold)
        
        return label
    }()
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
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
        configureUserRandomMentLabel()
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
    
    func configureUserRandomMentLabel(){
        addSubview(userRandomMentLabel)
        
        userRandomMentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userRandomMentLabel.widthAnchor.constraint(equalToConstant: 200),
            userRandomMentLabel.heightAnchor.constraint(equalToConstant: 20),
            userRandomMentLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            userRandomMentLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 48)
        ])
    }
    
    func configureTodayQoiteBackgroundImage(){
        addSubview(todayQuoteBackgroundImageView)

        todayQuoteBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayQuoteBackgroundImageView.widthAnchor.constraint(equalToConstant: 360),
            todayQuoteBackgroundImageView.heightAnchor.constraint(equalToConstant: 100),
            todayQuoteBackgroundImageView.topAnchor.constraint(equalTo: userRandomMentLabel.bottomAnchor, constant: 20),
            todayQuoteBackgroundImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureTodayQuoteTitleLabel(){
        addSubview(todayQuoteTitleLabel)
        
        todayQuoteTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayQuoteTitleLabel.widthAnchor.constraint(equalToConstant: 360),
            todayQuoteTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            todayQuoteTitleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            todayQuoteTitleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureTodayQuoteSentenceLabel(){
        addSubview(todayQuoteSentenceLabel)
        
        todayQuoteSentenceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayQuoteSentenceLabel.widthAnchor.constraint(equalToConstant: 360),
            todayQuoteSentenceLabel.heightAnchor.constraint(equalToConstant: 40),
            todayQuoteSentenceLabel.topAnchor.constraint(equalTo: todayQuoteTitleLabel.bottomAnchor, constant: 10),
            todayQuoteSentenceLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    
    //MARK: - WakeUp
  
    func configureWakeupTime(){
        configureWakeUpTimeBackgroundView()
        configureWakeUpTimeViewDivider()
        configureWakeUpTimeSectionTitleLabel()
        configureWakeUpTimeSectionSemiTitleLabel()
        configureThumbsUpIcon()
        configureTodayWakeUpTimeLabel()
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
            wakeUpTimeIcon.widthAnchor.constraint(equalToConstant: 40),
            wakeUpTimeIcon.heightAnchor.constraint(equalToConstant: 40),
            wakeUpTimeIcon.topAnchor.constraint(equalTo: todayQuoteBackgroundImageView.bottomAnchor, constant: 25),
            wakeUpTimeIcon.leadingAnchor.constraint(equalTo: todayQuoteBackgroundImageView.leadingAnchor, constant: 15)
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
    
    func configureTodayWakeUpTimeLabel(){
        addSubview(todayWakeUpTimeLabel)
        
        todayWakeUpTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todayWakeUpTimeLabel.widthAnchor.constraint(equalToConstant: 250),
            todayWakeUpTimeLabel.heightAnchor.constraint(equalToConstant: 15),
            todayWakeUpTimeLabel.topAnchor.constraint(equalTo: wakeUpTimeViewDivider.bottomAnchor, constant: 15),
            todayWakeUpTimeLabel.leadingAnchor.constraint(equalTo: todayQuoteBackgroundImageView.leadingAnchor, constant: 20)
        ])
    }
    
    func configureThumbsUpIcon(){
        addSubview(thumbsUpIcon)
        
        thumbsUpIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thumbsUpIcon.widthAnchor.constraint(equalToConstant: 24),
            thumbsUpIcon.heightAnchor.constraint(equalToConstant: 24),
            thumbsUpIcon.topAnchor.constraint(equalTo: wakeUpTimeViewDivider.bottomAnchor, constant: 20),
            thumbsUpIcon.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -35)
        ])
    }
    
    func configureWakeUpTimeLabel(){
        addSubview(wakeUpTimeLabel)
        
        wakeUpTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeLabel.widthAnchor.constraint(equalToConstant: 110),
            wakeUpTimeLabel.heightAnchor.constraint(equalToConstant: 30),
            wakeUpTimeLabel.topAnchor.constraint(equalTo: todayWakeUpTimeLabel.bottomAnchor, constant: 8),
            wakeUpTimeLabel.leadingAnchor.constraint(equalTo: todayQuoteBackgroundImageView.leadingAnchor, constant: 18)
        ])
    }
    
    func configureWakeUpTimeMeridiemLabel(){
        addSubview(wakeUpTimeMeridiemLabel)
        
        wakeUpTimeMeridiemLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            wakeUpTimeMeridiemLabel.widthAnchor.constraint(equalToConstant: 30),
            wakeUpTimeMeridiemLabel.heightAnchor.constraint(equalToConstant: 20),
            wakeUpTimeMeridiemLabel.topAnchor.constraint(equalTo: wakeUpTimeLabel.topAnchor),
            wakeUpTimeMeridiemLabel.leadingAnchor.constraint(equalTo: wakeUpTimeLabel.trailingAnchor)
        ])
    }
    
    
    //MARK: - Exercise
  
    func configureExerciseTime(){
        configureExerciseTimeBackgroundView()
        configureExerciseStopButton()
        configureExerciseStartButton()
        configureExerciseTimeIcon()
        configureExerciseSectionTitleLabel()
        configureExerciseTimeLabel()
        configureExerciseDoneButton()
    }
    
    func configureExerciseTimeBackgroundView(){
        addSubview(exerciseTimeBackgroundView)
        
        exerciseTimeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeBackgroundView.widthAnchor.constraint(equalToConstant: 360),
            exerciseTimeBackgroundView.heightAnchor.constraint(equalToConstant: 130),
            exerciseTimeBackgroundView.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 10),
            exerciseTimeBackgroundView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureExerciseStartButton(){
        addSubview(exerciseStartButton)

        exerciseStartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseStartButton.widthAnchor.constraint(equalToConstant: 105),
            exerciseStartButton.heightAnchor.constraint(equalToConstant: 35),
            exerciseStartButton.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 90),
            exerciseStartButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32)
        ])
    }
    
    func configureExerciseStopButton(){
        addSubview(exerciseStopButton)

        exerciseStopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseStopButton.widthAnchor.constraint(equalToConstant: 105),
            exerciseStopButton.heightAnchor.constraint(equalToConstant: 35),
            exerciseStopButton.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 90),
            exerciseStopButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureExerciseDoneButton(){
        addSubview(exerciseDoneButton)

        exerciseDoneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseDoneButton.widthAnchor.constraint(equalToConstant: 105),
            exerciseDoneButton.heightAnchor.constraint(equalToConstant: 35),
            exerciseDoneButton.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 90),
            exerciseDoneButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32)
        ])
    }
    
    func configureExerciseTimeIcon(){
        addSubview(exerciseTimeIcon)
        
        exerciseTimeIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeIcon.widthAnchor.constraint(equalToConstant: 40),
            exerciseTimeIcon.heightAnchor.constraint(equalToConstant: 40),
            exerciseTimeIcon.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 25),
            exerciseTimeIcon.leadingAnchor.constraint(equalTo: wakeUpTimeBackgroundView.leadingAnchor, constant: 15)
        ])
    }
    
    func configureExerciseSectionTitleLabel(){
        addSubview(exerciseTimeSectionTitleLabel)
        
        exerciseTimeSectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeSectionTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            exerciseTimeSectionTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            exerciseTimeSectionTitleLabel.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 25),
            exerciseTimeSectionTitleLabel.leadingAnchor.constraint(equalTo: wakeUpTimeBackgroundView.leadingAnchor, constant: 65)
        ])
    }
    
    func configureExerciseTimeLabel(){
        addSubview(exerciseTimeLabel)
        
        exerciseTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseTimeLabel.heightAnchor.constraint(equalToConstant: 35),
            exerciseTimeLabel.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 25),
            exerciseTimeLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -35)
        ])
    }
    
    
    //MARK: - Study
  
    func configureStudyTime(){
        configureStudyTimeBackgroundView()
        configureStudyTimeIcon()
        configureStudySectionTitleLabel()
        configureStudyTimeLabel()
        configureStudyDoneButton()
        configureStudyStopButton()
        configureStudyStartButton()
    }
    
    func configureStudyTimeBackgroundView(){
        addSubview(exerciseTimeBackgroundView)
        
        exerciseTimeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeBackgroundView.widthAnchor.constraint(equalToConstant: 360),
            exerciseTimeBackgroundView.heightAnchor.constraint(equalToConstant: 130),
            exerciseTimeBackgroundView.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 10),
            exerciseTimeBackgroundView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    func configureStudyTimeLabel(){
        addSubview(exerciseTimeIcon)
        
        exerciseTimeIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeIcon.widthAnchor.constraint(equalToConstant: 40),
            exerciseTimeIcon.heightAnchor.constraint(equalToConstant: 40),
            exerciseTimeIcon.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 25),
            exerciseTimeIcon.leadingAnchor.constraint(equalTo: wakeUpTimeBackgroundView.leadingAnchor, constant: 15)
        ])
    }
    
    func configureStudySectionTitleLabel(){
        addSubview(exerciseTimeSectionTitleLabel)
        
        exerciseTimeSectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeSectionTitleLabel.widthAnchor.constraint(equalToConstant: 100),
            exerciseTimeSectionTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            exerciseTimeSectionTitleLabel.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 25),
            exerciseTimeSectionTitleLabel.leadingAnchor.constraint(equalTo: wakeUpTimeBackgroundView.leadingAnchor, constant: 65)
        ])
    }
    
    func configureStudyTimeIcon(){
        addSubview(exerciseTimeLabel)
        
        exerciseTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseTimeLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseTimeLabel.heightAnchor.constraint(equalToConstant: 35),
            exerciseTimeLabel.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 25),
            exerciseTimeLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -35)
        ])
    }
    
    func configureStudyStartButton(){
        addSubview(exerciseStartButton)

        exerciseStartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseStartButton.widthAnchor.constraint(equalToConstant: 105),
            exerciseStartButton.heightAnchor.constraint(equalToConstant: 35),
            exerciseStartButton.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 90),
            exerciseStartButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 32)
        ])
    }
    
    func configureStudyDoneButton(){
        addSubview(exerciseDoneButton)

        exerciseDoneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseDoneButton.widthAnchor.constraint(equalToConstant: 105),
            exerciseDoneButton.heightAnchor.constraint(equalToConstant: 35),
            exerciseDoneButton.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 90),
            exerciseDoneButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -32)
        ])
    }
    
    func configureStudyStopButton(){
        addSubview(exerciseStopButton)

        exerciseStopButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseStopButton.widthAnchor.constraint(equalToConstant: 105),
            exerciseStopButton.heightAnchor.constraint(equalToConstant: 35),
            exerciseStopButton.topAnchor.constraint(equalTo: wakeUpTimeBackgroundView.bottomAnchor, constant: 90),
            exerciseStopButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
    
    
    
    
    
}
