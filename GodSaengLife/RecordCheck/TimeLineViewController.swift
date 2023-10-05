
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
        
        view.backgroundColor = UIColor(named: "Main Color 2")
        
        configure()
        
        
    }
    func reload(){
        self.tableView.reloadData()
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
        
        
        let action = filteredData![indexPath.row]
        let date = action.date!
        let timeString = DateParser.getTimeLineString(date)
        
        var kindString = ""
        
        switch action.kind {
        case 0:
            kindString = "운동"
        case 1:
            kindString = "공부"
        default:
            kindString = "알람"
        }
        var typeString = ""
        if action.type == "start" {
            typeString = "시작"
        } else if action.type == "done" {
            typeString = "완료"
        }
        else if action.type == "alarm" {
            typeString = "성공"
        }
        
        
        
        
        
        label.text = kindString + " " + timeString + " " + typeString
        
        
        if action.second != -1 {
            label.text! += " \(action.second)"
        }
        
        cell.addSubview(label)
        
        label.snp.makeConstraints{
            
            $0.center.equalToSuperview()
        }
        
        return cell
    }
    
    
}











