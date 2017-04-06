/*:
 # Visual Recognition
 
 The IBM Watson Visual Recognition service uses deep learning algorithms to analyze images for scenes, objects, faces, and other content. The response includes keywords that provide information about the content.
 
 A set of built-in classes provides highly accurate results without training. You can train custom classifiers to create specialized classes. You can also create custom collections of your own images, and then upload an image to search the collection for similar images.
 
 The following image shows the process of creating and using a custom classifier.
 
 ![Using the Visual Recognition Service](vr-process2.png)
 */

/*:
 # Example
 
 In this playground, we will use the Visual Recognition service to classify objects in an image.
 
 Let's take a look at the image that we will classify.
 
 ![Fruit Bowl](fruitbowl.jpg)
 
 We will upload this image to the Visual Recognition service and print the response.
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