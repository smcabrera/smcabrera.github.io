---
layout: post
title: Powered by Jekyll...what's Jekyll?
excerpt: "Introduction to Jekyll and my experiences with using it for blogging"
modified: 2015-4-7
tags: [ruby, tools, blogging]
comments: true
image:
  feature:
  credit:
  creditlink:
---

I host this site using an open-source ruby project called [Jekyll](http://jekyllrb.com). From [the project's readme](https://github.com/mojombo/jekyll/blob/master/README.markdown):

  > Jekyll is a simple, blog aware, static site generator. It takes a template directory [...] and spits out a complete, static website suitable for serving with Apache or your favorite web server. This is also the engine behind GitHub Pages, which you can use to host your project’s page or blog right here from GitHub.

# Static Site generator?

"Static site generator" means that rather than having server-side code (like ruby or PHP) dynamically create html and serve up database records based on user (HTTP) requests, Jekyll will use the code you give it to create a website that's pure html, css and javascript. What you end up deploying will be a static site, meaning it runs no server-side code at all. No database either. All the posts you write are just markdown files that Jekyll will compile into the finished static stie.

## Why not just use wordpress?
So what advantages does this setup have over a traditional database-backed setup like Wordpress? For me the difference comes down to simplicity. Your whole site is just a bunch of files that you can peruse in your text editor. You can keep your whole blog in a git repo and never have to setup a database. Deployment is literally just ```git push```. If you're on a different machine you just need to clone the repo and you have the same site.

For me personally the whole "my posts are just markdown files" thing is the biggest advantage. I find that it's much easier to focus on writing when I'm not in a browser. I don't need to have internet to write or edit posts. I get to use vim. That might have been enough by itself.

Also markdown is a great format to write in. It's the perfect way to let you create the formatting you need to while getting out of your way. In general, I'm moving more towards keeping everything I write in text files (sorry evernote). The fact that I can easily just open a new tab in vim and jot down some notes that could later be turned into a blog post is huge.

I've been having a blast blogging with Jekyll; I highly recommend it. I also recommend checking out [Jekyll Themes](jekyllthemes.org) a repository of free themes for use with Jekyll. They're really easy to get started with. If you have any trouble hit me up via email or twitter.

