//
//  Question.swift
//  Polligo
//
//  Created by Metin Atac on 27.10.21.
//

import Foundation

struct Question{

    var id: Int
    let askedQuestion: String
    private(set) var possibleAnswers: [Answer]
    let multipleChoise: Bool

    var ammountAnsweredQuestions: Dictionary<String, Int> = [String:Int]()
 

    init(questionId: Int, ammountOfAnswers: Int,askedQuestion: String,isMultipleChoise: Bool, createAnswers: (Int)-> String){
        self.id = questionId
        self.multipleChoise = isMultipleChoise
        self.askedQuestion = askedQuestion
        possibleAnswers = []
        for index in 0..<ammountOfAnswers{
            let content = createAnswers(index)
            possibleAnswers.append(Answer(content: content, id: index))
        }
    }

   mutating func choose(_ answer: Answer){
        if let choosenIndex = possibleAnswers.firstIndex(where: {$0.id == answer.id}){
            possibleAnswers[choosenIndex].isChoosen.toggle()
            if possibleAnswers[choosenIndex].isChoosen{
                if  let currentAmmountOfChooses = ammountAnsweredQuestions[possibleAnswers[choosenIndex].content]{
                    ammountAnsweredQuestions[possibleAnswers[choosenIndex].content] = currentAmmountOfChooses + 1
                }
            }else{
                if  let currentAmmountOfChooses = ammountAnsweredQuestions[possibleAnswers[choosenIndex].content]{
                    ammountAnsweredQuestions[possibleAnswers[choosenIndex].content] = currentAmmountOfChooses - 1
                }
            }
        }

    }

    struct Answer: Identifiable{
        var isChoosen: Bool = false
        var content: String
        let id: Int

    }


}
