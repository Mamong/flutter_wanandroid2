buildscript {
    //ext.kotlin_version = '1.9.0'
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        //classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version")
        //classpath('com.google.gms:google-services:4.4.1')
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

//它通常用于定义项目中模块使用的插件的通用版本。
plugins {

    /**
     * Use `apply false` in the top-level build.gradle file to add a Gradle
     * plugin as a build dependency but not apply it to the current (root)
     * project. Don't use `apply false` in sub-projects. For more information,
     * see Applying external plugins with same version to subprojects.
     */
}

val newBuildDir: Directory =
        rootProject.layout.buildDirectory
                .dir("../../build")
                .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

