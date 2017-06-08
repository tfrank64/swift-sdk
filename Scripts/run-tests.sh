#!/bin/bash

set -o pipefail
exitCode=0

function checkStatus {
    if [[ $exitCode == 0 && $1 != 0 ]]; then
        exitCode=$1
    fi
}

function uploadCodecov {
    bash <(curl -s https://codecov.io/bash)
}

cd ..
xcodebuild build -scheme "RestKit" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" | xcpretty
checkStatus $?
xcodebuild test -scheme "AlchemyDataNewsV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "AlchemyLanguageV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "AlchemyVisionV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "ConversationV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "DialogV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "DiscoveryV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "DocumentConversionV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "LanguageTranslatorV2" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "NaturalLanguageClassifierV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "NaturalLanguageUnderstandingV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "PersonalityInsightsV2" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "PersonalityInsightsV3" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "RelationshipExtractionV1Beta" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "RetrieveAndRankV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "SpeechToTextV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "TextToSpeechV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "ToneAnalyzerV3" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "TradeoffAnalyticsV1" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES" | xcpretty
checkStatus $? && uploadCodecov
xcodebuild test -scheme "VisualRecognitionV3" -sdk "$IOS_SDK" -destination "$IOS10_DESTINATION" -enableCodeCoverage "YES"
checkStatus $? && uploadCodecov

exit $exitCode