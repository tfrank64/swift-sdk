//: [Previous](@previous)

/*:
 ## Speech to Text: Convert English Audio to English Text
 
 The first step is to turn English audio to English text using the Speech to Text service.
 */

import PlaygroundSupport
import SpeechToTextV1

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

// Instantiate service
let speechToText = SpeechToText(
    username: Credentials.SpeechToTextUsername,
    password: Credentials.SpeechToTextPassword
)

// Load audio recording
let recordingPath = Bundle.main.path(forResource: "ReserveTable", ofType: "wav")!
let recording = URL(fileURLWithPath: recordingPath)

// Transcribe audio recording
let settings = RecognitionSettings(contentType: .wav)
speechToText.recognize(audio: recording, settings: settings) {
    text in
    let bestTranscript = text.bestTranscript
}


//: [Next](@next)
