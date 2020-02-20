import Foundation
import NIO

// This has to be in a separate function as otherwise compiler can't figure it out.
private func internalJoin<T>(
    _ futures: [EventLoopFuture<T>],
    eventLoop: EventLoop = EmbeddedEventLoop()
) -> EventLoopFuture<[T]> {
    return EventLoopFuture.reduce(into: [], futures, on: eventLoop) { acc, cur in
        acc.append(cur)
    }
}

extension EventLoopFuture {
    public func flatMap<T>(futures closure: @escaping (Value) -> [EventLoopFuture<T>]) -> EventLoopFuture<[T]> {
        return self.flatMap { (value) -> EventLoopFuture<[T]> in
            let futures = closure(value)

            return EventLoopFuture.join(futures)
        }
    }
}

extension EventLoopFuture {
    public static func join<T>(
        _ futures: [EventLoopFuture<T>],
        eventLoop: EventLoop = EmbeddedEventLoop()
    ) -> EventLoopFuture<[T]> {
        internalJoin(futures, eventLoop: eventLoop)
    }
}
