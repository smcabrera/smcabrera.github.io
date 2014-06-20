## Remote Pairing tools
I've recently been on the lookout for tools to make remote pair
programming easier. My motivations are:
- Pair programming, particularly with someone better than you (most
  programmers!) is the best way to learn
- My goal is to work remotely as a developer so I want to get a good
  comfortable remote setup.
- I'm currently engaged in an [apprenticeship](www.bloc.io) heavily focused on remote
  pair programming. So now it's urgent.

So just recently I've gotten much more aggressive at looking for quality
tools. I bought a book from the Pragmatic Bookshelf and I've started
googling heavily. Here's what I've found:

### tmux

tmux is the clear winner for my current use case<br>
pros:
- Works great on linux
- Works great with vim
- _*low-bandwidth usage*_ This is huge.

cons:
- Pair needs to be using a console editor like vim or emacs
- Corllary to above--if you use vim and they use emacs, not so great
- You may want to maniuplate the browser console together or do other
  screen sharing that doesn't involve the console.

I'll have to find other solutions for when tmux isn't an option (screen sharing for when we want to look at what something looks like in a browser for instance) but I think that most of the time some kind of a tmux session solution is going to be the way to go (the prag programmers book also talks about different ways to do this).

### How it works
Basically you can set up a remote server, [this guy](http://www.zeespencer.com/articles/building-a-remote-pairing-setup/) uses prgmr.com, and then you both connect to it via ssh. There's this whole involved process for setting up your users, which he describes--I think there's a similar description in the Pragmatic Bookshelf book on remote pairing I bought.

### Big Discovery: tmate

[tmate](http://tmate.io/): A fork of tmux, designed to do the
above configuration automatically. As far as I can tell:

  pros:
  - Much easier setup--most of the work is already done for you.

  Cons:
  - The other person has to use your tmux configurations
  - You're stuck using ssh, instead of mosh (which is apparently faster than ssh).
  - I imagine, though I'm not positive, that you wouldn't be able to use some of aforementioned tmux plugins.

### Other Tools to try out

- [mosh](http://mosh.mit.edu/) SSH alternative. Uses less bandwidth and thus faster than ssh.
- [wemux](https://github.com/zolrath/wemux): tmux plugin for remote
- pairing--need to check it out and see what kind of features.
- [vimux](https://github.com/benmills/vimux): ditto.
- [tmuxinator](https://github.com/tmuxinator/tmuxinator): Looks like it
can be useful for saving a lot of settings (for a project) without
having to restart it each time.

I haven't tried any of this yet, but I'll be giving these a shot and write about how it goes.
