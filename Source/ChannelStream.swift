// ChannelStream.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2015 Zewo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

@_exported import Venice

public final class ChannelStream: Stream {
    public let metadata: [String: Any] = [:]
    private let channel = FallibleChannel<Data>()

    public var closed: Bool {
        return channel.closed
    }

    public func receive(upTo byteCount: Int, timingOut deadline: Double = .never) throws -> Data {
        if closed {
            throw StreamError.closedStream(data: Data([]))
        }
        return try channel.receive()!
    }

    public func send(data: Data, timingOut deadline: Double = .never) throws {
        channel.send(data)
    }

    public func flush(timingOut deadline: Double = .never) throws {}

    public func close() -> Bool {
        return channel.close()
    }

    public init(stream: Stream throws -> Void) {
        co {
            do {
                try stream(self)
                self.close()
            } catch {
                self.channel.send(error)
            }
        }
    }
}