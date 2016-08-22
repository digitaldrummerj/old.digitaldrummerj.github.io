---
layout: post
title: Ionic v2 - Setup on OSx
published: true
categories: [ionic]
date: 2016-08-14 06:01
excerpt: | 
    If you are like me and just starting to work with the Ionic Framework and don’t already have a machine setup to do Android, iOS, Node, etc development then many of the guides out there leave out a number of steps that you need to do in order to get everything working.
    
    Even being a Windows user I was able to pretty easily get Ionic working on a Mac.  The only difference between the Windows setup and the OSx setup is that you can build for an iOS device on a Mac.  
---

{% assign imagedir = "/images/ionic2-osx/" | prepend: site.baseurl | prepend: site.url %}

If you are like me and just starting to work with the Ionic Framework and don’t already have a machine setup to do Android, iOS, Node, etc development then many of the guides out there leave out a number of steps that you need to do in order to get everything working.

Even being a Windows user I was able to pretty easily get Ionic working on a Mac.  The only difference between the Windows setup and the OSx setup is that you can build for an iOS device on a Mac.

## General Install Steps

For the first part of this tutorial, we will be installing everything to do Ionic development and test your application in Google Chrome.  This will be how you will do about 80% of your development since deploying to a device or emulator can be time consuming.

### Node 

1. Download the LTS version of node from [https://www.nodejs.org](https://www.nodejs.org)
        * If you are using Chrome to download, it may tell you that a file with a pkg extension could be harmful to your computer and ask if you want to keep the file.  Make sure to click on the keep button.
1. After the download completes, double-click on the pkg file to run it
1. Click Continue

    ![NodeJs Install Screen 1]({{ "node-1.png" | prepend: imagedir }})

1. Click Continue

    ![NodeJs Install Screen 2]({{ "node-2.png" | prepend: imagedir }})

1. Click Agree

    ![NodeJs Install Screen 3]({{ "node-3.png" | prepend: imagedir }})

1. Click Install

    ![NodeJs Install Screen 4]({{ "node-4.png" | prepend: imagedir }})

1. Fill in your login user name and password and click "Install Software" 

    ![NodeJs Install Screen 5]({{ "node-5.png" | prepend: imagedir }})

1. It will take a few minutes for NodeJs to install.  Once it does, click the Close button

    ![NodeJs Install Screen 6]({{ "node-6.png" | prepend: imagedir }})

1. Open a terminal and run the following to verify that node and npm was installed and is available from the command line

        node -v
        npm -v

> As of the writing of this post, you should have gotten node v4.5.0 and npm 2.15.9

### Npm Packages

Next we need to install 3 npm packages for cordova, gulp and ionic@beta.  At the time of this publication, ionic is on beta version 11.  

1. Open a terminal and run the following commands to install the Global NPM packages that we need:

        sudo npm install -g cordova
        sudo npm install -g gulp
        sudo npm install -g ionic@beta

1. Open a terminal and run the following to verify that node and npm was installed and is available from the command line

        cordova -v
        gulp -v
        ionic -v

> As of the writing of this post, you should have gotten cordova 6.3.1, ionic 2.0.0-beta.37 and gulp 3.9.1
  
### Google Chrome

1. Download from  [https://www.google.com/chrome/browser/desktop/]\(https://www.google.com/chrome/browser/desktop/)
1. Double click the dmg file to run it
1. Drag the Google Chrome icon to the Application folder

    ![Google Chrome drag to Application folder]({{ "chrome-1.png" | prepend: imagedir }})

### Visual Studio Code 

1. Download from [https://code.visualstudio.com/](https://code.visualstudio.com)

    ![VSCode Download]({{"vscode-download.png" | prepend: imagedir }})

1. Double-click on the downloaded archive to expand the contents.
1. Drag Visual Studio Code.app to the Applications folder, making it available in the Launchpad.
1. Add VS Code to your Dock by right-clicking on the icon and choosing Options, Keep in Dock.
1. Open Visual Studio Code
1. Open the Command Palette (⇧⌘P) and type shell command to find the Shell Command: Install 'code' command in PATH command and double-click on it.

    ![VSCode install code shell command]({{ "vscode-cli.png" | prepend: imagedir }})

1. Open the Command Palette (⇧⌘P) and type ext command to find the  Extensions: Install Extensions and double-click on it.

    ![VSCode Open Extensions: Install Extensions]({{"vscode-ext.png" | prepend: imagedir }})

1. Enter Cordova into the search box, find the Cordova Tools from Microsoft, and click the Install button

    ![VSCode Install Cordova Extensions]({{"vscode-ext-cordova.png" | prepend: imagedir }})

1. When the install is completed, the Enable button will be available and will restart Visual Studio Code to make the extension after.

    ![VSCode Install Cordova Tools Enable]({{"vscode-ext-enable.png" | prepend: imagedir }})

1. Click Ok on the confirmation prompt

    ![VSCode Extension Enable Confirmation]({{"vscode-ext-enable-confirm.png" | prepend: imagedir }})

1. Visual Studio Code will restart and the extensions will be enabled

### Validating General Install Steps

1. Open terminal
1. Navigate the directory where you store you development projects (I use /users/[Your Username]/projects) 
1. Run the following command to generate an ionic v2 project based on the tabs template

        ionic start todo tabs --v2

1. cd into todo  (directory was created by the ionic start command)

1. We are going to run is to make sure that we can run the todo app in the web browser by running:

        ionic serve --lab

1. This will start up a node based web server and the --lab will tell it to launch a page that shows what the app would look like on an iOS, Android and Windows phone.  Granted the node based serve is about 80% accurate but good enough to do a majority of our testing.  Ultimately you should test on a device before releasing into the app stores.         

At this point, we can create ionic projects and test them in a web browser.  Next we need to setup Android development and then we will setup iOS development.

## Android Setup Steps

In this section, we will be installing everything that is needed in order to deploy your application to an Android device or emulator.  We will be installing JDK8, Android Studio, Android SDK, Gradle, and Genymotion.

### JDK 8
	
1. Open a web brower and navigate to [http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
1. Download the Java SE Development Kit 8u101 for Mac OSx
1. Open the dmg file after it downloads
1. Double Click on the icon

    ![JDK8 Install Screen 1]({{ "jdk8-1.png" | prepend: imagedir }})

1. Click continue

    ![JDK8 Install Screen 2]({{ "jdk8-2.png" | prepend: imagedir }})

1. Click Install

    ![JDK8 Install Screen 3]({{ "jdk8-3.png" | prepend: imagedir }})

1. Fill in your login user name and password and click "Install Software" 

    ![JDK8 Install Screen 4]({{ "jdk8-4.png" | prepend: imagedir }})

1. Wait for the install to complete

    ![JDK8 Install Screen 5]({{ "jdk8-5.png" | prepend: imagedir }})

1. Click the Close button

    ![JDK8 Install Screen 6]({{ "jdk8-6.png" | prepend: imagedir }})

1. Open a terminal and run the following to verify that you can run java from the command line

        javac -version

1. Open up the vi editor and edit your bash profile.  We need to add in the JAVA_HOME environment variable

        vi ~/.bash_profile

1. To edit in vi hit `i` to enter edit mode and add the text below to the .bash_profile 

        export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home

1. Press the `esc` key to exit edit mode
1. Press `:` (colon key) to enter command mode. 
1. type `wq` and press enter to save and exit vi
1. Run the following to make the change active in your existing session

        source ~/.bash_profile

1. Test it by running

        echo $JAVA_HOME

1. If a value comes back that return /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home than you are ready to move on.

### Android SDK
	
1. Download from [https://developer.android.com/studio/index.html#downloads](https://developer.android.com/studio/index.html#downloads_
1. Open a terminal
1. Run the following to unzip the android sdk to the Development directory that is under your user home directory

        unzip ~/Downloads/android-sdk_r24.4.1-macosx.zip -d ~//Development

1. Open up the vi editor and edit your bash profile.  We need to add in the JAVA_HOME environment variable

        vi ~/.bash_profile

1. To edit in vi hit `i` to enter edit mode and add the text below to the .bash_profile 

        export PATH=${PATH}:~/Development/android-sdk-macosx/tools:~/Development/android-sdk-macosx/platform-tools

1. Press the `esc` key to exit edit mode
1. Press `:` (colon key) to enter command mode. 
1. type `wq` and press enter to save and exit vi
1. Run the following to make the change active in your existing session

        source ~/.bash_profile

1. Test it by running

        echo $PATH

1. Make sure that the end of the path include the android-sdk-macosx directories that we added to the $PATH environment variable.
1. Run the following to install the Android Apis

        echo 'y' | android update sdk --filter tools,platform-tools,android-24,build-tools-24.0.1 --all --no-ui

### Android Studio
	
1. Download from [https://developer.android.com/studio/index.html#downloads](https://developer.android.com/studio/index.html#downloads).  Version 2.1.3 as of this writing.
 
    ![Android Studio Download]({{"android-studio-download.png" | prepend: imagedir }})

1. Double-click on the dmg file after it downloads
1. Drag the Android Studio Icon to the Applications folder

    ![Android Studio icon drag to Applications]({{"android-studio-1.png" | prepend: imagedir }})

1. In the Applications folder, launch the Android Studio Application

    ![Android Studio icon in Applications folder]({{"android-studio-2.png" | prepend: imagedir }})

1. In the Complete installation dialog, select "I do not have a previous version of Studio or I do not want to import my settings" 

    ![Complete Installation selection]({{ "android-studio-3.png" | prepend: imagedir }})

1. Click Next

    ![Android Studio Setup Wizard Step 1]({{"android-studio-4.png" | prepend: imagedir }})

1. Select Standard for the setup type

   ![Android Setup type.  select Standard]({{"android-studio-5.png" | prepend: imagedir }})

1. ????? Complete me with screenshots and text ??????

### Virtualbox 

In order to run the Genymotion emulator, we need to install Virtualbox.

1. Navigate to [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads) and click on the install link for OSx and the extension package

    ![Virtualbox Download Page]({{ "virtualbox-download.png" | prepend: imagedir }})

1. Click on the Virtualbox dmg file after it downloads
1. Double-click on the Virtualbox Icon

    ![Virtualbox Icon]({{ "virtualbox-1.png" | prepend: imagedir }})

1. Click the Continue button to determine if it can install Virtualbox

    ![Virtualbox Install dialog to see if you can proceed with install]({{ "virtualbox-3.png" | prepend: imagedir }})

1. Click Continue

    ![Virtualbox Install Intro]({{ "virtualbox-4.png" | prepend: imagedir }})

1. Click Install

    ![Virtualbox Install Space Needed]({{ "virtualbox-5.png" | prepend: imagedir }})

1. Fill in your login user name and password and click "Install Software" 

    ![Virtualbox Install Username and Password Dialog]({{ "virtualbox-6.png" | prepend: imagedir }})

1. Click Close 

    ![Virtualbox Install Completed]({{ "virtualbox-8.png" | prepend: imagedir }})

1. In the Virtualbox Windows from the dmg file, double-click on the Applications, find Virtualbox and launch it.

    ![Virtualbox Run Application folder]({{"virtualbox-2.png" | prepend: imagedir }})

### Genymotion 

1. Download Genymotion from [https://www.genymotion.com/thank-you-freemium/](https://www.genymotion.com/thank-you-freemium/).  Version 2.7.2 as of this writing. 
1.  Click the "Download Genymotion package"

    ![Genymotion Download Genymotion package button]({{"genymotion-download.png" | prepend: imagedir }})
    
1. You will need to sign up for an account if you do not already have one

    ![Genymotion Account signin]({{"genymotion-download-signin.png" | prepend: imagedir }})

1. After creating the account and logging in, click on the "Download the Mac OSX" button 

    ![Genymotion download osx]({{"genymotion-download-osx.png" | prepend: imagedir }})

1. Once Genymotion is downloaded, launch the dmg file
1. Drag Genymotion and Genymotion Shell to the Applications folder

    ![Genymotion copy to Applications folder]({{"genymotion-install-1.png" | prepend: imagedir }})

1. After Genymotion is installed, open up the Applicaton folder and launch the Genymotion UI 

    ![Genymotion Application Icon]({{"genymotion-app-icon.png" | prepend: imagedir }})

1. On the Usage notice dialog click Accept 

    ![Genymotion Usage Agreement Dialog]({{"genymotion-app-license-agree.png" | prepend: imagedir }})

1. Click on the Yes button on the "You don't have any devices dialog"        

    ![Genymotion Yes to add a new device]({{"genymotion-app-add-new.png" | prepend: imagedir }})

1. Click the Sign in button

    ![Genymotion Signin button]({{"genymotion-app-sign-in.png" | prepend: imagedir }})

1. Input your account information that you create as part of the Genymotion download. 

    ![Genymotion add new device accoun sign in]({{"genymotion-app-add-new-signin.png" | prepend: imagedir }})

1. After you are logged in, from the Android Version drop down select 6.0.0

    ![Android Version Dropdown]({{"genymotion-app-android-version.png" | prepend: imagedir }})

1. Then select a device from the available list and click next.  In this case I selected the "Custom Phone - 6.0.0 - 768x1280"

    ![Genymotion Available Virtual devices]({{"genymotion-app-download-device.png" | prepend: imagedir }})
    
1. It will take several minutes to download the virtual device.  When the download is done, click the Finish button

    ![Genymotion Virtual device install finished]({{"genymotion-app-add-new-finished.png" | prepend: imagedir }})
    
### Gradle

1. Follow the Gradle install guide at [https://docs.gradle.org/current/userguide/installation.html](https://docs.gradle.org/current/userguide/installation.html)

### Verify Android Setup

Next we are going to test our Android device setup.  The first thing we need to do is tell ionic that we want to add the Android platform to our todo app by running:

        ionic platform add android

This sets up the todo app to be able to be build and deployed to an Android device.  To validate that we can build for Android, run the following:

        ionic build android

The last thing we need to verify is that we can deploy the todo app to the Genymotion Emulator.  Before we can deploy the application, we need to start up Genymotion Device that we want to deploy to.

1. Once the Genymotion device is started, you can deploy to it by running:

        ionic run android
        
You are now ready to go create your ionic applications.


## iOS Setup Steps

1. Install Xcode from app store.  This will take awhile since it is ~2 gigs in size.
	- Once install is completed, open xcode and accept the license
1. Install the iOS Simulator that Ionic will use.

    npm install -g ios-sim

    > You may need to start the npm install command with sudo depending on your node setup.

1. Install the iOS Deploy npm package

    npm install -g ios-deploy

    > You may need to start the npm install command with sudo depending on your node setup.

## Verifying iOS Setup

1. Open terminal
1. Navigate the directory where you store you development projects (I use /users/[Your Username]/projects) 
1. Run the following command to generate an ionic v2 project based on the tabs template

     ionic start todo tabs --v2

1. cd into todo  (directory was created by the ionic start command)

The first test that we are going to run is to make sure that we can test the todo app that we generated in the web browser by running:

        ionic serve --lab

This will start up a node based web server and the --lab will tell it to launch a page that shows what the app would look like on an iOS, Android and Windows phone.  Granted the node based serve is about 80% accurate but good enough to do a majority of our testing.  Ultimately you should test on a device before releasing into the app stores.         

Next we are going to test our iOS device setup.  The first thing we need to do is tell ionic that we want to add the iOS platform to our todo app by running:

        ionic platform add ios

This sets up the todo app to be able to be build and deployed to an iOS device.  To validate that we can build for iOS, run the following:

        ionic build ios

The last thing we need to verify is that we can deploy the todo app to the iOS Simulator.  

1. For the iOS Simulator, run the following: 

    ionic run ios

You are now ready to go create your ionic applications.
