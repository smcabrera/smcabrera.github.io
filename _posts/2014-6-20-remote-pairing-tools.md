---
layout: post
title: Remote Pairing Tools
---

I've recently been on the lookout for tools to make remote pair
programming easier. My main motivations are the following<br>

- Pair programming, particularly with someone better than you (most
  programmers at this point!) is the best way to learn
- My goal is to work remotely as a developer so I want to get a good
  comfortable remote setup.
- I'm currently engaged in an [apprenticeship](www.bloc.io) heavily focused on remote
  pair programming. So now it's urgent.

Here's what I've found.

### remote server with ssh and tmux

tmux, short for terminal multiplexer lets you run multiple terminals
within one environment. It's sort of like browser tabs for your
terminal. For remote pairing you can use it to connect to a remote
server via a secure shell or ssh.

There's a pretty detailed description of the process [here](http://www.zeespencer.com/articles/building-a-remote-pairing-setup/) using prgmr.com as the remote server. I haven't tried it so I won't go into the process here but needless to say that setting it up is pretty involved. There's a description of something similar in the book from a book on the topic from the [Pragmatic Bookshelf](http://pragprog.com/book/jkrp/remote-pairing).

####Pros:

- Works great on linux
- Works great with vim
- Works great on _*low-bandwidth*_. This is huge for me.

####Cons

- Pair needs to be using a console editor like vim or emacs
- Corllary to above--if you use vim and they use emacs, not so great
- You may want to maniuplate the browser console together or do other
  screen sharing that doesn't involve the console.

I'll have to find other solutions for when tmux isn't an option (screen sharing for when we want to look at what something looks like in a browser for instance) but I think that most of the time some kind of a tmux session solution is going to be the way to go (the prag programmers book also talks about different ways to do this).

### A Simpler Solution: tmate

[tmate](http://tmate.io/): A fork of tmux, designed to do the
above configuration automatically. As far as I can tell:

####Pros:

  - Much easier setup--most of the work is already done for you.

####Cons:
  - The other person has to use your tmux configurations
  - You're stuck using ssh, instead of mosh (which is apparently faster than ssh).
  - I'm not sure if you'd be able to use tmux plugins like tmuxinator.

### Other Tools to investigate

- [mosh](http://mosh.mit.edu/) SSH alternative. Uses less bandwidth and thus faster than ssh.
- [wemux](https://github.com/zolrath/wemux): tmux plugin for remote
- pairing--need to check it out and see what kind of features.
- [vimux](https://github.com/benmills/vimux): ditto.
- [tmuxinator](https://github.com/tmuxinator/tmuxinator): Looks like it
can be useful for saving a lot of settings (for a project) without
having to restart it each time.

I haven't tried any of this yet, but I'll be giving these a shot and write about how it goes.
