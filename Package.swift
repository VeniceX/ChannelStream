import PackageDescription

let package = Package(
    name: "ChannelStream",
    dependencies: [
        .Package(url: "https://github.com/ZewoFlux/Venice.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/ZewoFlux/CLibvenice.git", majorVersion: 0, minor: 2),
        .Package(url: "https://github.com/ZewoFlux/Stream.git", majorVersion: 0, minor: 2)
    ]
)
