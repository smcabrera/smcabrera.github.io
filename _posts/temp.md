# Developing a laravel app in the cloud from a VPS

Since my computer died I've been trying to make the move to work fully in the cloud, first while working in cyber cafes (an interesting experience of its own) and now from my chromebook. I ssh into a digital ocean box, where I edit files with vim where I have my editor and terminal just the way I want them to. But for a long time I had a hard time getting my laravel application configured properly. This is something that confused me a lot and took me a long time to figure out so hopefully this will save someone time if they find themselves in the same situation.

I was trying to figure out how to configure virtual hosts properly, and trying to figure out how to get apache configured properly. With laravel though, you don't actually have to do this with your development server. php artisan has its own server for use in development

```
php artisan serve
```
Back when I was working on my old decrepit Sony VAIO this worked fine, but I couldn't figure out what happened to my localhost on the digital ocean droplet. I tried to get this working by setting up the Cloud9 cloud editor, and while that can be pretty cool, there's a simpler alternative.

First of all, this may be obvious to some people but with my limited devops knowledge I didn't realize that in order to preview something on a vps like digital ocean, all you need is your ip address. You just navigate to

```
http://XXX.XXX.XX.XX
```

and that will show the root of your site however it's currently configured. It turns out that localhost is really just an alias for a special local only ip address: 127.0.0.1 In your hosts file, located at /etc/hosts (you need sudo access to write to it) that ip address is defined along with other hosts and their corresponding ip addresses. So if were working on a machine where you could change your hosts file (seems to be locked down on my chromebook--I couldn't even access it rooted with sudo access).

Since artisan serve is meant for local development it assumes that the ip address you want is the one corresponding to localhost. If you want to use the artisan server not on localhost, all you need to do is pass in the hostname, like this:
```
php artisan serve --host your.ip.address.here
```
and you're all done. Your server's up and running where you want it. So if you're on digital ocean like I am, you just navigate to your ip address, throw the 8000 port after it and you're at your root, something like:
```
http://XXX.XXX.XX.XX:8000
```
Then in order for your routes to work properly you need to tell laravel to call that the root route instead of whatever else it might have been assuming. Just go into myapp/app/config/app.php and change this line:
```
'url' => 'http://localhost',
```
to this:
```
'url' => 'http://XXX.XXX.XX.XX',
```
you know, with your ip address instead of Xs (I'm not actually positive if the port needs to be on there too, but I think not).

That tells artisan to consider that as your root. Although you should be aware that other people on the project won't have the same root so you don't want to be entering this info into your version control (possibly use environment variables here, that's what I'm planning to do as soon as I can get around to it).

