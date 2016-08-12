---
layout: post
title: '.NET WebApi - Setup Generic Response Handler'
date: 2016-08-04 06:00
categories: ['webapi']
series: webapi-getting-started
published: true
excerpt: |
    Welcome to the continuing series on getting started with .NET WebApi.  In this article we will learn how to setup a standard response format for all of the endpoints.    

---

{% assign imagedir = "/images/webapi-getting-started/" | prepend: site.baseurl | prepend: site.url %}

Welcome to the continuing series on getting started with .NET WebApi.  In this article we will learn how to setup a generic response handler for all of Api calls.  This will allow us to consolidate the logic needed to create a proper response as well as it will allow us to consolidate the exception handling logic.     

{% include series.html %}


## Create the Response Handler

1. In the Solution, create a new directory called Helpers
1. Within the Helpers directory, create a class called WrapResponseResult.cs
1. Response the class code with the code below. 

```c#
public class WrapResponseResult<T> : IHttpActionResult
{
    private readonly Func<T> _func;

    public WrapResponseResult(Func<T> func)
    {
        _func = func;
    }

    public Task<HttpResponseMessage> ExecuteAsync(CancellationToken cancellationToken)
    {
        return Task.FromResult(CreateResponse(_func));
    }

    public HttpResponseMessage CreateResponse(Func<T> func)
    {
        HttpRequestMessage request = new HttpRequestMessage();
        request.Properties.Add(HttpPropertyKeys.HttpConfigurationKey,
            new HttpConfiguration());

        try
        {
            return request.CreateResponse(HttpStatusCode.OK, func());
        }
        catch (HttpResponseException ex)
        {
            throw;
        }
        catch (Exception ex)
        {
            return request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
        }
    }
}
```    

## Updating Api Method to Use Generic Response Handler

 Open up the Controllers\FirstController.js file and change the return type of the Get method to WrapResponseResult<UserModel>

{% highlight c# %}
public WrapResponseResult<UserModel> Get()
{
}
{% endhighlight %}

Replace the contents of the Get method with the following: 

{% highlight c# %}        
return new WrapResponseResult<UserModel>(() =>
{
    string userName = RequestContext.Principal.Identity.Name;
    return new UserModel { UserName = userName };
});  
{% endhighlight %}                  
