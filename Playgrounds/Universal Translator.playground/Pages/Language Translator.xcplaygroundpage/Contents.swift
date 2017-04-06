//: [Previous](@previous)

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

//: [Next](@next)
