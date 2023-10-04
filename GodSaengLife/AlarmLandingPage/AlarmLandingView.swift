//
//  AlarmLandingView.swift
//  GodSaengLife
//
//  Created by Jongbum Lee on 2023/09/27.
//

import UIKit

class AlarmLandingView: UIView {
    
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    var quoteOfTheDay: UILabel!
    var quoteBox: UIView!
    var quoteLabel: UILabel!
    var quoteTextField: UITextField!
    var readQuoteLabel: UILabel!
    var completeButton: UIButton!
    
    var quotes = ["명언1", "명언2", "명언3"]
    var currentQuoteIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        titleLabel = UILabel()
        titleLabel.text = "홍식님 갓생 사셔야죠?"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel.textAlignment = .center
        
        subtitleLabel = UILabel()
        subtitleLabel.text = "인생에서 한계는 없습니다.\n여러분 자신이 만드는 한계만 제외한다면..."
        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .center
        
        quoteOfTheDay = UILabel()
        quoteOfTheDay.text = "오늘의 명언"
        quoteOfTheDay.font = UIFont.systemFont(ofSize: 20)
        quoteOfTheDay.textAlignment = .center
        
        quoteBox = UIView()
        quoteBox.layer.cornerRadius = 20
        quoteBox.backgroundColor = .lightGray
        
        quoteLabel = UILabel()
        quoteLabel.text = quotes[currentQuoteIndex]
        quoteLabel.textAlignment = .center
        
        quoteTextField = UITextField()
        quoteTextField.placeholder = "명언을 입력해주세요."
        quoteTextField.borderStyle = .roundedRect
        quoteTextField.textAlignment = .center
        
        readQuoteLabel = UILabel()
        readQuoteLabel.text = "오늘의 명언을 정확히 입력하면 일어나기 버튼이 활성화됩니다."
        readQuoteLabel.font = UIFont.systemFont(ofSize: 12)
        readQuoteLabel.textColor = .gray
        readQuoteLabel.textAlignment = .center
        
        completeButton = UIButton(type: .system)
        completeButton.setTitle("일어나기", for: .normal)
        completeButton.layer.cornerRadius = 30
        completeButton.setTitleColor(UIColor.black, for: .normal)
        completeButton.backgroundColor = UIColor.lightGray
        
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(quoteOfTheDay)
        quoteBox.addSubview(quoteLabel)
        self.addSubview(quoteBox)
        self.addSubview(quoteTextField)
        self.addSubview(readQuoteLabel)
        self.addSubview(completeButton)
    }
    
    func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteOfTheDay.translatesAutoresizingMaskIntoConstraints = false
        quoteBox.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteTextField.translatesAutoresizingMaskIntoConstraints = false
        readQuoteLabel.translatesAutoresizingMaskIntoConstraints = false
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            
            quoteOfTheDay.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            quoteOfTheDay.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 50),
            
            quoteBox.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            quoteBox.topAnchor.constraint(equalTo: quoteOfTheDay
                .bottomAnchor, constant: 10),
            quoteBox.widthAnchor.constraint(equalToConstant: 300),
            quoteBox.heightAnchor.constraint(equalToConstant: 70),
            
            quoteLabel.centerXAnchor.constraint(equalTo: quoteBox.centerXAnchor),
            quoteLabel.centerYAnchor.constraint(equalTo: quoteBox.centerYAnchor),
            
            quoteTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            quoteTextField.topAnchor.constraint(equalTo: quoteBox.bottomAnchor, constant: 25),
            quoteTextField.widthAnchor.constraint(equalTo: quoteBox.widthAnchor),
            quoteTextField.heightAnchor.constraint(equalTo: quoteBox.heightAnchor),
            
            readQuoteLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            readQuoteLabel.topAnchor.constraint(equalTo: quoteTextField.bottomAnchor, constant: 5),
            
            completeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            completeButton.topAnchor.constraint(equalTo: readQuoteLabel.bottomAnchor, constant: 100),
            completeButton.widthAnchor.constraint(equalTo: quoteBox.widthAnchor),
            completeButton.heightAnchor.constraint(equalTo: quoteBox.heightAnchor),
        ])
    }
    
    func updateButtonAppearance(isEnabled: Bool) {
        if isEnabled {
            completeButton.backgroundColor = UIColor.systemBlue
        } else {
            completeButton.backgroundColor = UIColor.lightGray
        }
    }
}

