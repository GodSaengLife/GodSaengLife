//
//  MyPageViewController.swift
//  GodSaengLife
//
//  Created by t2023-m0045 on 2023/09/27.
//

import UIKit
import Then

class MyPageViewController: UIViewController {
    // MARK: - Components
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.clipsToBounds = true
        iv.image = UIImage(named: "profileImage")
        iv.layer.cornerRadius = 60
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.lightGray.cgColor
        return iv
    }()
    
    private lazy var nicknameTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .medium)
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("프로필 수정", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Total Done Count
    private let totalDoneCountTitleLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private let totalDoneCountNumberLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private lazy var totalDoneCountStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [totalDoneCountTitleLabel, totalDoneCountNumberLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 15
        return sv
    }()
    
    // MARK: - Total ExerciseTime
    private let totalExerciseTimeTitleLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private let totalExerciseTimeNumberLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private lazy var totalExerciseTimeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [totalExerciseTimeTitleLabel, totalExerciseTimeNumberLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 15
        return sv
    }()
    
    // MARK: - Total StudyTime
    private let totalStudyTimeTitleLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }

    private let totalStudyTimeNumberLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private lazy var totalStudyTimeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [totalStudyTimeTitleLabel, totalStudyTimeNumberLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 15
        return sv
    }()
    
    // MARK: - TotalTime
    private let totalTimeLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private let totalTimeNumberLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private lazy var totalTimeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [totalTimeLabel, totalTimeNumberLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 15
        return sv
    }()
    
    // MARK: - Average ExerciseTime
    private let averageExerciseTimeTitleLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private let averageExerciseTimeNumberLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private lazy var averageExerciseTimeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [averageExerciseTimeTitleLabel, averageExerciseTimeNumberLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 15
        return sv
    }()
    
    // MARK: - Average StudyTime
    private let averageStudyTimeTitleLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }

    private let averageStudyTimeNumberLabel = UILabel().then {
        $0.backgroundColor = .clear
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private lazy var averageStudyTimeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [averageStudyTimeTitleLabel, averageStudyTimeNumberLabel])
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 15
        return sv
    }()
    
    private lazy var stackViewFirst = UIStackView().then {
        $0.axis = .horizontal
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .cyan
        $0.distribution = .fillEqually
        $0.spacing = 20
    }
    private lazy var stackViewSecond = UIStackView().then {
        $0.axis = .horizontal
        $0.layer.cornerRadius = 30
        $0.backgroundColor = .cyan
        $0.distribution = .fillEqually
        $0.spacing = 20
    }
    
    private lazy var textView = UILabel()
    
    private var fieldsFirst:[String] = ["갓생산날","총운동시간","총공부시간"]
    private var fieldsSecond:[String] = ["총시간","평균운동시간","평균공부시간"]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setConstraints()
        setUserData()
        setTimeSaverData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTimeSaverData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        TimeLineSaver.shared.fetchTimeLines()
        setTimeSaverData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.reloadInputViews()
        print("diss")
    }
    
    // MARK: - Add Views
    private func addViews() {
        stackViewFirst.addArrangedSubview(totalDoneCountStackView)
        stackViewFirst.addArrangedSubview(totalExerciseTimeStackView)
        stackViewFirst.addArrangedSubview(totalStudyTimeStackView)
        
        stackViewSecond.addArrangedSubview(totalTimeStackView)
        stackViewSecond.addArrangedSubview(averageExerciseTimeStackView)
        stackViewSecond.addArrangedSubview(averageStudyTimeStackView)
        let views: [UIView] = [imageView, nicknameTitleLabel, editButton, stackViewFirst, stackViewSecond]
        views.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func configureStackView() {
        view.addSubview(stackViewFirst)
        stackViewFirst.snp.makeConstraints{
            $0.top.equalTo(editButton.snp.bottom).inset(-50)
            $0.right.left.equalToSuperview().inset(30)
            $0.height.equalTo(100)
        }
        self.labelViews = addStatisticViews(fieldsFirst,stack: stackViewFirst).0
        
        view.addSubview(stackViewSecond)
        stackViewSecond.snp.makeConstraints{
            $0.top.equalTo(stackViewFirst.snp.bottom).inset(-20)
            $0.right.left.equalToSuperview().inset(30)
            $0.height.equalTo(100)
        }
        self.numberViews = addStatisticViews(fieldsSecond,stack: stackViewSecond).1
    }
    
    // 제목 설정 메서드
    func addStatisticViews(_ list: [String], stack: UIStackView) -> ([UILabel], [UILabel]) {
        var labeViews: [UILabel] = []
        var numberViews: [UILabel] = []
        for i in list {
            let view = UIView()
            view.snp.makeConstraints{
                $0.width.equalTo(50)
            }
            let label = UILabel()
            label.text = i
            view.addSubview(label)
            labeViews.append(label)
            label.snp.makeConstraints{
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().inset(20)
            }
            let number = UILabel()
            number.text = dateDataFilter(i)
            view.addSubview(number)
            number.snp.makeConstraints{
                $0.top.equalTo(label.snp.bottom).inset(-20)
                $0.centerX.equalToSuperview()
            }
            numberViews.append(number)
            stack.addArrangedSubview(view)
        }
        return (labeViews, numberViews)
    }
    
    //MARK: - 데이터 구분
    private func dateDataFilter(_ type:String) -> String{
        let calendar = Calendar(identifier: .gregorian)
        switch type {
        case fieldsFirst[0]:
            var temp:Set<DateComponents> = []
            TimeLineSaver.shared.timeline?.forEach{
                temp.insert(calendar.dateComponents([.year, .month, .day],from: $0.date!))
            }
            return "\(temp.count)일"
        case fieldsFirst[1]:
            var totalEx:Int = 0
            TimeLineSaver.shared.timeline?.forEach{
                if $0.kind == 0 && $0.second != -1{
                    totalEx += Int($0.second)
                    print(totalEx)
                }
            }
            return "\(totalEx)초"
        case fieldsFirst[2]:
            var totalStudy:Int = 0
            TimeLineSaver.shared.timeline?.forEach{
                if $0.kind == 1 && $0.second != -1 {
                    totalStudy += Int($0.second)
                }
            }
            return "\(totalStudy)초"
        case fieldsSecond[0]:
            var total:Int = 0
            TimeLineSaver.shared.timeline?.forEach{
                if $0.second != -1 {
                    total += Int($0.second)
                }
            }
            return "\(total)초"
        case fieldsSecond[1]:
            var totalEx:Int = 0
            var aver = 0
            TimeLineSaver.shared.timeline?.forEach{
                if $0.kind == 0 && $0.second != -1{
                    totalEx += Int($0.second)
                    aver += 1
                }
            }
            if aver != 0 {
                return "\(totalEx/aver)초"
            }else{
                return "\(totalEx)초"
            }
        case fieldsSecond[2]:
            var totalStudy:Int = 0
            var aver = 0
            TimeLineSaver.shared.timeline?.forEach{
                if $0.kind == 1 && $0.second != -1{
                    totalStudy += Int($0.second)
                    aver += 1
                }
            }
            if aver != 0 {
                return "\(totalStudy/aver)초"
            }else{
                return "\(totalStudy)초"
            }
            
            
        default:
            print("error")
            return "error"
        }
    }

    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120)
        ])
        NSLayoutConstraint.activate([
            nicknameTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nicknameTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nicknameTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: nicknameTitleLabel.bottomAnchor, constant: 20),
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            editButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            stackViewFirst.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 20),
            stackViewFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackViewFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            stackViewSecond.topAnchor.constraint(equalTo: stackViewFirst.bottomAnchor, constant: 20),
            stackViewSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackViewSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    // MARK: - Setting
    private func setUserData() {
        if let imageData = UserDefaults.standard.data(forKey: "userImage") {
            let image = UIImage(data: imageData)
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "profileImage")
        }
        let nickname = UserDefaults.standard.string(forKey: "nickname")
        nicknameTitleLabel.text = nickname
    }
    
    // MARK: - TimeLineSave Data Setting
    private func setTimeSaverData() {
        totalDoneCountTitleLabel.text = fieldsFirst[0]
        totalExerciseTimeTitleLabel.text = fieldsFirst[1]
        totalStudyTimeTitleLabel.text = fieldsFirst[2]
        
        totalDoneCountNumberLabel.text = dateDataFilter(fieldsFirst[0])
        totalExerciseTimeNumberLabel.text = dateDataFilter(fieldsFirst[1])
        totalStudyTimeNumberLabel.text = dateDataFilter(fieldsFirst[2])
        
        totalTimeLabel.text = fieldsSecond[0]
        averageExerciseTimeTitleLabel.text = fieldsSecond[1]
        averageStudyTimeTitleLabel.text = fieldsSecond[2]
        
        totalTimeNumberLabel.text = dateDataFilter(fieldsSecond[0])
        averageExerciseTimeNumberLabel.text = dateDataFilter(fieldsSecond[1])
        averageStudyTimeNumberLabel.text = dateDataFilter(fieldsSecond[2])
    }
    
    // MARK: - Present
    private func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    private func presentNicknameEditAlert() {
        let alert = UIAlertController(title: "닉네임 변경하기", message: "변경할 닉네임을 입력해주세요.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let save = UIAlertAction(title: "저장", style: .default) { _ in
            let nickname = alert.textFields?.first?.text
            UserDefaults.standard.set(nickname, forKey: "nickname")
            self.nicknameTitleLabel.text = nickname
        }
        alert.addAction(cancel)
        alert.addAction(save)
        alert.addTextField { textField in
            textField.placeholder = UserDefaults.standard.string(forKey: "nickname")
        }
        present(alert, animated: true)
    }
    
    private func presentActionSheet() {
        let alert = UIAlertController(title: "프로필 수정", message: nil, preferredStyle: .actionSheet)
        let editProfileImage = UIAlertAction(title: "이미지 변경하기", style: .default) { _ in
            self.presentImagePicker()
        }
        let editNickname = UIAlertAction(title: "닉네임 변경하기", style: .default) { _ in
            self.presentNicknameEditAlert()
        }
        let cancel = UIAlertAction(title: "취소하기", style: .cancel)
        alert.addAction(editProfileImage)
        alert.addAction(editNickname)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    // MARK: - Actions
    @objc private func editButtonTapped() {
        presentActionSheet()
    }
}

extension MyPageViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            let imageData = image?.jpegData(compressionQuality: 0.0)
            UserDefaults.standard.set(imageData, forKey: "userImage")
            self.imageView.image = image
        }
    }
}

extension MyPageViewController: UINavigationControllerDelegate {
    
}

