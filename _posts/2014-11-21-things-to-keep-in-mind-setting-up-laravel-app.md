---
layout: post
title: Details to keep in Mind Setting up your Laravel App
layout: post
excerpt: "There's a few not-so-obvious details that you need to configure a new laravel app when working with multiple developers"
modified: 2015-04-06
tags: [laravel, php, configuration]
comments: true
image:
  feature:
  credit:
  creditlink:
---

### Dealing with Different Database Passwords
There are two crucial points that I dug out of the laravel documentation today about setting up environments. I didn't find this stuff right away when I looked for it because I didn't quite know where to look for. I figured there might be others in a similar predicament so I thought I'd write about it here.

### The problem: two or more developers multiple developers with different database passwords working on the same repository
So the initial problem I ran into was that every time I  pulled down changes from my colleague, the connection to the database would fail, because he had a different database password. This seems like a common enough issue, but amazingly it took me a while to figure out what to do. Initially I just edited the config file (app/db/config.php I believe) to fit the password that I was using. I suppose that I could have just changed my password to be the same as his, but I was reluctant to do this for a couple reasons. Firstly, I had the sense that I shouldn't get in the habit of passing database passwords around on git, for now the repository was a private one on bitbucket, but what if in the future I wanted to do an open source project with laravel--there ought to be a way to do that. Also, my digital ocean box shows me my database password every time I logged in and otherwise I'd be unlikely to remember what it was (poor practice? Probably).

As is often the case the solution was to read the docs, which, although they took me a minute to find, turned out to be pretty clear on the subject. The documentation [here](http://laravel.com/docs/4.2/configuration#environment-configuration) describes very effectively how to setup your laravel installation to automatically recognize what machine you're on and then apply the right configuration. Basically you give it the name of the server in one file and then tell it to apply certain configurations if you're using that server. So you make a folder called mariano-do and put all your info for your digital ocean droplet in there. Then in order to apply that configuration, Laravel just looks in your config folder for a folder named the same thing as the configuration you just told it and then overrides any configuration with what it finds, leaving anything you haven't overriden the same. So for instance if all you need to do is change the database password but nothing else about the application configuration you would just add a database.php file with the relevant information--just like the original one in the default configuration ("production" is the default environment--makes sense).

Then you're going to want to be safe about all this sensitive information so you don't find yourself passing it around on a public repository. [Further down the page](http://laravel.com/docs/4.2/configuration#protecting-sensitive-configuration) the docs describe how to do just that. It's reasonably straightforward.

Those two docs pages above are also helpfully translated to Spanish [here](http://laraveles.com/docs/4.1/configuration#protecting-sensitive-configuration).
