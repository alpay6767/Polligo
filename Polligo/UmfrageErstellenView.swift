//
//  UmfrageErstellenView.swift
//  Polligo
//
//  Created by Alpay Kücük on 28.10.21.
//

import SwiftUI

struct UmfrageErstellenView: View {
    
    @State private var frageString: String = ""
    @State var antwortenArray: [Question.Answer] = []
    
    var logo: some View {
        
        Text(Constants.logoString)
            .font(Font.custom(Constants.fontString, size: 40, relativeTo: .title))
            .foregroundColor(.white)
    }
    
    init() {
        UITableView.appearance().backgroundColor = UIColor(Color.init(Constants.colorString))
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack (alignment: .top){
                Color.init(Constants.colorString).ignoresSafeArea()
                VStack (alignment: .center, spacing: 10){
                    logo
                    Text("Was willst du fragen?")
                        .font(Font.custom(Constants.fontString, size: 20))
                        .foregroundColor(.white)
                    TextField("Frage ...", text: $frageString)
                        .padding()
                        .frame(width: geometry.size.width-70, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    Text("Deine Antwortmöglichkeiten:")
                        .font(Font.custom(Constants.fontString, size: 20))
                        .padding(.top, 20)
                        .foregroundColor(.white)
                    FrageHinzufuegenButton(name: "Antwort hinzufügen", buttonColor: Constants.umfrageColorString, textColor: .white) {
                        let newanswer = Question.Answer(content: "", id: 1)
                        self.antwortenArray.append(newanswer)
                    }
                    FrageHinzufuegenButton(name: "Speichern", buttonColor: Constants.teilnehmenColorString, textColor: .white) {
                        let currentq = Question(questionId: 1, ammountOfAnswers: antwortenArray.count, askedQuestion: frageString, isMultipleChoise: false, createAnswers: getContentOfAnswer(index:))

                        print(antwortenArray)
                        print(currentq.possibleAnswers)
                    }
                    
                    List {
                        ForEach(antwortenArray) { answer in
                            HStack {
                                AnswerRow(answer: answer)
                            }.frame(height: 70)                        }
                        .onDelete(perform: delete)
                    }.listStyle(InsetGroupedListStyle())
                    
                }

            }
        }
    }
    
    func getContentOfAnswer(index: Int) -> String {
        return antwortenArray[index].content
    }
    
    func delete(at offsets: IndexSet) {
        antwortenArray.remove(atOffsets: offsets)
    }

}



struct UmfrageErstellenView_Previews: PreviewProvider {
    static var previews: some View {
        UmfrageErstellenView()
    }
}

struct AnswerRow: View {
    @State var answer: Question.Answer
    @State var string = ""
    
    

    var body: some View {
        GeometryReader { geometry in

        TextField("Antwort ...", text: $string, onEditingChanged: { (changed) in
            self.answer.content = "Hi"
        }) {
            self.answer.content = "Bye"
        }
            .padding()
            .frame(width: geometry.size.width-70, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        }
    }
}
