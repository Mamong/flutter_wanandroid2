/**
 * The first section in the build configuration applies the Android Gradle plugin
 * to this build and makes the android block available to specify
 * Android-specific build options.
 */
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // Add the Google services Gradle plugin
    id("com.google.gms.google-services")
}

/**
 * Locate (and possibly download) a JDK used to build your kotlin
 * source code. This also acts as a default for sourceCompatibility,
 * targetCompatibility and jvmTarget. Note that this does not affect which JDK
 * is used to run the Gradle build itself, and does not need to take into
 * account the JDK version required by Gradle plugins (such as the
 * Android Gradle Plugin)
 */
//kotlin {
//    jvmToolchain(11)
//}


/**
 * The android block is where you configure all your Android-specific
 * build options.
 */
android {
    /**
     * The app's namespace. Used primarily to access app resources.
     */
    namespace = "com.lion.flutterWanandroid"
    /**
     * compileSdk specifies the Android API level Gradle should use to
     * compile your app. This means your app can use the API features included in
     * this API level and lower.
     */
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    /**
     * To override source and target compatibility (if different from the
     * toolchain JDK version), add the following. All of these
     * default to the same value as kotlin.jvmToolchain. If you're using the
     * same version for these values and kotlin.jvmToolchain, you can
     * remove these blocks.
     */
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    /**
     * The defaultConfig block encapsulates default settings and entries for all
     * build variants and can override some attributes in main/AndroidManifest.xml
     * dynamically from the build system. You can configure product flavors to override
     * these values for different versions of your app.
     */
    defaultConfig {
        // Uniquely identifies the package for publishing.
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.lion.flutterWanandroid"

        // Defines the minimum API level required to run the app.
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
        minSdk = flutter.minSdkVersion

        // Specifies the API level used to test the app.
        targetSdk = flutter.targetSdkVersion
        // Defines the version number of your app.
        versionCode = flutter.versionCode
        // Defines a user-friendly version name for your app.
        versionName = flutter.versionName
    }

    /**
     * The buildTypes block is where you can configure multiple build types.
     * By default, the build system defines two build types: debug and release. The
     * debug build type is not explicitly shown in the default build configuration,
     * but it includes debugging tools and is signed with the debug key. The release
     * build type applies ProGuard settings and is not signed by default.
     */
    buildTypes {

        /**
         * By default, Android Studio configures the release build type to enable code
         * shrinking, using minifyEnabled, and specifies the default ProGuard rules file.
         */
        getByName("release") {
//            isMinifyEnabled = true // Enables code shrinking for the release build type.
//            proguardFiles(
//                getDefaultProguardFile("proguard-android.txt"),
//                "proguard-rules.pro"
//            )

            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    /* The productFlavors block is where you can configure multiple product flavors.
    * This lets you create different versions of your app that can
    * override the defaultConfig block with their own settings. Product flavors
    * are optional, and the build system does not create them by default.
    *
    * This example creates a free and paid product flavor. Each product flavor
    * then specifies its own application ID, so that they can exist on the Google
    * Play Store or an Android device simultaneously.
    *
    * If you declare product flavors, you must also declare flavor dimensions
    * and assign each flavor to a flavor dimension.
    */

//    flavorDimensions += "tier"
//    productFlavors {
//        create("free") {
//            dimension = "tier"
//            applicationId = "com.example.myapp.free"
//        }
//
//        create("paid") {
//            dimension = "tier"
//            applicationId = "com.example.myapp.paid"
//        }
//    }
}

flutter {
    source = "../.."
}

/**
 * The dependencies block in the module-level build configuration file
 * specifies dependencies required to build only the module itself.
 * To learn more, go to Add build dependencies.
 */
dependencies {
    // Import the Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:32.8.0"))
    // TODO: Add the dependencies for Firebase products you want to use
    // When using the BoM, don't specify versions in Firebase dependencies
    implementation("com.google.firebase:firebase-analytics")
    // Add the dependencies for any other desired Firebase products
    // https://firebase.google.com/docs/android/setup#available-libraries
}
