
import UIKit

final class RegistrationViewController: UIViewController {
    // MARK: - Constants
    private let userDefaultImage = UIImage(named: "profileImage")
    private let godLifeBackgroundImage = UIImage(named: "godLifeBackground")
    
    private let nicknameTitle = "갓생러가 될 당신의 이름은?"
    private let nicknameTextFieldPlaceholder = "이름을 입력해주세요."
    private let startButtonTitle = "갓생 시작..하기"
    
    // MARK: - Properties
    private var nickname: String?
    
    // MARK: - Component
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        iv.image = self.userDefaultImage
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 60
        iv.layer.borderWidth = 0.5
        iv.layer.borderColor = UIColor.lightGray.cgColor
        return iv
    }()
    
    private lazy var backgroundView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor(named: "Main Color 5")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor(named: "Main Color 5")
        iv.image = self.godLifeBackgroundImage
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private lazy var nicknameTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = self.nicknameTitle
        label.font = .systemFont(ofSize: 17, weight: .medium)
        
        return label
    }()
    
    private lazy var nicknameTextField: UITextField = {
        let tf = UITextField()
        tf.delegate = self
        tf.placeholder = self.nicknameTextFieldPlaceholder
        tf.textAlignment = .center
        tf.font = .systemFont(ofSize: 15, weight: .regular)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        return tf
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.isEnabled = false
        button.setTitle(self.startButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(self.view)
        configure(imageView)
        addViews()
        setConstraints()
    }
    
    deinit {
        print("유저 등록 페이지 사라집니다요.")
    }
    
    // MARK: - Configure
    private func configure(_ view: UIView) {
        view.backgroundColor = .white
    }
    
    private func configure(_ imageView: UIImageView) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gesture)
    }
    
    // MARK: - Add Views
    private func addViews() {
        let views: [UIView] = [backgroundView,backgroundImageView,imageView,nicknameTitleLabel,nicknameTextField,startButton]
        views.forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 280)
        ])
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -65),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            nicknameTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            nicknameTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            nicknameTextField.topAnchor.constraint(equalTo: nicknameTitleLabel.bottomAnchor, constant: 15),
            nicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nicknameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Update
    private func updateButtonColor() {
        if self.nickname?.isEmpty == true {
            startButton.backgroundColor = .lightGray
            startButton.isEnabled = false
        }
        if self.nickname?.isEmpty == false {
            startButton.backgroundColor = UIColor(named: "Main Color 2")
            startButton.isEnabled = true
        }
    }
    
    // MARK: - Present
    private func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    // MARK: - Actions
    @objc private func imageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        presentImagePicker()
    }
    
    @objc private func textDidChange() {
        if let nickname = nicknameTextField.text {
            let modifiedNickname = "\(nickname)님!"
            self.nickname = modifiedNickname
        }
        updateButtonColor()
    }
    
    @objc private func startButtonTapped() {
        if self.nickname?.isEmpty == false {
            UserDefaults.standard.set(self.nickname, forKey: "nickname")
            DataManager.shared.create(AlarmInfo())
            DataManager.shared.create(ExerciseInfo())
            DataManager.shared.create(StudyInfo())
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
            let moveVC = MainTabBarController()
            sceneDelegate.changeRootViewController(moveVC)
        }
    }
}

// MARK: - Extension
extension RegistrationViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            let imageData = image?.jpegData(compressionQuality: 0.0)
            UserDefaults.standard.set(imageData, forKey: "userImage")
            self.imageView.image = image
        }
    }
}

extension RegistrationViewController: UINavigationControllerDelegate {
    
}

extension RegistrationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 8
        guard let text = textField.text else { return false }
            if text.count >= maxLength && range.length == 0 {
                return false
        }
        return true
    }
}




