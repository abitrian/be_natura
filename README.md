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


08-22 13:13:26.551 E/AndroidRuntime(16633): FATAL EXCEPTION: main
08-22 13:13:26.551 E/AndroidRuntime(16633): Process: com.bitutopy.benatura, PID: 16633
08-22 13:13:26.551 E/AndroidRuntime(16633): java.lang.RuntimeException: Unable to instantiate application com.bitutopy.benatura.BeNatura: java.lang.ClassCastException: com.bitutopy.benatura.BeNatura cannot be cast to android.app.Application
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.app.LoadedApk.makeApplication(LoadedApk.java:1276)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.app.ActivityThread.handleBindApplication(ActivityThread.java:6848)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.app.ActivityThread.access$1500(ActivityThread.java:252)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.app.ActivityThread$H.handleMessage(ActivityThread.java:1999)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.os.Handler.dispatchMessage(Handler.java:106)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.os.Looper.loop(Looper.java:250)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.app.ActivityThread.main(ActivityThread.java:7886)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at java.lang.reflect.Method.invoke(Native Method)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at com.android.internal.os.RuntimeInit$MethodAndArgsCaller.run(RuntimeInit.java:592)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at com.android.internal.os.ZygoteInit.main(ZygoteInit.java:970)
08-22 13:13:26.551 E/AndroidRuntime(16633): Caused by: java.lang.ClassCastException: com.bitutopy.benatura.BeNatura cannot be cast to android.app.Application
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.app.AppComponentFactory.instantiateApplication(AppComponentFactory.java:76)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at androidx.core.app.CoreComponentFactory.instantiateApplication(Unknown Source:0)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.app.Instrumentation.newApplication(Instrumentation.java:1158)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	at android.app.LoadedApk.makeApplication(LoadedApk.java:1268)
08-22 13:13:26.551 E/AndroidRuntime(16633): 	... 9 more
08-22 13:13:26.601 I/Process (16633): Sending signal. PID: 16633 SIG: 9
Load Next