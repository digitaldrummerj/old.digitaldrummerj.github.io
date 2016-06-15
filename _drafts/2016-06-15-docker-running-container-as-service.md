---
layout: post
title: Docker - Running Container As a Service
date: 2016-06-15 06:00
categories: ['docker']
published: true
series: docker-toolkit-windows
excerpt: |
    In the [previous Docker tutorial](../docker-windows-mounting-directories//) we learned how to mount additional directories within the Docker containers.  In this tutorial we are going to learn how to run a Docker container as a service a.k.a daemon for nginx and mysql.
     
---

{% assign imagedir = "/images//" | prepend: site.baseurl | prepend: site.url %}

{% include series.html %}

In the [previous tutorial](../docker-windows-mounting-directories/) we learned how to mount additional directories within the Docker containers.  In this tutorial we are going to learn how to run a Docker container as a service a.k.a daemon for nginx and mysql.

To run a Docker container as a daemon, we run it with the -d flag.  This will tell Docker to start up the container in the background and return back to the command prompt.

### nginx

The first thing we are going to do is start up an nginx web server.  If you do not already have the nginx image it will pull it down from the Docker hub, port format port 8000 to port 80 in the container and then the -d will leave it running in the background.

     docker run -d -p 8000:80 nginx

Once the nginx container is up and running, we can verify it is running with

     docker ps

>To see all of the containers even if they are not running execute add a `-a` 

    
To connect to the nginx web page, we need to know the ip address of the docker machine.  

     docker-machine ip

>In my case it is 192.168.99.100.  To navigate to the web page, open up a browser and navigate to http://192.168.99.100:8000/

If you need to to attach to a shell within the running container, run `docker ps` to get the container id then run `docker attach [container id]`

If you need to stop the container, run 'docker ps' to get the container id then run `docker stop [container id]`.  You can verify it stopped by running `docker ps -a`

If you are done with the container and ready to delete it, run `docker ps` to get the container id then run `docker rm  [container id]`    

### MySQL Sample

This example will download the mysql image, create a mysql database and expose it to your local machine to interact with.

     $ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -e MYSQL_USER=mysql_user -e MYSQL_PASSWORD=mysql_user1 -e MYSQL_DATABASE=mysql_test -p 3306:3306 -d mysql

Once the MySql container is up and running we can see that it is running with

     docker ps

>To see all of the containers even if they are not running execute add a `-a`     

To connect to the MySql database, we need to know the ip address of the docker machine   

     docker-machine ip

Then we need to install MySql Workbench from [https://www.mysql.com/products/workbench/](https://www.mysql.com/products/workbench/) to connect to the database to interact with the database.


If you need to to attach to a shell within the running container, run `docker ps` to get the container id then run `docker attach [container id]`

If you need to stop the container, run 'docker ps' to get the container id then run `docker stop [container id]`.  You can verify it stopped by running `docker ps -a`

If you are done with the container and ready to delete it, run `docker ps` to get the container id then run `docker rm  [container id]`    

You have learn how to run 2 different types of Docker containers as background containers.  Any Docker container can be run as a background container by using the -d when starting up the container for the first time.