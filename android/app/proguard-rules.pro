# =========================================
# MediaPipe / AutoValue / JavaPoet FIX
# =========================================

# Mantém classes de annotation processing usadas pelo MediaPipe
-keep class javax.lang.model.** { *; }
-dontwarn javax.lang.model.**

-keep class com.google.auto.value.** { *; }
-dontwarn com.google.auto.value.**

-keep class autovalue.shaded.** { *; }
-dontwarn autovalue.shaded.**

-keep class com.squareup.javapoet.** { *; }
-dontwarn com.squareup.javapoet.**

# Mantém MediaPipe
-keep class com.google.mediapipe.** { *; }
-dontwarn com.google.mediapipe.**

# Mantém protobuf (MediaPipe usa internamente)
-keep class com.google.protobuf.** { *; }
-dontwarn com.google.protobuf.**
