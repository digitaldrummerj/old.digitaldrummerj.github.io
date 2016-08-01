---
layout: post
title: 'Setup camelCase for JSON in .NET WebApi'
date: 2016-08-03 06:00
categories: ['webapi']
series: webapi-getting-started
published: true
excerpt: |
    Welcome to the continuing series on getting started with .NET WebApi.  In this article we will learn how to setup the JSON response to convert the .NET pascal cased properties into camel cased properties.  

    ## Definitions

    * Pascal Case = Each word starts with a captial letter (e.g. UserName)
    * Camel Case = starts with a lowercase letter and then each word starts with a captial letter (e.g. userName).  Notice the lower case u in userName.

    ### Creating Class to Return

    In order to test the camel case configuration, we are going to update the FirstController that we created in the previous post to return a UserModel instead of a string.

---

{% assign imagedir = "/images/webapi-getting-started/" | prepend: site.baseurl | prepend: site.url %}

{% include series.html %}

Welcome to the continuing series on getting started with .NET WebApi.  In this article we will learn how to setup the JSON response to convert the .NET pascal cased properties into camel cased properties.  

## Definitions

* Pascal Case = Each word starts with a captial letter (e.g. UserName)
* Camel Case = starts with a lowercase letter and then each word starts with a captial letter (e.g. userName).  Notice the lower case u in userName.

### Creating Class to Return

In order to test the camel case configuration, we are going to update the FirstController that we created in the previous post to return a UserModel instead of a string.

1. In the solution explorer, right-click on the Models directory
1. Select Add
1. Select Class

![Add New Class to Model Folder in Visual Studio]({{"webapi-add-new-model.png" | prepend: imagedir }})

In the "Add New Item" dialog that comes up, name the file UserModel.cs and click ok

![Set new model file name to UserModel.cs]({{"webapi-add-new-model-filename.png" | prepend: imagedir }}) 


In the UserModel.cs replace the contents with the following code:

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApi_Demo.Models
{
	public class UserModel
	{
		public string UserName { get; set; }
	}
}

```

Next we need to update the FirstController Get method to return a UserModel with the UserName set to the logged in user.

1. Open the Controllers\FirstController.cs file
1. Change the return type of the Get method to `UserModel`
1. Change the return statement to create a new UserModel with the UserName set to RequestContext.Principal.Identity.Name

```c#
public UserModel Get()
{
    return new UserModel { UserName = RequestContext.Principal.Identity.Name };
}
```

1. You will also need to add the following using statement so that is knows how to find the UserModel class we created.

```c#
using WebApi_Demo.Models;
```

## Testing Default Behavior

We are now ready to test our changes.  However, before we do, we need to make 1 configuration change.   Previously we were able to test in our browser since we didn't care if XML was returned.  This time we do care about the return type as we want it to be JSON since that is the formatter we are going to be updating to be camel case.  By default XML is returned when hitting the url directly from the browser since it sends application/xml as the content-type from the browser.  There are two options to fix this: 1.) Use the Google Chrome Extension Postman to do our testing 2.) Turn off XML as a format option.  Since we do not need XML to be returned from our WebApi we are going to go with option #2.


1. Open the file App_Start\WebApiConfig.cs
1. In the `Register` method, add the following code after the call to config.Routes.MapHttpRoute

```c#
config.Formatters.Remove(config.Formatters.XmlFormatter);
```

Press F5 to compile our code and start a debug session.  Go to the api/first endpoint and you will notice that the output casing currently matches that of our .NET class.  This doesn't seem like much of an issue until you start using JSON more and are used to everything being camel cased.

```json
{"UserName":"[My User Name]"}
```

## Updating Configuration

To fix the casing, we need to update the JSON formatter to use the CamelCasePropertyNamesContractResolver that is part of the JSON.NET library that is included with WebApi.

1. Open the file App_Start\WebApiConfig.cs
1. In the `Register` method, add the following code after the call to config.Routes.MapHttpRoute

```c#
var json = GlobalConfiguration.Configuration.Formatters.JsonFormatter;
json.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
```

We also need to add the using statement to tell .NET where to find the CamelCasePropertyNamesContractResolver

```c#
using Newtonsoft.Json.Serialization;
```

Now anytime we return back a serialized .NET class, all of the properties will be converted to the standard JSON camel case instead of using the standard .NET Pascal case.

If you press F5 to compile our code and start a debug session and go to the api/first endpoint, you will notice that the output casing is now camel cased 

```json
{"userName":"[My User Name]"}
```

## Conclussion

In this guide we learned how to convert the JSON output response to be camel cased instead of the .NET pascal case without having to modify all of our .NET classes.  In the next post, we will look at creating a common response format to all of the endpoint return values.   