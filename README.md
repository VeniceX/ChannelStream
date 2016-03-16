ChannelStream
=============

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![License][mit-badge]][mit-url]
[![Slack][slack-badge]][slack-url]

**ChannelStream** is a stream which mimics the behaviour of channels.

## Usage

You can send inside the closure and receive outside the closure.

```swift
let channelStream = ChannelStream { stream in
    try stream.send("hello")
}

let hello = try channelStream.receive()
```

Or you can send outside the closure and receive inside the closure.

```swift
let channelStream = ChannelStream { stream in
    let hello = try stream.receive()
}

try channelStream.send("hello")
```

Or you can do both at the same time.

```swift
let channelStream = ChannelStream { stream in
    let hello = try stream.receive()
    try stream.send("goodbye")
}

try channelStream.send("hello")
let goodbye = try channelStream.receive()
```

A good usage example of `ChannelStream` is generating an HTTP response body dynamically.

```swift
import HTTPServer
import ChannelStream

try Server { _ in
    let stream = ChannelStream { stream in
        for i in 0 ..< 100 {
            try stream.send("\(i)")
    	}
    }
    return Response(body: stream)
}.start()
```

## Installation

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://github.com/Zewo/ChannelStream.git", majorVersion: 0, minor: 4)
    ]
)
```

## Community

[![Slack](http://s13.postimg.org/ybwy92ktf/Slack.png)](http://slack.zewo.io)

Join us on [Slack](http://slack.zewo.io).

License
-------

**ChannelStream** is released under the MIT license. See LICENSE for details.

[swift-badge]: https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platform-Mac%20%26%20Linux-lightgray.svg?style=flat
[platform-url]: https://swift.org
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license
[slack-image]: http://s13.postimg.org/ybwy92ktf/Slack.png
[slack-badge]: https://zewo-slackin.herokuapp.com/badge.svg
[slack-url]: http://slack.zewo.io
