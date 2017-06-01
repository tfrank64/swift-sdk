#!/bin/sh

xcodebuild build -scheme "RestKit" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" | xcpretty
xcodebuild test -scheme "AlchemyDataNewsV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "AlchemyLanguageV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "AlchemyVisionV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "ConversationV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "DialogV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "DiscoveryV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "DocumentConversionV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "LanguageTranslatorV2" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "NaturalLanguageClassifierV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "NaturalLanguageUnderstandingV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "PersonalityInsightsV2" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "PersonalityInsightsV3" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "RelationshipExtractionV1Beta" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "RetrieveAndRankV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "SpeechToTextV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "TextToSpeechV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "ToneAnalyzerV3" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "TradeoffAnalyticsV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
# bash <(curl -s https://codecov.io/bash)
xcodebuild test -scheme "VisualRecognitionV3" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES"
# bash <(curl -s https://codecov.io/bash)