//
//  QuestionModel.swift
//  Simda
//
//  Created by Park Sungmin on 2022/10/04.
//

import Foundation

struct QuestionModel {
    var question: String
    var emotion: Int // Enum 타입으로 변경?
}

extension QuestionModel {
    static let dummyQuestion: [QuestionModel] = [
        QuestionModel(question: "오늘의 기분을 몇 점으로 표현할 수 있을까요?", emotion: 0),
        QuestionModel(question: "왜 기분이 좋았어요?", emotion: 0),
        QuestionModel(question: "왜 그런 기분이 들었나요?", emotion: 0),
        QuestionModel(question: "오늘은 재미있는 일들이 많았나요?", emotion: 0),
        QuestionModel(question: "왜 기분이 나빴어요?", emotion: 0),
        QuestionModel(question: "화나는 말을 듣고 어떤 생각을 했는지 이야기해줄래요?", emotion: 0),
    ]
}
