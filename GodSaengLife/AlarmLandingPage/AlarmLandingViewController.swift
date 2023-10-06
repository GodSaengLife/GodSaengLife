
import UIKit

class AlarmLandingViewController: UIViewController {
    
    var alarmLandingView: AlarmLandingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        alarmLandingView = AlarmLandingView(frame: view.bounds)
        view.addSubview(alarmLandingView)
        
        alarmLandingView.quoteTextField.addTarget(self, action: #selector(checkMatchingText), for: .editingChanged)
        
        alarmLandingView.completeButton.addTarget(self, action: #selector(didTapCompleteButton), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        _ = keyboardFrame.cgRectValue.height
        view.frame.origin.y = -250
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    @objc func checkMatchingText() {
        let isMatching = alarmLandingView.quoteLabel.text == alarmLandingView.quoteTextField.text
        alarmLandingView.updateButtonAppearance(isEnabled: isMatching)
        alarmLandingView.completeButton.isEnabled = isMatching
    }
    
    @objc func didTapCompleteButton() {
        TimeLineSaver.shared.setType(on: .alarm,kind: .alarm)
        let mainVC = MainViewController()
        navigationController?.setViewControllers([mainVC], animated: true)
    }
}


