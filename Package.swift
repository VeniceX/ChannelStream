import PackageDescription

let package = Package(
    name: "ChannelStream",
    dependencies: [
        .Package(url: "https://github.com/VeniceX/Venice.git", majorVersion: 0, minor: 7)
    ]
)
