//
//  CoreDataManager.swift
//  Simda
//
//  Created by kimhyeongmin on 2022/10/13.
//

import UIKit
import CoreData

//MARK: Seed Model 관리하는 매니저 (코어데이터 관리)
final class CoreDataManager {
	
	// 싱글톤
	static let shared = CoreDataManager()
	private init() {}
	
	// 앱 델리게이트
	private let appDelegate = UIApplication.shared.delegate as? AppDelegate
	
	// 임시저장소
	private lazy var context = appDelegate?.persistentContainer.viewContext
	
	// 엔터티 이름 (코어데이터에 저장된 객체)
	let modelName: String = "Seed"
	
	// MARK: Read
	func getSeedFromCoreData() -> [Seed] {
		var SeedList: [Seed] = []
		// 임시저장소 있는지 확인
		if let context = context {
			// 요청서
			let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
			// 날짜를 정렬 순서로 정해서 요청서에 넘겨주기
			let dateOrder = NSSortDescriptor(key: "date", ascending: false)
			request.sortDescriptors = [dateOrder]
			
			do {
				// 임시저장소에서 (요청서를 통해서) 데이터 가져오기 (fetch메서드)
				if let fetchedSeedList = try context.fetch(request) as? [Seed] {
					SeedList = fetchedSeedList
				}
			} catch {
				print("읽기 실패")
			}
		}
		
		return SeedList
	}
	
	// MARK: Create -> 씨앗 데이터 객체 생성
	func saveSeedBasicData(id: UUID?, name: String?, date: Date?, shapeIndex: Int64, colorIndex: Int64, faceIndex: Int64, tag: [String]?, isSeedEvolved: Bool, completion: @escaping () -> Void) {
		// 임시저장소 있는지 확인
		if let context = context {
			// 임시저장소에 있는 데이터를 그려줄 형태 파악하기
			if let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) {
				
				// 임시저장소에 올라가게 할 객체만들기 (NSManagedObject ===> ToDoData)
				if let Seed = NSManagedObject(entity: entity, insertInto: context) as? Seed {
					
					// 실제 데이터 할당
					Seed.id = id
					Seed.name = name
					Seed.date = date
					Seed.shapeIndex = shapeIndex
					Seed.colorIndex = colorIndex
					Seed.faceIndex = faceIndex
					Seed.tag = tag
					Seed.isSeedEvolved = isSeedEvolved
					
					// 에러 처리
					appDelegate?.saveContext()
				}
			}
		}
		completion()
	}
	
	// MARK: Update -> 생성된 씨앗 데이터 인스턴스에 빈 프로퍼티에 값 추가
	func updateSeed(newSeedData: Seed, completion: @escaping () -> Void) {
		// 날짜 옵셔널 바인딩
		guard let id = newSeedData.id else {
			completion()
			return
		}
		
		// 임시저장소 있는지 확인
		if let context = context {
			// 요청서
			let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
			// 단서 / 찾기 위한 조건 설정
			request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
			
			do {
				// 요청서를 통해서 데이터 가져오기
				if let fetchedSeed = try context.fetch(request) as? [Seed] {
					// 배열의 첫번째
					if var targetSeed = fetchedSeed.first {
						
						// Seed에 실제 데이터 재할당
						targetSeed = newSeedData
						
						// 에러 처리
						appDelegate?.saveContext()
					}
				}
				completion()
			} catch {
				print("업데이트 실패")
				completion()
			}
		}
	}
	
	// TODO: 추후 추가 고려해서 일단 구현
	// MARK: Delete
	func deleteSeed(data: Seed, completion: @escaping () -> Void) {
		// 날짜 옵셔널 바인딩
		guard let id = data.id else {
			completion()
			return
		}
		
		// 임시저장소 있는지 확인
		if let context = context {
			// 요청서
			let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
			// 단서 / 찾기 위한 조건 설정
			request.predicate = NSPredicate(format: "id = %@", id as CVarArg)
			
			do {
				// 요청서를 통해서 데이터 가져오기 (조건에 일치하는 데이터 찾기) (fetch메서드)
				if let fetchedSeedList = try context.fetch(request) as? [Seed] {
					
					// 임시저장소에서 (요청서를 통해서) 데이터 삭제하기 (delete메서드)
					if let targetSeed = fetchedSeedList.first {
						context.delete(targetSeed)
						
						// 에러 처리
						appDelegate?.saveContext()
					}
				}
				completion()
			} catch {
				print("삭제 실패")
				completion()
			}
		}
	}
}

// Reference : 앨런 Swift문법 마스터 스쿨 (https://inf.run/sNaA)



// TODO: LED 담당 뷰 develop 브랜치에 머지 후 모델 업데이트 함수 추가

//// 모델(저장 데이터를 관리하는 코어데이터)
//let toDoManager = CoreDataManager.shared
//
//// 저장하기를 눌렀을 때
//@IBAction func Button(_ sender: UIButton) {
//	// 기존데이터가 있을때 기존 데이터 업데이트
//	if let SeedData = self.SeedData {
//
//		// 실제 데이터 할당
//		// 변수 값은 수정
//		SeedData.title = titleContent
//		SeedData.diaryContent = diaryContent
//		SeedData.willRetrospected = true
//		toDoManager.updateSeed(newSeedData: Seed)
//	}
//	// else {
//		// 기존 데이터가 없을 경우가 없다고 가정 예외처리 해주지 않았는데 스트레스 테스트 후 에러가 난다면 추후 예외 처리
//	// }
//}
