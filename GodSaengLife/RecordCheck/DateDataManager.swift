
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
    
    
    func setType(on type: TimeLineType) {
        
        var newTimeLine = TimeLine(context: self.context)
        newTimeLine.date = Date()
        
        switch type {
            
        case .start:
            newTimeLine.type = "start"
        case .pause:
            newTimeLine.type = "pause"
        case .unpause:
            newTimeLine.type = "unpause"
        case .stop:
            newTimeLine.type = "stop"
        case .non:
            newTimeLine.type = "none"
            print("none")
        }
        
        do {
            try self.context.save()
        }
        catch {
            
        }
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
        case non, start, pause, unpause, stop
    }
    
    class TimeLineOneDay {
        
        //    var calData = Calendar(identifier: .gregorian)
        
        //    var targetTime = Date() // 설정되었던 그날의 목표 시간들
        //    var targetWakeUpTime = Date() // 설정된 기상 알람
        //
        //    var actualWakeUpTime = Date() // 실제 기상 시간
        
    }
    
    
    
    
    
    
    
