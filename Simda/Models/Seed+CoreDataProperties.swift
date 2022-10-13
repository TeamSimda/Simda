//
//  Seed+CoreDataProperties.swift
//  Simda
//
//  Created by kimhyeongmin on 2022/10/14.
//
//

import Foundation
import CoreData


extension Seed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Seed> {
        return NSFetchRequest<Seed>(entityName: "Seed")
    }
	// 씨앗 기본 데이터
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var shapeIndex: Int64
    @NSManaged public var colorIndex: Int64
    @NSManaged public var faceIndex: Int64
    @NSManaged public var tag: [String]?
	@NSManaged public var isSeedEvolved: Bool
	
	// 씨앗 일기 데이터
    @NSManaged public var diaryContent: String?
    @NSManaged public var diaryTitle: String?
    @NSManaged public var willRetrospected: Bool
	@NSManaged public var questionList: [String]?
	
	// 씨앗 회고 데이터
    @NSManaged public var retrospectPeriod: Int64
    @NSManaged public var retrospectContent: String?
    @NSManaged public var retrospectQuestionList: [String]?

}

extension Seed : Identifiable {
	// Date 타입을 String 타입으로 변환하는 클로저
	var dateToString: String? {
		let myFormatter = DateFormatter()
		myFormatter.dateFormat = "yyyy-MM-dd"
		guard let date = self.date else { return "" }
		let savedDateString = myFormatter.string(from: date)
		return savedDateString
	}
}
