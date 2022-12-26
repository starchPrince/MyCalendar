//
//  ViewController.swift
//  MyCalendar
//
//  Created by Сергей Буланов on 26.12.2022.
//

import HorizonCalendar
import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
    }
    
    //Создаем календарь
    private func createCalendar() {
        let calendar = Calendar.current
        let startDate = calendar.date(from: DateComponents(year: 2020, month: 1, day: 1))!
        let finishDate = calendar.date(from: DateComponents(year: 2022, month: 12, day: 31))!
        let content = CalendarViewContent(calendar: calendar,
                                          visibleDateRange: startDate...finishDate, monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))
        let calendarView = CalendarView(initialContent: content)
        calendarView.daySelectionHandler = { day in
            let output  = "Выбрана дата " + String(describing: day.components)
            print(output)
        }
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            calendarView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            calendarView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
        
    }


}

