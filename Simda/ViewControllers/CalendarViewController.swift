//
//  CalendarViewController.swift
//  Simda
//
//  Created by 전지민 on 2022/10/11.
//

import Foundation
import FSCalendar

class CalendarViewController: UIViewController {

    @IBOutlet weak var calendarView: FSCalendar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        setCalendar()
        
    }
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDelegateAppearance, FSCalendarDataSource {
    
    
    func setCalendar() {
        //요일 한글로
        calendarView.locale = Locale(identifier: "ko_KR")
        
        calendarView.scrollEnabled = true
        calendarView.scrollDirection = .vertical
        
        calendarView.appearance.headerTitleFont = UIFont.systemFont(ofSize: 22)
        calendarView.appearance.weekdayFont = UIFont.systemFont(ofSize: 15)
        calendarView.appearance.titleFont = UIFont.systemFont(ofSize: 15)
        
        //header 설정
        calendarView.appearance.headerDateFormat = "YYYY년 MM월"
        calendarView.appearance.headerTitleColor = UIColor.White
        calendarView.appearance.headerTitleAlignment = .justified
        calendarView.headerHeight = 50
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        
        //달력 글자 색 설정
        calendarView.appearance.weekdayTextColor = UIColor.White
        calendarView.appearance.titleDefaultColor = UIColor.White
        calendarView.appearance.titlePlaceholderColor = UIColor.gray
        
        //이벤트 표시 색상 변경
        calendarView.appearance.eventDefaultColor = UIColor.Main
        calendarView.appearance.eventSelectionColor = UIColor.Main
        
        //오늘 날짜 관련 색상
        calendarView.appearance.todayColor = .clear
        calendarView.appearance.titleTodayColor = .Main
        calendarView.appearance.todaySelectionColor = .Main
        
        //날짜 선택
        calendarView.appearance.selectionColor = .Main
        
        //다중 선택 스와이프 제스처
        calendarView.swipeToChooseGesture.isEnabled = false
    }
    
    //이벤트 표시되는 갯수 정의
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        return
//    }
    //날짜 선택 해재 막기
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        return false
    }
}
