---
layout: post
title: Thoughts on Coding Education
modified: 2015-4-7
tags: [learning]
comments: true
image:
  feature:
  credit:
  creditlink:
---

I made a thing. I call it [enter](https://gist.github.com/smcabrera/bfbcecadb984ce8c37696247533b51d5).

Just a simple utility that I use every day and I've found to be tremendously convenient and helpful so I thought I'd share it. I found I was following a pretty consistent convention when starting to work on a project--I wanted to cd to the folder a project was in before starting a new tmux session so that opening new windows in tmux didn't start up in my home folder or whatever other random place I'd put them. Now all I need to do is 

I found myself following a pretty similar pattern.

Decide to start work on a project, let's call it `awesome_blog`. 

Start a new tmux session and call it `awesome_blog`

```
$ tmux new -s awesome_blog
```

- Open up a new tmux window.
- And try to start a rails server in that window. 
- Watch as my terminal yells at me for being in my home folder or whatever folder I was working in before I decided to switch to this folder 
- Gradually get more and more annoyed as this keeps happening and I keep having to cd into my project folder before doing anything and wishing that I'd just started the tmux session in the correct folder.
- blowing up this tmux session and all its windows just so I can start it again from the right project folder

```
   $ tmux destroy-session -t awesome_blog
   $ cd ~/workspace/awesome_blog
   $ tmux new -s awesome_blog
```

 I don't know about you all but that's an awful lot of work. I am a profoundly lazy person so naturally I decided it made sense to spend several hours figuring out how to resume being lazy.

 <img src="http://imgs.xkcd.com/comics/is_it_worth_the_time.png"></img>

So I wrote this little shell script. Now instead of the above, whenever I want to work on a new project I just go

```
   enter awesome_blog
```

- If I've already created the tmux session with that name and I'd just forgotten about it, no worries, it just moves me into that tmux session.
- If I haven't created it yet it'll cd into the appropriate folder and create the session from there
- Once I'm done and want to leave tmux, whether to start a new project or just do whatever I was doing before, I'm back in the same folder I was when I ran the command.

I've been using it for the better part of a year and I think it's finally time I shared it with people. If anyone has any suggestions for things they'd like or ways to make it better I'm all ears :)
