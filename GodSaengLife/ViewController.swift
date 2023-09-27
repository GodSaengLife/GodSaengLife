

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let testButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("테스트", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func testButtonTapped() {
//        let moveVC = TimeSettingViewController()
        let moveVC = AlarmSettingViewController()
        moveVC.title = "시간 설정"
        let naviVC = UINavigationController(rootViewController: moveVC)
        naviVC.modalPresentationStyle = .pageSheet
        let pageSheet = naviVC.presentationController as? UISheetPresentationController
        pageSheet?.detents = [.medium()]
        pageSheet?.selectedDetentIdentifier = .medium
        pageSheet?.prefersGrabberVisible = false
        pageSheet?.preferredCornerRadius = 8
        pageSheet?.animateChanges { pageSheet?.selectedDetentIdentifier = .medium }
        present(naviVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(testButton)
        testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // Do any additional setup after loading the view.
        }
    
    
}

