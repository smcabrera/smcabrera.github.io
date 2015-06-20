---
layout: post
title: Get Freaky
excerpt: "A ruby gem cli for browsing and downloading conference videos from confreaks.tv"
modified: 2015-6-14
tags: [ruby, gems, cli]
comments: true
image:
  feature:
  credit:
  creditlink:
---

I made a thing. I'm a big fan of command line applications--sometimes I just don't want to get distracted by everything that comes with using a web app (before you know it you've spent an hour and a half on twitter) and I just want a simple command line interface to do what I want to get done. As a bonus if there's some part of the process you want to automate command line apps make this much easier to do.<br>
So when I was checking out conference vieos on confreaks.tv and discovered that they have a public api I thought I'd take the opportunity to build a little ruby command line app to consume its API and automatically download videos taking advantage a few excellent gems that simplified matters a great deal and which I highly recommend:

- [viddl-rb](https://github.com/rb2k/viddl-rb): gem for providing a simple interface for downloading videos from various sites (youtube, vimeo) as well as the
- [httparty](http://johnnunemaker.com/httparty/): gem which makes working with public APIs via HTTP a total cinch.
- [commander](https://github.com/tj/commander): Greatly simplifies spinning up interactive command line apps of the ```appname subcommand --options``` form.

## Usage
Complete documentation on the [github page](https://github.com/smcabrera/get_freaky) but you can get some useful value out of the gem right away like this:

```
$ gem install get_freaky
$ get_freaky
```

get_freaky by itself is aliased to the help which will give you all your options. If you're not picky about which conference video you'd like to watch or just wanna make sure it works you can download the featured video like this

```
$ get_freaky featured
```
This will show you the featured video from confreaks, with its title and description and then ask you if you'd like to download the video.

Check it out! If there's something or there's another feature you'd like please let me know and I'll try to fix/build it. I'm open to any feedback for improving it and am open to pull requests or anyone who'd like to pair with me on a new feature.

## Build your own!
Finally I highly recommend this process as a learning experience. I had a lot of fun and I think learned a lot, not just for building apps that consume APIs but also I think I've gotten a sense of what makes good interface design. It's always nice if you're going to build software to first know what it's like to be a user of that software.

If people are interested I could see if I can bang out a tutorial for how to build something like this.
