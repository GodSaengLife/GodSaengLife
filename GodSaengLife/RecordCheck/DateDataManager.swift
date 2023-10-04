
import Foundation


// 원하는 작동기능 : 다른사람이 코드작성하며 시작, 일시정지, 정지가 발생했을때 enum을 이용해 .start, .pause, .stop을 입력시 시간 자동으로 받아서 저장



class TimeLineSaver { // 프로그램 실행될때 인스턴스화 이후 값을 계속 갖고있게 싱글턴으로
    
    static let shared = TimeLineSaver()
    private init(){}
    
    
    var timeLines:[TimeLineOneDay] = []
    
    func setType(on type: TimeLineType) {
        
        if timeLines.count == 0 { // 오늘날짜와 비교해서 원데이객체 없으면 새로만들고 아니면 그대로 쓰고
            timeLines.append(TimeLineOneDay())
        }
        
        var savingDay = TimeLineActionTrace()
        savingDay.savedTime = Date()

        switch type {
            
        case .start:
            savingDay.savedType = .start
        case .pause:
            savingDay.savedType = .pause
        case .unpause:
            savingDay.savedType = .unpause
        case .stop:
            savingDay.savedType = .stop
        case .non:
            print("none")
        }
        timeLines[timeLines.count-1].timeLineActions.append(savingDay)

        
        
    }
}

enum TimeLineType{
    case non, start, pause, unpause, stop
}

struct TimeLineActionTrace {
    var savedType:TimeLineType = .non
    var savedTime = Date() // 함수 실행 시간 저장
    
}

struct TimeLineOneDay {
    var dateData = Date() // 생성날짜
    
    var targetTime = Date() // 설정되었던 그날의 목표 시간들
    var targetWakeUpTime = Date() // 설정된 기상 알람
    
    var actualWakeUpTime = Date() // 실제 기상 시간
    
    var timeLineActions:[TimeLineActionTrace] = []
    
}







