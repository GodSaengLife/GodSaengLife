
import UIKit
import SnapKit


class CalendarViewController: UIViewController {
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setCalendar()
        appleCreateCalendar()
        bottomView()
        
        
    }
    
    
    private func bottomView(){
        var bottomView = UIView()
        view.addSubview(bottomView)
        bottomView.backgroundColor = .white
        bottomView.layer.cornerRadius = 15
        bottomView.layer.borderWidth = 3
        bottomView.layer.borderColor = UIColor.black.cgColor
        bottomView.snp.makeConstraints{
            $0.top.equalTo(calendarView.snp.bottom).inset(-30)
            $0.right.left.equalTo(0).inset(20)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
    lazy var calendarView: UICalendarView = {
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
        calendarView.layer.borderWidth = 3
        calendarView.layer.borderColor = UIColor.black.cgColor

        
        
        
        
        calendarView.delegate = self
        
        view.addSubview(calendarView)
        view.backgroundColor = .white
        calendarView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(60)
            $0.bottom.equalToSuperview().inset(300)
            $0.left.right.equalTo(0).inset(20)
        }
        
        
    }
    
}

extension CalendarViewController: UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        guard let day = dateComponents.day else {
            return nil
        }
        
        if day == 14{
            return UICalendarView.Decoration.default(color: .systemBlue, size: .large)
        }
        if day == 13{
            return UICalendarView.Decoration.default(color: .systemBlue, size: .medium)
        }
        if day == 12{
            return UICalendarView.Decoration.default(color: .systemBlue, size: .small)
        }
        
        return nil
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print("date")
        
    }

}














#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable{
    
    //    update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        CalendarViewController()
    }
    //    makeui
    
}


struct ViewController_Previews: PreviewProvider{
    static var previews: some View{
        ViewControllerRepresentable()
            .previewDisplayName("아이폰 14")
        
    }
}


#endif
