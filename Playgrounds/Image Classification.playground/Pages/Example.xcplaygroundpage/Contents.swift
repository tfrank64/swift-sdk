//: [Previous](@previous)

/*:
 ## Example
 
 On this playground page, we will use the Visual Recognition service to classify objects in an image. Let's take a look at the image that we will classify. Then we will upload this image to the Visual Recognition service and print the response.
 
 ![Fruit Bowl](fruitbowl.jpg)
 */

import PlaygroundSupport
import VisualRecognitionV3

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

let apiKey = Credentials.VisualRecognitionAPIKey
let version = "2017-04-06" // use today's date for the most recent version
let visualRecognition = VisualRecognition(apiKey: apiKey, version: version)

let imagePath = Bundle.main.path(forResource: "fruitbowl", ofType: "jpg")!
let image = URL(fileURLWithPath: imagePath)

let failure = { (error: Error) in print(error) }
visualRecognition.classify(imageFile: image, failure: failure) { classifiedImages in
    let classes = classifiedImages.images.first!.classifiers.first!.classes
}

//: [Next](@next)
