
import UIKit
import SnapKit


class TimeLineViewController: UIViewController {
    
    var text:Int?
    var tableView = UITableView()
    var data:[TimeLineActionTrace]?
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        configure()
        
    }
}


extension TimeLineViewController {
    func configure() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
}

extension TimeLineViewController: UITableViewDelegate {
    
}

extension TimeLineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let label = UILabel()
        
        
        var action = data![indexPath.row]
        var date = DateParser.getDateString(action.savedTime)
        label.text = "\(date) \(action.savedType)"
        
        cell.addSubview(label)
        
        label.snp.makeConstraints{
            
            $0.center.equalToSuperview()
        }
        
        return cell
    }
    
    
}











