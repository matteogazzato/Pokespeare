<!-- PROJECT LOGO -->
<br />
<p align="center">
<img src="Pokespeare.png" alt="Pokespeare" width="483" height="139">
  <h3 align="center">PokespeareSDK</h3>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
* [SDK](#sdk)
* [Exemple App](#example-app)
* [Requirements](#requirements)
* [TBD](#tbd)
* [Contact](#contact)
* [LICENSE](#license)

<!-- ABOUT THE PROJECT -->
## About The Project
PokespeareSDK exposes services useful to retrieve and visualize Pokemon sprites and descriptions in Shakespeare's style. All developer can now create thier own dramatist Pokédex!

<!-- SDK -->
## SDK
At the moment, the SDK has three main different features:
* given a Pokemon name returns its Shakespearean description;
* given a Pokemon name returns its sprite;
* let developers easily display Pokemon sprite and description in a built-in UI component.

PokespeareSDK works with [PokeApi](https://pokeapi.co/) to retrieve Pokemon sprites and Pokemon not-translated descriptions and [Funtranslations](https://funtranslations.com/api/shakespeare) to translate Pokemon description in Shakespearean style.

### Installation
#### CocoaPods

```ruby
target 'MyAwsomeApp' do
  pod 'PokespeareSDK', :git => 'https://github.com/matteogazzato/PokespeareSDK.git'
end
```

#### Manually
Move PokespeareSDK project in another workspace and link generated framework in his Build phases/Link Binary.

### Usage
```swift
import PokespeareSDK
...
let pokespeareSdk = PokespeareSDK()
let name = // Pokemon name

pokespeareSdk.retrieveDescription(ofPokemon: name) { (description, error) in
  // Handle description or possible error
  ...
}

pokespeare.retrieveSprite(ofPokemon: name) { (sprite, error) in
  // Handle sprite url or possible error
  ...
}

// UI component
let pokemonShakespeareanDescription = // Retrieved description
let pokemonSprite = // Retrieved url sprite
let infoDesc = InfoViewDescriptor(description: pokemonShakespeareanDescription,
                                  name: name,
                                  sprite: pokemonSprite)
let infoView = InfoView(frame: frame)
infoView.updateUI(withDescriptor: infoDesc)
// Add InfoView as subview on any UIView
```

### Project Structure
The project is composed by four targets:
* `PokespeareSDK`, the core;
* `PokespeareSDK_Tests`, all SDK tests;
* `PokespeareApp`, example app;
* `PokespeareApp_Tests`, all example app tests.

### Dependencies

#### RxSwift - RxCocoa
[RxSwift](https://github.com/ReactiveX/RxSwift) and its reactive programming approach was used to handle network layer asynchronous operations. Possibly it will be used for future implementations.

#### Alamofire
Network requests and responses are built on top of [Alamofire](https://github.com/Alamofire/Alamofire), a HTTP networking library used.  

#### Kingfisher
[Kingfisher](https://github.com/onevcat/Kingfisher) library was used to download and cache sprites images URLs, in particular to setup `UIImage` inside `InfoView`

#### SnapshotTesting
Both SDK and example app UI tests are performed using [SnapshotTesting](https://github.com/pointfreeco/swift-snapshot-testing), a powerful and easy to integrate library to test layout compliance based on a "snapshotting" approach.

### Tests
Select PokespeareSDK target and do a `cmd + U`.
Note about UI tests: as per [SnapshotTesting indications](https://github.com/pointfreeco/swift-snapshot-testing/blob/main/Documentation/Available-Snapshot-Strategies.md#image-10), snapshot must be compared using a simulator with the same OS, for this reason tests should be launched using iPhone 12 Pro.

<!-- Example App -->
## Example App
The project contains `PokespeareApp`, an example app that shows SDK functionalities.
1. Install [CocoaPods](https://guides.cocoapods.org/using/getting-started.html#getting-started)
2. Download/clone the project locally
3. Do a `pod install` from root project
4. Open `.xcworkspace`
5. Select `PokespeareApp` target
6. cmd + R
7. Search a Pokemon 😉

### Tests
Select PokespeareApp target and do a `cmd + U`.
Note about UI tests: as per [SnapshotTesting indications](https://github.com/pointfreeco/swift-snapshot-testing/blob/main/Documentation/Available-Snapshot-Strategies.md#image-10), snapshot must be compared using a simulator with the same OS, for this reason tests should be launched using iPhone 12 Pro.

#### Extras about PokespeareApp
`PokespeareApp` was realized using [VIPER](https://www.raywenderlich.com/8440907-getting-started-with-the-viper-architecture-pattern) approach as architecture pattern.

<!-- Requirements -->
## Requirements
Mminimum iOS version is 13.0 (default). Developed and tested using Xcode 12.4.

<!-- TBD -->
## TBD
* Swift Package Manager Support
* Add more Pokemon versions
* Update UI component as `@IBDesignable`
* More... 🦄

<!-- CONTACT -->
## Contacts
* Matteo Gazzato - matteogazzato@gmail.com

<!-- LICENSE -->
## LICENSE
PokespeareSDK is available under the MIT license. See the LICENSE file for more info.
