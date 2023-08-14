# be_natura
Be Natura project.
Welcome to our healthy world! We are a group of friends who share a passion for a healthy lifestyle and are committed to bringing it to Murcia.

## Getting Started
Running demo:
https://be-natura-alpha.web.app/#/

## Deploy into alpha hosting
flutter build web --web-renderer html && firebase deploy --only hosting:be-natura-alpha

## To avoid cors with resources in bucket
gsutil cors set cors.json gs://bitutopy-84350.appspot.com

## Generate android app bundle
https://docs.flutter.dev/deployment/android
flutter build appbundle

## Generate ios ipa
https://docs.flutter.dev/deployment/ios
flutter build ipa
