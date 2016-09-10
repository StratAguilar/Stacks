//
//  Stack.swift
//  
//
//  Created by Strat Aguilar on 9/10/16.
//
//

import Foundation


struct Stack<T>{
  
  private var stack: [T]
  
  var count: Int{
    return stack.count
  }
  
  var isEmpty: Bool{
    return stack.count == 0
  }
  
  init(){
    self.stack = []
  }
  
  mutating func push(value: T){
    stack.append(value)
  }
  
  mutating func pop() -> T?{
    if count < 1{
      return nil
    }
    return stack.removeLast()
  }
  
  func peak() -> T?{
    return stack.last
  }
  
}

extension Stack: ArrayLiteralConvertible{
  
  typealias Element = T
  
  init(arrayLiteral elements: Stack.Element...) {
    self.stack = []
    for element in elements{
      self.stack.append(element)
    }
  }
}

extension Stack: CustomStringConvertible{
  var description: String{
    return "\(stack)"
  }
}

extension Stack: SequenceType{
  typealias Generator = AnyGenerator<T>
  
  func generate() -> Generator {
    var index = 0
    return Generator{
      if index < self.count{
        let value = self.stack[index]
        index += 1
        return value
      }
      return nil
    }
  }
}


