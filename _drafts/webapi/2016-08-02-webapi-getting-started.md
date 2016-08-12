---
layout: post
title: '.NET WebApi - Your First Project'
date: 2016-07-25 06:00
categories: ['webapi']
series: webapi-getting-started
published: true
excerpt: |
    Welcome to the series on getting started with .NET WebApi.  In this series we will learn how to:

    - Create a basic C# webAPI with Windows Integrated Authentication 
    - Setup camel-cased json properties for the response 
    - Setup A Standard Response
    - Solving CORS Issues When Using Credentials
---

{% assign imagedir = "/images/webapi-getting-started/" | prepend: site.baseurl | prepend: site.url %}

Welcome to the series on getting started with .NET WebApi.  In this series we will learn how to:

- Create a basic C# WebAPI with Windows Integrated Authentication 
- Setup camel-cased json properties for the response 
- Setup A Standard Response
- Solving CORS Issues When Using Credentials

{% include series.html %}

In this article we will create a basic C# WebApi with Windows Integrated Authentication and create our first WebApi endpoint.  


## Create a new WebAPI Project 

To make a C# application with Visual Studio:

* Open Visual Studio 2015.  Any edition will work.  I am using Community Edition. 
* Click File -> New -> *Project...*

    ![New Project]({{ "vs-start-project.png" | prepend: imagedir }})

* Find and select *ASP.NET Web Application*, give your application a name and select *ok* 

    1. On the left side under Installed -> Templates, select Web
    1. Select "ASP.NET Web Application"
    1. Give the project a name (WebApi-Demo in this case)
    1. Select a location to store the project (c:\projects in this case)
    1. Uncheck the "Application Insights" box since we are not going to be using Application Insights
    1. Click the Ok button
    
    ![New Web Application]({{ "vs-new-web-app.png" | prepend: imagedir }})

* On the next screen, we need to select the New ASP.NET Project Options

    1. Select WebApi for the template    
    1. Click on the "Change Authentication" button
        * Select "Windows Authentication"
        * Click Ok
    1. Uncheck "Host in the cloud"
    1. Click Ok to generate the project 

    ![Web App Options]({{ "vs-new-web-app-options.png" | prepend: imagedir }})
 
* You project has now been generated and you should see a screen similar to the follow in Visual Studio

    ![Generated Project]({{ "vs-new-web-app-finished.png" | prepend: imagedir }})

* If you hit F5 your default browser will launch with the WebApi Start Page.  

    ![Initial Start Page in Chrome]({{ "chrome-initial-start-page.png" | prepend: imagedir }})

* The WebApi project comes with a couple of WebApi Endpoints and a very useful Api documentation page that shows all of the available Api endpoints.    Click on the API link in the top nav bar to view the documentation page.

    ![Api Doc Page in Chrome]({{ "chrome-api-doc-page.png" | prepend: imagedir }})


## Creating Our First Controller

Now that we have a working WebApi project, lets add some functionality to it.  The first thing we are going to do is to create a controller that will return back the logged in Windows user using Windows Integrated Authentication.

1. In the Solution Explorer, right-click on the Controllers  
1. Select Add from the menu the comes up
1. Select "Controller..." from the list of templates

![WebApi New Controller]({{ "webapi-new-controller.png" | prepend: imagedir }})    


This will open up the Controller type options.  

1. Select "Web API 2 Controller - Empty"
1. Click the Add button

    ![WebApi Controller Template Selection]({{ "webapi-new-controller-template.png" | prepend: imagedir}})

Next you will need to input the file name.

1. Change the file name to FirstController
1. Click the Add button

    ![WebApi Controller File Name]({{ "webapi-new-controller-filename.png" | prepend: imagedir}})



We now have a blank WebApi Controller that is ready for us to create methods within.

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApi_Demo.Controllers
{
    public class FirstController : ApiController
    {
    }
}
```

We are now going to add a GET method that will return back the logged in user.

```c#
public string Get()
{
    return RequestContext.Principal.Identity.Name;
}
```

Before we test our new controller, we need to make sure that Windows Authentication is enabled and Anonymous Authentication is disabled.

1. Open Solution Explorer, select the Solution and press F4 to open the Properties window
1. Set "Anonymous Authentication" to disabled
1. Set "Windows Integrated" to enabled

![VS Solution Properties Set Dev Server Authentication Options]({{"iisexpress-windows-auth.png" | prepend: imagedir }})

Now we are ready to test our Api.  In Visual Studio, press F5 to start up a debugging session.  This will launch your default web browser.  Once the initial page for WebApi has loaded navigate to the /api/first page  (e.g. http://localhost:58842/api/First).  Your port number will be different than mine.  

The response you get back will be an xml document that contains a string with your domain and user name that you are logged in with.  It will look similar to below.

```xml
<string xmlns="http://schemas.microsoft.com/2003/10/Serialization/">[Your Domain]/[Your User Name]</string>
```

## Conclusion

In this guide we learned how to create a basic C# WebAPI project that uses Windows Integrated Authentication.  In the next guide, we will learn how to convert the JSON responses to be camel cased instead of following the .NET pascal case convention without having to update all of our .NET class. 
