h--
layout: post
title: How to develop a laravel app from a digital ocean droplet
---

I'm writing this because for all the pain and suffering I endured to get up and running coding my laravel app in the cloud, all because I didn't realize what was going wrong. Hopefully I can save others from making the same mistakes!

For a while I've been unable to figure out how to get my routes to work properly. I'm new at using apache and so I kept going over tutorials thinking that I was screwing up something to do with my virtual hosts or something similiar. I just didn't know what was going on. One of the biggest things that tripped me up was that previously I'd used the command
```
php artisan serve
```
for local development, but I wasn't sure what the equivalent of "localhost" was for developing in the cloud.

After a lot of digging I figured out the following.

First of all localhost is just an alias for the ip address 127.0.0.1. That's it. It's somewhat special in that it's always going to be that ip address on all computers and that ip address is specially reserved for this purpose but other than it's just an alias. The file residing in /etc/hosts is just a list of similar aliases that you can tap into to make it easier to remember the names of those ip addresses.

So that's the first piece, if you want to move to developing from an ec2 instance or a digital ocean droplet, you just need to substitute your virtual machine's ip address (which you can find with the ifconfig command) for localhost.


The other thing that tripped me up is that since the php artisan server is just for development they don't count on you not working on localhost; if you want to use a different ip address, like your VPS' ip address you need to pass that in like this:
```
php artisan serve --host XXX.XXX.XX.XX
```
Where you put in the numbers in your ip address instead of those Xs.

That's it, you're all done. Your server's up and running where you want it now. Now to preview it, you just navigate to your ip address, throw the 8000 port on the end (unless you specified a different one with artisan, which you can do with the -p option) and you're good to go. Something like this:
```
http://XXX.XXX.XX.XX:8000
```

Last thing you need to do is configure artisan to know where your root is in the context of your laravel app. If you go into yourappname/app/config/app.php you'll find this line:

```
'url' => 'http://localhost',
```
as part of a big long array full of configurations. That's telling laravel to use localhost as your root. Normally that makes sense but in our case we're using our VPS for development so we'll want to change that to:
```
'url' => 'http://XXX.XXX.XX.XX:8000',
```

That tells artisan to consider that as your root. Although you should be aware that other people on the project won't have the same root so you don't want to be entering this info into your version control (possibly use environment variables here, that's what I'm planning to do as soon as I can get around to it).

