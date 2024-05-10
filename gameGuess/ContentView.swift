import SwiftUI

struct ContentView: View {
    @State private var guess: String = ""
    @StateObject private var game = GuessingGame(range: 1...100)
    @State private var result: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter your guess", text: $guess)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            Button("Submit") {
                guard let number = Int(guess) else {
                    result = "Please enter a valid number"
                    return
                }
                
                let guessResult = game.guess(number: number)
                
                switch guessResult {
                case .correct:
                    result = "Congratulations! You guessed it!"
                case .tooLow:
                    result = "Too low! Try again."
                case .tooHigh:
                    result = "Too high! Try again."
                }
            }
            
            Text(result)
                .padding()
        }
        .padding()
    }
}
