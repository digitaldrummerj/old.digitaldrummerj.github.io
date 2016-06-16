---
layout: post
title: 'Running Multiple Version of Node On Windows'
date: 2016-06-04 06:00
categories: ['nodejs']
published: true
excerpt: |


---

{% assign imagedir = "/images/" | prepend: site.baseurl | prepend: site.url %}

We are going to use [nvm](https://github.com/coreybutler/nvm-windows/) to to manage switching between different versions of node.  

## Installing NVM

1. Uninstall existing version of node 
1. Delete any existing nodejs installation directories.  e.g. "C:\Program Files\nodejs") that might remain. NVM's generated symlink will not overwrite an existing (even empty) installation directory.
1. Delete the npm install directory at C:\Users\[Your User]\AppData\Roaming\npm



We are now ready to install nvm.  Download the installer from [https://github.com/coreybutler/nvm/releases](https://github.com/coreybutler/nvm/releases)

**To upgrade**, run the new installer. It will safely overwrite the files it needs to update without touching your node.js installations. Make sure you use the same installation and symlink folder. If you originally installed to the default locations, you just need to click "next" on each window until it finishes.

## Installing and Picking a node version

1. Get a the list so you can see what is available

        $ nvm list available
        
1. Pick the one you want to install

        $ nvm install 4.4.5
        $ nvm install 5.10.1
        
1. Select the node version to use.  Note that only 1 node version can be activate at a time.

        $ nvm use 4.4.5
        $ nvm use 5.10.1
        

    **Gotcha!** Please note that any global npm modules you may have installed are not shared between the various versions of node.js you have installed. Additionally, some npm modules may not be supported in the version of node you're using, so be aware of your environment as you work

                    
## Other Commands

**View Default Node Architecture Being Used**                     
  
    $ nvm arch
    
**Change Default Node Architecture**
    
    $ nvm arch 32
    $ nvm arch 64
    
**Install Node Version**

    $ nvm install 4.4.5
    $ nvm install 4.4.5 64
    $ nvm install 4.4.5 32
    
**Get Installed Versions**

    $ nvm list
    
**Get Available Versions to Install**
    
    $ nvm list available

**Turn On nvm**

    $ nvm on
    
**Turn Off nvm**

    $ nvm off

**Set Proxy**

    $ nvm proxy [url]

**Remove Proxy**

    $ nvm proxy none
    
**View Proxy Setting**

    $ nvm proxy
                
**Uninstall Node Version**

    $ nvm uninstall [version number]
    $ nvm uninstall 4.4.5
                    
**Select Node Version to Use**

    $ nvm use [version] [arch]
    $ nvm use 4.4.5 64
    
    > [arch] is optional 

**Get the Nvm Version**

    $ nvm version
        

