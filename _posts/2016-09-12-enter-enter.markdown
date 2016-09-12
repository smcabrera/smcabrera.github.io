---
layout: post
title: Enter...enter
modified: 2015-4-7
excerpt: "A simple command line tool and convention to make working with projects in tmux a little easier"
tags: [learning]
comments: true
image:
  feature:
  credit:
  creditlink:
---

I made a thing. A simple command line utility I call [enter](https://gist.github.com/smcabrera/bfbcecadb984ce8c37696247533b51d5). <br />
I wrote it a while back and I've found to be tremendously convenient. This was made more clear to me when briefly I was working on a machine that didn't have it and I was reminded of how nice it was.  I thought I'd share it and the workflow that makes it so darn convenient.

### A Tmux Workflow
I found myself following a pretty similar pattern:

- Decide to start work on a project, let's call it `awesome_blog`. 
- Start a new tmux session and call it `awesome_blog`


```sh
  $ tmux new -s awesome_blog
```

- Open up a new tmux window.
- try to start a rails server in that window. 
- Watch as my terminal yells at me for being in my home folder or whatever folder I was working in before I decided to switch to this folder 
- Gradually get more and more annoyed as this keeps happening and I keep having to cd into my project folder before doing anything and wishing that I'd just started the tmux session in the correct folder.
- blowing up this tmux session and all its windows just so I can start it again from the right project folder

```sh
   $ tmux destroy-session -t awesome_blog
   $ cd ~/workspace/awesome_blog
   $ tmux new -s awesome_blog
```

### A better way

 <img src="http://imgs.xkcd.com/comics/is_it_worth_the_time.png" />

<br />
I don't know about you but that seems like an awful lot of unnecessary typing. Maybe the math doesn't add up (see above) but I am a profoundly lazy person so naturally I decided it made sense to spend several hours figuring out how to resume being lazy.
<br />
So I wrote this little shell script. Now instead of the above, whenever I want to work on a new project I just go

```sh
   enter awesome_blog
```

- If I've already created the tmux session with that name and I'd just forgotten about it, no worries, it just moves me into that tmux session.
- If I haven't created it yet it'll cd into the appropriate folder and create the session from there
- Once I'm done and want to leave tmux, whether to start a new project or just do whatever I was doing before, I'm back in the same folder I was when I ran the command.

If people like the tool or the workflow and have suggestions on how to make it better I'm all ears :)
