
import UIKit

final class RegistrationViewController: UIViewController {
    // MARK: - Constants
    private let userDefaultImage = UIImage(systemName: "person.fill")
    private let nicknameTitle = "갓생을 살려는 당신은 누구입니까?"
    private let nicknameTextFieldPlaceholder = "닉네임을 입력해주세요."
    private let startButtonTitle = "갓생살기"
    
    // MARK: - Component
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .clear
        iv.image = self.userDefaultImage
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 75
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.lightGray.cgColor
        return iv
    }()
    
    private lazy var nicknameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = self.nicknameTitle
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var nicknameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = self.nicknameTextFieldPlaceholder
        tf.textAlignment = .center
        tf.font = .systemFont(ofSize: 20, weight: .regular)
        tf.layer.cornerRadius = 4
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        return tf
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .lightGray
        button.setTitle(self.startButtonTitle, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(self.view)
        addSubViews()
        setConstraints()
    }
    
    // MARK: - Configure
    private func configure(_ view: UIView) {
        view.backgroundColor = .white
    }
    
    // MARK: - AddSubViews
    private func addSubViews() {
        view.addSubview(imageView)
        view.addSubview(nicknameTitleLabel)
        view.addSubview(nicknameTextField)
        view.addSubview(startButton)
    }
    
    // MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            nicknameTitleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            nicknameTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            nicknameTextField.topAnchor.constraint(equalTo: nicknameTitleLabel.bottomAnchor, constant: 15),
            nicknameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nicknameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nicknameTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
