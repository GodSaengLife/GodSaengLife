import UIKit
import SnapKit


class TimeLineViewController: UIViewController {
    
    //MARK: - Properties
    
    var text:Int?
    var tableView = UITableView()
    
    
    var sections:Set<String> = ["알람","운동","공부"]
    var items:[[String]] = [
        
        []
        ,
        []
        ,
        []
        
    ]
    
    var previousSectionHeaderHeight: CGFloat = 0.0
    var headerView: UIView?
    
    
    //MARK: - Life Cycle
    
    override func loadView() {
        view = tableView
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        configure()
        setBackgroundColor()
        setTableViewAttribute()
    }
    
    func reload(){
        self.tableView.reloadData()
    }
    
    func setBackgroundColor(){
        view.backgroundColor = UIColor(named: "Main Color 2")
    }
    
    func setTableViewAttribute(){
        let topInset: CGFloat = 10
        tableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = view.backgroundColor
        
    }
    

}


extension TimeLineViewController {
    func configure() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TimeLineViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = UIColor.white // 원하는 색상으로 설정
        }
    }
}

extension TimeLineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let label = UILabel()
        label.text = "야호 기상미션 성공!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .left // 라벨 가운데 정렬
        
        cell.contentView.addSubview(label)
        cell.backgroundColor = tableView.backgroundColor
        
        
        //                let action = filteredData![indexPath.row]
        //                let date = action.date!
        //                let timeString = DateParser.getTimeLineString(date)
        //
        //                var kindString = ""
        //
        //                switch action.kind {
        //                case 0:
        //                    kindString = "운동"
        //                case 1:
        //                    kindString = "공부"
        //                default:
        //                    kindString = "알람"
        //                }
        //
        //                var typeString = ""
        //
        //                if action.type == "start" {
        //                    typeString = "시작"
        //                } else if action.type == "done" {
        //                    typeString = "완료"
        //                }
        //                else if action.type == "alarm" {
        //                    typeString = "성공"
        //                }
        //
        //                label.text = kindString + " " + timeString + " " + typeString
        //
        //        if action.second != -1 {
        //            label.text! += " \(action.second)초"
        //        }
        
        label.text = items[indexPath.section][indexPath.row]
        
        cell.addSubview(label)
        
        label.snp.makeConstraints{
            $0.left.equalToSuperview().offset(50) // 왼쪽으로 20 포인트 이동
            $0.centerY.equalToSuperview()
        }
        
        
        return cell
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "알람"
        case 1:
            return "운동"
        case 2:
            return "공부"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear // 배경색을 투명하게 설정
        
        let iconImageView = UIImageView(image: UIImage(systemName: "circle.fill"))
        iconImageView.frame = CGRect(x: 25, y: 13, width: 12, height: 12)
        iconImageView.tintColor = .white
        headerView.addSubview(iconImageView)
        
        // 섹션 타이틀 레이블을 추가합니다.
        let titleLabel = UILabel()
        titleLabel.text = self.tableView(tableView, titleForHeaderInSection: section)
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.frame = CGRect(x: 50, y: 0, width: tableView.frame.size.width - 50, height: 40) // 타이틀 레이블 위치 및 크기 조정
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
    
    
    
    
    
    
    
}
