---
collection: workshops
title: 'Icon and Splash Screens'
published: true
type: ionicextra
layout: workshoppost2
lab: ionic
length: 15 minutes
---



## Objective

* Create all of the image sizes needed for the icon and splash screen that Google and Apple require when submitting to the App Stores.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Background](#background)
- [Section 8.0: Download Project](#section-80-download-project)
- [Section 8.1: Adding Icon](#section-81-adding-icon)
- [Section 8.2: Adding Splash Screen Image](#section-82-adding-splash-screen-image)
- [Section 8.3: Updating the Icon and Splash Images](#section-83-updating-the-icon-and-splash-images)
- [Section 8.4: Generating Icon and Splash Images For All Platforms At Once](#section-84-generating-icon-and-splash-images-for-all-platforms-at-once)
- [Section 8.5: Testing Your Icon and Splash Screen on a Device](#section-85-testing-your-icon-and-splash-screen-on-a-device)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Background

When you release your application to the App stores you are going to want an icon and splash screen that is your own and not a default one.  However, the process of creating all of the different sizes that are required is time consuming.  If you are supporting both iOS and Android, you have to create 44 different image files.  Then if you have to update those images, you have to re-generate all of them.

To drastically speed this process up and make it easy, the folks developing the Ionic Framework, gave us a resource command that generates all of the correct sizes from a splash and icon file.

The icon image’s minimum dimensions should be 192×192 px and should have no rounded corners.  Template available at  [http://code.ionicframework.com/resources/icon.psd](http://code.ionicframework.com/resources/icon.psd)

Splash screen dimensions vary for each platform, device, and orientation, so a square source image is required to generate each of the various screen sizes. The source image’s minimum dimensions should be 2208×2208 px, and the artwork should be centered within the square, because each generated image will be center cropped into landscape and portrait images.  Template available at [http://code.ionicframework.com/resources/splash.psd](http://code.ionicframework.com/resources/splash.psd)


## Section 8.0: Download Project

The first step is to download the project that I have created for you that includes the icon and splash screen images.  The starter project is based on Lab 5 with an additional Resources and ResourceTemplate folders.

During this lab, you will be able to follow along using git to checkout the completed version of the steps in each section if you do not want to write all of the code yourself.

If you intend to use the completed version of the steps, you need to clone the repository for this lab.

    $ git clone https://github.com/IonicWorkshop/Lab8-ConfiguringIconAndSplashImages.git


## Section 8.1: Adding Icon

1. A pre-selected icon and splash screen images are in the Resources folder.
1. Open the config.xml file.
1. Open a terminal (OSx) or command prompt (Windows)
1. Navigate to the projet directory
1. To add android icons use:
        ionic resources android --icon
    * 6 icon sizes will be generated
1. You can see the changes in the config.xml file

    ![Lab8-ResourceAndroidIcons.png](images/Lab8/Lab8-ResourceAndroidIcons.png)

1. If you look in the Resources folder, you will notice that an android\icon folder has been added with all of the generated images.
1. To add ios icons, run the command:
        ionic resources ios --icon
    * 16 icon sizes will be generated
1. You can see these in the config.xml file

    ![Lab8-ResourceiOSIcons.png](images/Lab8/Lab8-ResourceiOSIcons.png)

1. If you look in the Resources folder, you will notice that an ios\icon folder has been added with all of the generated images.
1. A default icon was also added to the config.xml file in the root of the &lt;widget&gt; node.  The value will be the last icon that was generated.  (e.g. if iOS was last resource add then it will be the iOS icon)
        <icon src="resources/ios/icon/icon-small@3x.png"/>

## Section 8.2: Adding Splash Screen Image

1. Open the config.xml file.
1. To add android splash screen images use:
        ionic resources android --splash
    * 12 splash screen sizes will be generated
1. You can see these in the config.xml file

    ![Lab8-ResourcesAndroidSplash.png](images/Lab8/Lab8-ResourcesAndroidSplash.png)

1. If you look in the Resources folder, you will notice that an android\splash folder has been added with all of the generated images.
1. To add ios splash screen images use:
        ionic resources ios --splash
    * 10 icon sizes will be generated
1. You can see these in the config.xml file

    ![Lab8-ResourceiOSSplash.png](images/Lab8/Lab8-ResourceiOSSplash.png)

1. If you look in the Resources folder, you will notice that an ios\splash folder has been added with all of the generated images.


## Section 8.3: Updating the Icon and Splash Images

If you need to update either the icon or splash image, re-run the resource command.

## Section 8.4: Generating Icon and Splash Images For All Platforms At Once

1. If you have all of the required software to deploy to an emulator or device then you can generate all of the resource images add once. (See Section 8.5 below)

1. You need to add the platforms to your project

        ionic platform add android
        ionic platform add ios

1. Once the platforms have been successfully added, then the resource command becomes

        ionic resources

## Section 8.5: Testing Your Icon and Splash Screen on a Device

In order to test our the icons and splash screen images, you will need to deploy to either an emulator or a device.  To deploy to each platform, you have to install various pieces of software.

To test our the icon and splash screen, you need to run your application on a device or in an emulator.  Setting up all of the software can take several hours which is far more time than this workshop has.

Windows Setup: [http://digitaldrummerj.me/Ionic-Setup-Windows/](http://digitaldrummerj.me/Ionic-Setup-Windows/)


OSx Setup: [http://digitaldrummerj.me/ionic-setup-osx/](http://digitaldrummerj.me/ionic-setup-osx/)

Once you computer is setup for iOS and Android you can add platforms to your project and then run them in an emulator or on a device.

**Add Platforms to the Application**

    ionic platform add android
    ionic platform add ios

**Run on Device**

    ionic run android
    ionic run ios

<font color="red">Note:</font> For the ionic run ios command, you will have to setup all of the provision for your device through Apple before you can run it directly on your device.

**Run in Emulator**

    ionic emulate android
    ionic emulate ios

## Wrap-up

The resource command is a huge time saver.  The icon and splash screen setup now takes only a few minutes compared to hours before.