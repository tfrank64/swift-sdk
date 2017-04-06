//: [Previous](@previous)

/*:
 ## Text to Speech: Convert French Text to French Audio
 
 Finally, we convert the French text to French audio using the Text to Speech service.
 */

import PlaygroundSupport
import AVFoundation
import TextToSpeechV1

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

// Instantiate service
let textToSpeech = TextToSpeech(
    username: Credentials.TextToSpeechUsername,
    password: Credentials.TextToSpeechPassword
)

// Instantiate audio player
var audioPlayer: AVAudioPlayer?

// Synthesize text to spoken word
let text = "J'aimerais réserver une table pour deux veuillez"
textToSpeech.synthesize(text, voice: "fr-FR_ReneeVoice") {
    audio in
    audioPlayer = try! AVAudioPlayer(data: audio)
    audioPlayer?.prepareToPlay()
    audioPlayer?.play()
}

//: [Next](@next)
