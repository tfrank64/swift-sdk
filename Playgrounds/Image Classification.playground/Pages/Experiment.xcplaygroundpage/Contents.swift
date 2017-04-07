//: [Previous](@previous)

/*:
 ## Experiment:
 
 Try it out on your own! This page recreates the same example, but passes the image by URL instead of uploading it. Try out the service just by changing the URL!
 */

import PlaygroundSupport
import VisualRecognitionV3

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

let apiKey = Credentials.VisualRecognitionAPIKey
let version = "2017-04-06" // use today's date for the most recent version
let visualRecognition = VisualRecognition(apiKey: apiKey, version: version)

// Specify the image URL to classify
let image = "https://watson-developer-cloud.github.io/doc-tutorial-downloads/visual-recognition/fruitbowl.jpg"

let failure = { (error: Error) in print(error) }
visualRecognition.classify(image: image, failure: failure) { classifiedImages in
    let classes = classifiedImages.images.first!.classifiers.first!.classes
}
