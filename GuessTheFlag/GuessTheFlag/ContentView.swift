//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Danny Espinoza Sanchez on 2/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showingGameCompleted = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State var questionNumber = 0
    private let maxNumberOfQuestions = 8
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)// modifier tells SwiftUI to render the original image pixels rather than trying to recolor them as a button
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
            
        }.ignoresSafeArea()
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
        .alert("Game completed",isPresented: $showingGameCompleted){
            Button("Try again?",action: resetValues)
        }message: {
            Text("Your final score is : \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score+=1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            if score > 0{
                score-=1
            }
        }
        questionNumber+=1
        if questionNumber < maxNumberOfQuestions {
            showingScore = true
        }else{
            showingGameCompleted = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetValues(){
        askQuestion()
        questionNumber = 0
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
