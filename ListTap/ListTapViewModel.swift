//
//  ListTapVM.swift
//  ListTap
//
//  Created by Igor Łopatka on 26/09/2022.
//

import SwiftUI

@MainActor class ListTapViewModel: ObservableObject {
    
    @Published var listTapElements = [ListTapElement]()
    
    //Timer - Combine Publisher
    @Published var timerIsActive = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // https://www.hackingwithswift.com/books/ios-swiftui/triggering-events-repeatedly-using-a-timer
    
    // Perform action when timer is active
    func performActionOnTimer() {
        if timerIsActive {
            performAction()
        } else {
            timer.upstream.connect().cancel()
        }
    }
    
    // Performing action depending on count of elements
    func performAction() {
        if listTapElements.count < 5 {
            appendElement()
        } else {
            let randomIndex = Int.random(in: 0..<listTapElements.count)
            performRandomAction(index: randomIndex)
        }
    }
    
    
    // Creating new random element
    func element() -> ListTapElement {
        
        let colorsPossible = [Color.red, Color.blue]
        
        let randomColor = colorsPossible.randomElement()!
        let randomNumber = Int.random(in: 1...20)
        // The range is not specified in READ.ME
        
        if randomColor == Color.red {
            let element = ListTapElement(number: 3 * randomNumber, color: randomColor)
            return element
        } else {
            let element = ListTapElement(number: randomNumber, color: randomColor)
            return element
        }
    }
    
    // Performing random operation on existing element
    func performRandomAction(index: Int) {
        
        var action = FuncOnElement.increment
        action = randomFunc()
        
        switch action {
        case .increment:
            incrementElement(index: index)
        case .reset:
            resetElement(index: index)
        case .delete:
            deleteElement(index: index)
        case .addValue:
            addValueOfElementBefore(index: index)
        }
    }
    
    // Randomizing actions
    func randomFunc() -> FuncOnElement {

        var randomFuncs = [FuncOnElement]()

        randomFuncs += Array(repeating: .increment, count: 5)
        randomFuncs += Array(repeating: .reset, count: 3)
        randomFuncs += Array(repeating: .delete, count: 1)
        randomFuncs += Array(repeating: .addValue, count: 1)

        return randomFuncs.randomElement()!
    }
    // https://stackoverflow.com/questions/61981570/coding-probability-in-swift

    
    enum FuncOnElement {
        case increment, reset, delete, addValue
    }
    
    // Functions performing operations on existing elements
    func appendElement() {
        let newElement = element()
        listTapElements.append(newElement)
    }
    
    func incrementElement(index: Int) {
        listTapElements[index].number += 1
    }
    
    func resetElement(index: Int) {
        listTapElements[index].number = 0
    }
    
    func deleteElement(index: Int) {
        listTapElements.remove(at: index)
    }
    
    func addValueOfElementBefore(index: Int) {
        if index != 0 {
            let numberBefore = listTapElements[index - 1].number
            listTapElements[index].number += numberBefore
        }
    }
}


