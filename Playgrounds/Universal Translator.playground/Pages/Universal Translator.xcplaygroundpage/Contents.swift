//: [Previous](@previous)

/*:
 ## All Together Now!
 
 Let's combine the three previous examples to create our universal speech-to-speech translator!
 */

import PlaygroundSupport
import AVFoundation
import SpeechToTextV1
import LanguageTranslatorV2
import TextToSpeechV1

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

// Instantiate services
let speechToText = SpeechToText(
    username: Credentials.SpeechToTextUsername,
    password: Credentials.SpeechToTextPassword
)
let languageTranslator = LanguageTranslator(
    username: Credentials.LanguageTranslatorUsername,
    password: Credentials.LanguageTranslatorPassword
)
let textToSpeech = TextToSpeech(
    username: Credentials.TextToSpeechUsername,
    password: Credentials.TextToSpeechPassword
)

// Load audio recording
let recordingPath = Bundle.main.path(forResource: "ReserveTable", ofType: "wav")!
let recording = URL(fileURLWithPath: recordingPath)

// Instantiate audio player
var audioPlayer: AVAudioPlayer?

// Translate recording to French
let settings = RecognitionSettings(contentType: .wav)
speechToText.recognize(audio: recording, settings: settings) { text in
    let bestTranscript = text.bestTranscript
    languageTranslator.translate(bestTranscript, from: "en", to: "fr") { translation in
        let text = translation.translations.first!.translation
        textToSpeech.synthesize(text, voice: "fr-FR_ReneeVoice") {
            audio in
            audioPlayer = try! AVAudioPlayer(data: audio)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
    }
}
