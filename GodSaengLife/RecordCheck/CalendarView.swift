import HorizonCalendar
import UIKit



class CalendarView: UICalendarView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct Preview: PreviewProvider{
//    static var previews: some View {
//        UIViewPreview {
//            
//            let view = CalendarView()
//            
//            return view
//        }.previewLayout(.sizeThatFits)
//    }
//}
//#endif
