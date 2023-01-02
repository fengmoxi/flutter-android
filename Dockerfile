FROM cirrusci/flutter:stable

ENV PUB_HOSTED_URL=https://pub.flutter-io.cn \
    FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

RUN sudo apt-get update -y

RUN flutter precache

RUN yes | sdkmanager \
    "platforms;android-30" \
    "platforms;android-31" \
    "platforms;android-32" \
    "platforms;android-33" \
    "build-tools;30.0.3" \
    "build-tools;31.0.0" \
    "build-tools;32.0.0" \
    "build-tools;33.0.1" \
    "extras;google;m2repository" \
    "extras;android;m2repository"

RUN sdkmanager --update --verbose

RUN yes | sdkmanager --licenses
