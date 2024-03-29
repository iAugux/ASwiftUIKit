import SwiftUI

public enum EitherShape<First: Shape, Second: Shape>: Shape {
    case first(First)
    case second(Second)

    public func path(in rect: CGRect) -> Path {
        switch self {
        case .first(let first):
            return first.path(in: rect)
        case .second(let second):
            return second.path(in: rect)
        }
    }
}

public enum EitherInsettableShape<First: InsettableShape, Second: InsettableShape>: InsettableShape {
    case first(First)
    case second(Second)

    public func path(in rect: CGRect) -> Path {
        switch self {
        case .first(let first):
            return first.path(in: rect)
        case .second(let second):
            return second.path(in: rect)
        }
    }

    public func inset(by amount: CGFloat) -> EitherInsettableShape<First.InsetShape, Second.InsetShape> {
        switch self {
        case .first(let first):
            return .first(first.inset(by: amount))
        case .second(let second):
            return .second(second.inset(by: amount))
        }
    }
}
