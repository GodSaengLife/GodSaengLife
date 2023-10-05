
import UIKit
import SnapKit


class TimeLineViewController: UIViewController {
    
    var text:Int?
    var tableView = UITableView()
    var filteredData:[TimeLine]?
    var isOnScreen:Bool = false
    
    

    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "Main Color 2")
        
        configure()
        self.isOnScreen = true
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.isOnScreen = false
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
        var typeString = ""
        if action.type == "start" {
            typeString = "공부시작"
        } else if action.type == "pause" {
            typeString = "일시정지"
        }
        else if action.type == "unpause" {
            typeString = "재시작"
        }
        else if action.type == "stop" {
            typeString = "공부완료"
        }
        
        
        
        
        label.text = timeString + " " + typeString
        
        

        
        cell.addSubview(label)
        
        label.snp.makeConstraints{
            
            $0.center.equalToSuperview()
        }
        
        return cell
    }
    
    
}











