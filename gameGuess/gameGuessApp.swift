import SwiftUI
import Combine

class GuessingGame: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    let targetNumber: Int
    let range: ClosedRange<Int>
    
    init(range: ClosedRange<Int>) {
        self.range = range
        self.targetNumber = Int.random(in: range)
    }
    
    func guess(number: Int) -> GuessResult {
        if number == targetNumber {
            return .correct
        } else if number < targetNumber {
            return .tooLow
        } else {
            return .tooHigh
        }
    }
}

enum GuessResult {
    case correct
    case tooLow
    case tooHigh
}
