import Foundation
import NIO

func join<T>(
    _ futures: [EventLoopFuture<T>],
    eventLoop: EventLoop = EmbeddedEventLoop()
) -> EventLoopFuture<[T]> {
    return EventLoopFuture.reduce([], futures, on: eventLoop) { acc, cur in
        return acc + [cur] // TODO: Make sure this is more optimal.
    }
}

extension EventLoopFuture {
    func flatMap<T>(_ closure: @escaping (Value) -> [EventLoopFuture<T>]) -> EventLoopFuture<[T]> {
        return self.flatMap { (value) -> EventLoopFuture<[T]> in
            let futures = closure(value)

            return join(futures)
        }
    }
}
