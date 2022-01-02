//: [Previous](@previous)

import CoreGraphics
import Foundation

struct Circle {
  var origin: CGPoint
  var radius: CGFloat
}

let circle = Circle(origin: .zero, radius: 10)
let rect = CGRect(origin: .zero, size: CGSize(width: 300, height: 200))

protocol Geometry {
  var origin: CGPoint { get set }
  func area() -> CGFloat
  func perimeter() -> CGFloat
}

extension Circle: Geometry {
  func area() -> CGFloat {
    return .pi * radius * radius
  }
  func perimeter() -> CGFloat {
    return 2 * .pi * radius
  }
}

extension CGRect: Geometry {
  func area() -> CGFloat {
    return size.width * size.height
  }
  func perimeter() -> CGFloat {
    return 2 * (size.width + size.height)
  }
}

let shapes: [Geometry] = [circle, rect]
let area = shapes.reduce(0) { $0 + $1.area() }
let perimeter = shapes.reduce(0) { $0 + $1.perimeter() }

//print(area)
print(perimeter)
