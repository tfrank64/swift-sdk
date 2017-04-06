/*:
 # Universal Translator

 In this playground, we will build a universal speech-to-speech translator.
 
 ![Star Trek Universal Translator](UniversalTranslator.jpg)
 
 Our universal translator will convert speech from one language to another. For example, we could convert English speech to French speech.
 
 Our universal translator will combine three Watson services for speech-to-speech translation:
 1. Speech to Text: Convert English audio to English text.
 2. Language Translator: Translate English text to French text.
 3. Text to Speech: Convert French text to French audio.
 
 ![Service Flowchart](Flowchart.png)
 
 We'll start by exploring each of the three services independently. Then we'll combine them to build our universal speech-to-speech translator.
 */

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

/*:
 ## Language Translator: Translate English Text to French Text
 
 The second step is to convert English text to French text using the Language Translator service.
 */

import PlaygroundSupport
import LanguageTranslatorV2

// Enable support for asynchronous completion handlers
PlaygroundPage.current.needsIndefiniteExecution = true

// Instantiate service
let languageTranslator = LanguageTranslator(
    username: Credentials.LanguageTranslatorUsername,
    password: Credentials.LanguageTranslatorPassword
)

// Translate from English to French
let text = "I'd like to reserve a table for two please"
languageTranslator.translate(text, from: "en", to: "fr") {
    translation in
    let french = translation.translations.first!.translation
}

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
    languageTranslator.translate(text.bestTranscript, from: "en", to: "fr") { translation in
        let text = translation.translations.first!.translation
        textToSpeech.synthesize(text, voice: "fr-FR_ReneeVoice") {
            audio in
            audioPlayer = try! AVAudioPlayer(data: audio)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
    }
}