// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SwipeTransition",
  products: [
    // Products define the executables and libraries produced by a package, and make them visible to other packages.
    .library(
      name: "SwipeTransition",
      targets: ["SwipeTransition"]
    ),
    .library(
      name: "SwipeTransitionAutoSwipeToDismiss",
      targets: ["SwipeTransitionAutoSwipeToDismiss"]
    ),
    .library(
      name: "SwipeTransitionAutoSwipeBack",
      targets: ["SwipeTransitionAutoSwipeBack"]
    ),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages which this package depends on.
    .target(
      name: "SwipeTransitionObjC",
      dependencies: [],
      path: "Sources/SwipeTransition/objC",
      cSettings: [
        .headerSearchPath("Internal"),
      ]
    ),
    .target(
      name: "SwipeTransition",
      dependencies: ["SwipeTransitionObjC"],
      path: "Sources/SwipeTransition",
      exclude: ["objC"]
    ),
    .target(
      name: "SwipeTransitionAutoSwipeToDismiss",
      dependencies: ["SwipeTransition"],
      path: "Sources/Automation/AutoSwipeToDismiss",
      cSettings: [
        .headerSearchPath("Internal"),
      ]
    ),
    .target(
      name: "SwipeTransitionAutoSwipeBack",
      dependencies: ["SwipeTransition"],
      path: "Sources/Automation/AutoSwipeBack",
      cSettings: [
        .headerSearchPath("Internal"),
      ]
    ),
  ]
)