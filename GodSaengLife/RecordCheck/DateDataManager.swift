
import Foundation
import UIKit


// 원하는 작동기능 : 다른사람이 코드작성하며 시작, 일시정지, 정지가 발생했을때 enum을 이용해 .start, .pause, .stop을 입력시 시간 자동으로 받아서 저장



class TimeLineSaver { // 프로그램 실행될때 인스턴스화 이후 값을 계속 갖고있게 싱글턴으로
    
    static let shared = TimeLineSaver()
    private init(){}
    
    var timeline:[TimeLine]?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchTimeLines() {
        do {
            self.timeline = try context.fetch(TimeLine.fetchRequest())
        }
        catch {
            
        }
    }
    
    func saveTimeLines(){
        do {
            try self.context.save()
        }
        catch {
            
        }
    }
    
    func setKind(_ kind:exerciseOrStudy) -> TimeLine{
        let newTimeLine = TimeLine(context: self.context)
        newTimeLine.date = Date()
        newTimeLine.second = -1

        switch kind {
        case .exercise:
            newTimeLine.kind = 0
        case .study:
            newTimeLine.kind = 1
        case .alarm:
            newTimeLine.kind = 2
        }
        return newTimeLine
    }
    
    func doneType(kind: exerciseOrStudy, second: Int16) {
        let newTimeLine = self.setKind(kind)
        
        newTimeLine.type = "done"
        newTimeLine.second = second
        
        self.saveTimeLines()
    }
    
    func setType(on type: TimeLineType,kind: exerciseOrStudy) {
        let newTimeLine = self.setKind(kind)
        
        switch type {
            
        case .start:
            newTimeLine.type = "start"
        case .alarm:
            newTimeLine.type = "alarm"
        case .non:
            newTimeLine.type = "none"
        }
        
        self.saveTimeLines()
    }
    
    func resetTest(){
        do {
            for i in timeline! {
                self.context.delete(i)
            }
            try self.context.save()
        }
        catch {
            
        }
    }
    func addCustomTest(m:Int, d:Int){
        var dateComp = DateComponents(year:2023,month: m,day: d)
        var calendar = Calendar.current.date(from: dateComp)
        var newTimeLine = TimeLine(context: self.context)
        newTimeLine.date = calendar
        
        newTimeLine.type = "none"
        
        do {
            try self.context.save()
        }
        catch {
            
        }
    }
}

enum TimeLineType{
    case non, start, alarm
}
enum exerciseOrStudy{
    case exercise, study, alarm
}







