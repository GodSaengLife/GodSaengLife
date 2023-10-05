//
//  AlarmLandingView.swift
//  GodSaengLife
//
//  Created by Jongbum Lee on 2023/09/27.
//

import UIKit

class AlarmLandingView: UIView {
    
    //MARK: - Properties
    
    lazy var safeArea = safeAreaLayoutGuide
    
    let titleLabel: UILabel = {
        let label = UILabel()
        var userName = String(UserDefaults.standard.string(forKey: "nickname") ?? "사용자")
        
        label.text = "\(userName) 갓생 사셔야죠?"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "alarmBackground")
        imageView.alpha = 0.5
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    let quoteLabel: UILabel = {
        let label = UILabel()
        let text = quotes.randomElement()
        // 폰트 변경
        let font = UIFont(name: "NanumMyeongjoOTF", size: 15)
        
        // 행간 조절
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        
        // 폰트 스타일 적용
        let attributedText = NSMutableAttributedString(string: text!)
        attributedText.addAttribute(.paragraphStyle, value: style, range: NSMakeRange(0, attributedText.length))
        attributedText.addAttribute(.font, value: font as Any, range: NSMakeRange(0, attributedText.length))
        
        label.attributedText = attributedText
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        return label
    }()
    
    let quoteBox: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "오늘의한줄")
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    let quoteTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "명언을 입력해주세요."
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.3
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textAlignment = .left
        
        return textField
    }()
    
    let readQuoteLabel: UILabel = {
        let label = UILabel()
        label.text = "명언을 정확히 입력하면 버튼이 활성화됩니다."
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        label.textAlignment = .left
        
        return label
    }()
    
    let completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.systemGray4
        button.setTitle("역시 당신은 갓생러!", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Settings
    
    func updateButtonAppearance(isEnabled: Bool) {
        if isEnabled {
            completeButton.backgroundColor = UIColor.systemBlue
        } else {
            completeButton.backgroundColor = UIColor.systemGray4
        }
    }
    
    
    //MARK: - UI
    
    func setupUI() {
        addSubview(backgroundImageView)
        addSubview(titleLabel)
        quoteBox.addSubview(quoteLabel)
        addSubview(quoteBox)
        addSubview(quoteTextField)
        addSubview(readQuoteLabel)
        addSubview(completeButton)
    }
    
    func configureUI(){
        configureBackgroundImageView()
        configureTitleLabel()
        configureQuoteLabel()
        configureQuoteBox()
        configureQuoteTextField()
        configureReadQuoteLabel()
        configureCompleteButton()
        
    }
    
    func setupConstraints() {
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteBox.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteTextField.translatesAutoresizingMaskIntoConstraints = false
        readQuoteLabel.translatesAutoresizingMaskIntoConstraints = false
        completeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureBackgroundImageView(){
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func configureTitleLabel(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150)
        ])
    }
    
    func configureQuoteBox(){
        NSLayoutConstraint.activate([
            quoteBox.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            quoteBox.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 70),
            quoteBox.widthAnchor.constraint(equalToConstant: 345),
            quoteBox.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    func configureQuoteLabel(){
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: quoteBox.topAnchor, constant: 27),
            quoteLabel.bottomAnchor.constraint(equalTo: quoteBox.bottomAnchor, constant: -20),
            quoteLabel.leadingAnchor.constraint(equalTo: quoteBox.leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: quoteBox.trailingAnchor, constant: -20)
        ])
    }
    
    
    func configureQuoteTextField(){
        NSLayoutConstraint.activate([
            quoteTextField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            quoteTextField.topAnchor.constraint(equalTo: quoteBox.bottomAnchor, constant: 20),
            quoteTextField.widthAnchor.constraint(equalToConstant: 340),
            quoteTextField.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    func configureReadQuoteLabel(){
        NSLayoutConstraint.activate([
            readQuoteLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            readQuoteLabel.topAnchor.constraint(equalTo: quoteTextField.bottomAnchor, constant: 10),
            readQuoteLabel.widthAnchor.constraint(equalToConstant: 330)
        ])
    }
    
    func configureCompleteButton(){
        NSLayoutConstraint.activate([
            completeButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            completeButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -30),
            completeButton.widthAnchor.constraint(equalToConstant: 340),
            completeButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

