---
layout: post
title: Docker - Getting Started  Part 2
date: 2016-0601 06:00
categories: [' docker']
published: true
excerpt: |

--- 
{% assign imagedir = "/images//" | prepend: site.baseurl | prepend: site.url %}

In part 1 we went through how to get docker  installedcand ran a couple of basic containers.  In this post we are going to look at how to run a docker container in the background  to host mysql. 

When running a container that is used for a service like a database there is no need to be attached to the command line for it.  Instead you want to run the machine in the background so that your can continue to use the docker terminal that you have open for other docker commands.  

The process is running the docker container in the background is called running it as a daemon.  To run the container as a daemon you pass in the -d parameter.  
 
 In part 1 started up an Ubuntu container and attached to the command line for it.  This time we are going to take that same container as start it as a daemon.  
 
 	$ docker run -d Ubuntu 
 	
notes 
see container running 
attach to container 
stop container 
delete container 

mysql container 
passing environment variables 
