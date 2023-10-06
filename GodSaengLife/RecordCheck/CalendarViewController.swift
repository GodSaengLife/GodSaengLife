
import UIKit
import SnapKit


class CalendarViewController: UIViewController {
    
    let timeLineView = TimeLineViewController()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setCalendar()
        appleCreateCalendar()
        
        
        TimeLineSaver.shared.fetchTimeLines()
//        TimeLineSaver.shared.resetTest()
        //                TimeLineSaver.shared.setType(on: .start)
        //                TimeLineSaver.shared.setType(on: .pause)
        //                TimeLineSaver.shared.setType(on: .unpause)
        //                TimeLineSaver.shared.setType(on: .stop)
        
        //        TimeLineSaver.shared.resetTest()
        //                TimeLineSaver.shared.setType(on: .start,kind: .exercise)
        //                TimeLineSaver.shared.setType(on: .alarm,kind: .alarm)
        
        //        TimeLineSaver.shared.addCustomTest(m: 10, d: 1)
    }
    
    //MARK: - UI관련 start
    
    lazy var calendarView: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.wantsDateDecorations = true
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        return calendarView
    }()
    
    lazy var calendarTitleImage: UICalendarView = {
        let calendarView = UICalendarView()
        calendarView.wantsDateDecorations = true
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        return calendarView
    }()
    
    private func setCalendar(){
        calendarView.delegate = self
        
        let selection = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = selection
    }
    
    private func appleCreateCalendar(){
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        calendarView.backgroundColor = .white
        calendarView.layer.cornerRadius = 15
        //        calendarView.layer.borderWidth = 3
        calendarView.layer.borderColor = UIColor.black.cgColor
        
        calendarView.delegate = self
        
        view.addSubview(calendarView)
        view.backgroundColor = .white
        calendarView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(60)
            $0.bottom.equalToSuperview().inset(300)
            $0.left.right.equalTo(0).inset(15)
        }
    }
    //MARK: - UI관련 end
    
    
    
    func presentBottomSheet() {
        
        //        timeLineView.isModalInPresentation = true
        
        if let sheet = timeLineView.sheetPresentationController {
            sheet.preferredCornerRadius = 30
            sheet.prefersGrabberVisible = true
            sheet.detents = [
                .custom(resolver: {
                    0.40 * $0.maximumDetentValue
                })]
            sheet.largestUndimmedDetentIdentifier = .large
        }
        present(timeLineView, animated: true)
    }
}

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        let calendar = Calendar(identifier: .gregorian)
        TimeLineSaver.shared.fetchTimeLines()
        for i in TimeLineSaver.shared.timeline! {
            var temp = calendar.dateComponents([.year,.month,.day], from: i.date!)
            if temp.year == dateComponents.year && temp.month == dateComponents.month && temp.day == dateComponents.day {
                calendarView.wantsDateDecorations = true
                return UICalendarView.Decoration.default(color: .systemBlue, size: .large)
            }else{
        
            }
        }
        return nil
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        
        TimeLineSaver.shared.fetchTimeLines()
        
        let calendar = Calendar(identifier: .gregorian)
        
        let filtered = TimeLineSaver.shared.timeline?.filter{
            var temp = calendar.dateComponents([.year, .month, .day],from: $0.date!)
            if temp.year == dateComponents?.year && temp.month == dateComponents?.month && temp.day == dateComponents?.day {
                return true
            } else {
                return false
            }
        }
        if filtered!.isEmpty {
            
        }else{
            presentBottomSheet()
            timeLineView.filteredData = filtered
            timeLineView.reload()
        }
        
    }
}







