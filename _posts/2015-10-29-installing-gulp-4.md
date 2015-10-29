---
layout: post
title: 'Installing Gulp 4.x'
date: 2015-10-29 06:00
categories: ['gulp']
published: true
excerpt: | 
      Gulp 4 is not released yet but if you have a need to install it here is how to do it.  I will cover how to globally install it as well as how to update your package.json for your projects.
---

Gulp 4 is not released yet but if you have a need to install it here is how to do it.  I will cover how to globally install it as well as how to update your package.json for your projects.

##Globally Installing Gulp

1. Open a Command Prompt (Windows) or Terminal (Mac or Linux)
1. Check if you have Gulp 3.x install

    	   $ gulp -v

1. If a Gulp version is returned other than Gulp 4, you will need to upgrade by running the following commands

        $ npm uninstall -g gulp
        $ npm install -g git+https://git@github.com/gulpjs/gulp.git#4.0

1. Verify 4.x installed correctly

    
        $ gulp -v
            
##Updating Your Projects package.son

If you using a previous version of Gulp in your package.json file, you can upgrade it if you would like or continue to use Gulp 3.x.  I have not had any issue with leaving my local repository at 3.9 while having Gulp 4 installed globally.

1. Open a Command Prompt (Windows) or Terminal (Mac or Linux)
1. Navigate to the directory that contains your package.json
1. Uninstall gulp.  **Note:** If your package.json has gulp listed as a dev dependency use  --save-dev.  If gulp is listed as a dependency use --save.

        $ npm uninstall gulp --save-dev
        $ npm install git+https://git@github.com/gulpjs/gulp.git#4.0 --save-dev
        
        OR
        
        $ npm uninstall gulp --save
        $ npm install git+https://git@github.com/gulpjs/gulp.git#4.0  --save
    
##Wrap-up

You can keep up to date on Gulp 4 at [https://github.com/gulpjs/gulp/tree/4.0](https://github.com/gulpjs/gulp/tree/4.0) and [https://twitter.com/gulpjs?lang=en](https://twitter.com/gulpjs?lang=en)