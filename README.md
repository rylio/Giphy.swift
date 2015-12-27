[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
# Giphy.swift
A [Giphy](http://giphy.com/) API client in Swift.

## Usage

```swift

    let g = giphy(apiKey: Giphy.PublicBetaAPIKey)

    // Search

    g.search("dogs", limit: nil, offset: nil, rating: nil) { gifs, pagination, err in

        // Do something with gifs
    }

    // By id

    g.gif("1") { gifs, err in

        // Do something with gif
    }

    // Get multiple ids

    g.gifs(["asfasdf", adsfasdf]) { gifs, err in

        // Do something with gifs
    }

    // Translate text into a gif

    g.translate("cat", rating: nil) { gif, err in

        // Do something
    }

    // Get random gif

    g.random(tag: "optional tag", rating: nil) { gif, err in


    }

    // Get trending gifs

    g.trending(limit: nil, offset: nil, rating: nil) { gifs, pagination, err in

    }
```

## TODO
 - Include sticker API.
 - Demo application.

##License
Giphy.swift is released under the MIT license. See LICENSE for details.
