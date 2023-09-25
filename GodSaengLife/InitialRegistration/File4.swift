
import UIKit

final class RegistrationViewController: UIViewController {
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "person")
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
