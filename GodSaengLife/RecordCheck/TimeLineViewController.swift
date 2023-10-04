
import UIKit
import SnapKit


class TimeLineViewController: UIViewController {
    
    var text:Int?
    var tableView = UITableView()
    var filteredData:[TimeLine]?
    
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
        return filteredData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let label = UILabel()
        
        
        var action = filteredData![indexPath.row]
        var date = action.date
        label.text = "\(date)" + (action.type ?? "")
        
        cell.addSubview(label)
        
        label.snp.makeConstraints{
            
            $0.center.equalToSuperview()
        }
        
        return cell
    }
    
    
}











