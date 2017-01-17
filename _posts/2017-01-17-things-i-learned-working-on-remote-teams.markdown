---
layout: post
title: Five Things I Learned Working on Remote Teams
modified: 2017-1-17
excerpt: "I've worked on remote teams both before and after becoming a software developer and I've seen things that worked well and things that didn't work so well. Here are some things I've learned"
tags: [remote]
comments: true
image:
  feature:
  credit:
  creditlink:
---

I've worked on remote teams both before and after becoming a software developer and I've seen things that worked well and things that didn't work so well. Here are some things I've learned:

## 1. Slack is your office
Being able to get in touch with your colleagues in a low-friction way plays a big role in creating the feeling of being on the same team and being in the same room. Real time chat applications like slack, hipchat (IRC?) are great for this. You say good morning to everyone when you come, you engage in some random chit chat, you digitally tap people on the shoulder when you have a question or a problem, you crack jokes with people, you congratulate them for their successes.

And like an office they can be a place for you to have fun and mess around with your coworkers as well. A well-chosen emoji or gif can create the same kind of history of shared inside jokes that people enjoy in a co-located team. Slack's level of expressiveness through custom emoji, integrations with giphy and support for markdown to convey nuances like italics, bold and strikethrough are actually really important ways of making text based communication feel more human and make your work colleagues feel more like your teammates. The choice to default to including a #Random channel, explicitly for non work-related activity is another acknowledgement of the importance of these shared activities for team building and nowhere is this more true than for a remote team.

## 2. There's nothing like face time 
That said there's nothing quite like talking face to face. Video chats are super important for remote teams as they give you the closest approximation of being in the same room that we've got so far. Even though video chats make achieving this easier than ever before there is often friction around video chats which keep conversation from being as spontaneous as  on a co-located team. Video chats generally require scheduling in a way that in person conversations do not.

One way around this is doing a daily standup over video chat. At a minimum you get to see each other's faces once a day even if there wasn't anything specific that you would have called a meeting for. Invariably in talking about your work things will surface that you wouldn't have thought to address in a meeting but now that you're together you can deal with. If you go too far down any particular rabbit hole you can always table it for another call or pair programming session after the standup is over. Then you get the additional benefit of feeling more like a member of the team.

I've read that Zapier, whose team is 100% remote, randomly pairs people up *solely* for the purpose of getting to know their team members which I suspect could be similarly valuable.

Another thing that helps is using tools that make creating a new video chat truly effortless to setup. I've used slack's integration with appear.in to start a new video chat room instantly just by typing `/appear`. Now that slack has its own video calling this could get even easier. There's also a company called Meetspace which gives you dedicated rooms that you can go to that always stay up for your room (so you could have a `standup` room for example). 

The less people have to install and configure to jump in a call the more people are going to reach for _actually talking to each other_ instead of wasting a lot of time going back and forth.

## 3. Remote Pair Programming can be just as good as in person
While there are challenges to remote work that require you to do things very differently pair programming is one where once you have the right setup, the experience is nearly identical to doing it in person.

My experience with remote pairing has been extremely positive. I learned web development with rails through a completely online bootcamp I've continued to use pairing as a learning and collaboration tool in all of the remote jobs I've had and it hasn't let me down. While I've certainly enjoyed pairing in person at local hack nights, I haven't noticed much difference between sharing a keyboard and sharing screens over a fast internet connection.

There's a lot out there on remote pairing setups (pragmatic bookshelf even has [a book on it](https://pragprog.com/book/jkrp/remote-pairing)) but the current best options seem to be the screen sharing application Screenhero or sharing a terminal session with something like tmate. tmate, a fork of tmux which allows your pair to ssh into a tmux session with you is a very simple low setup, low latency way to get started pairing with someone...though you're going to have to be using a terminal editor and use another tool to handle voice. If you're in the same country you could just use an old fashioned phone call, or else you can use a tablet for video calls and your computer screen for screensharing. Meanwhile Screenhero requires considerably more bandwidth but gives both developers full control over the computer that's being shared.

Which leads me to...

## 4. Internet (upload) Speed Matters

In discussions about remote work it's common to read things like "work from anywhere with an Internet connection!" For remote developers (and I suspect others as well) should be amended to "work from anywhere with an upload speed of at least 1mbps on average preferably 10mbps or more".
We discussed the importance of video calls and screen-sharing. Both of these activities, crucial for a remote developer, require not only high download speeds but also high _upload_ speeds. This would be fine if the two were always equal, but wifi for consumers rarely is. Basically consumers value download speed more than upload speed so ISPs can get away with offering _significantly_ slower upload speeds--people want to streaming Game of Thrones but don't care if it takes an extra second to upload their resume to a job site. As a remote worker upload speed is almost always your bottleneck when comparing internet speed options.

You can get a pretty good approximation for average internet speed using sites like speedtest.net. The easiest solution is just to work out of a coworking space (where they have strong incentives to make sure you always have fast internet) or make sure your home internet plan has a high enough upload speed--possibly switching to a business plan if not.  

I've kept track of internet speeds in various places I have visited and they have varied widely. I've found that you can usually get away with internet upload speeds as low as 1 mbps which sounds terrible but you would be surprised how many places that have well over 10mbps of download have upload speeds that don't break 1mbps.

## 5. Use the right level of synchronicity
Different communication tools have different levels of synchronicity that they tend to expect in their users. Most of the time how real time a communication channel defaults to can be a little subjective. Could you have a real-time back and forth conversation over gmail? Sure you could, gmail will refresh the conversation thread when you get new messages. But it clearly isn't meant for that and the app isn't set up to make using it in this way easy.

In general, project management tools like GitHub projects, Trello and Basecamp tend to be better for  more asynchronous communication while video calls and screensharing are on the other side of the spectrum, they require you to drop everything else you were doing. Real time chat tools like slack or hip chat can end up somewhere in the middle--you can often postpone responding to a message that is less directly relevant to you but then be expected to respond promptly to a direct message (for example). 

With all of our apps sending us emails and push notifications it would seem that they all want to be real time but we shouldn't always let them. In order to do creative work we need to be able to avoid interruptions so choosing wisely about when to communicate synchronously versus asynchronously is something that needs to be balanced.

This creates a particular challenge for a remote worker as these communication channels need to replace in person interactions and serve the additional function of making them feel part of the team (and sometimes proving to others that they're working). A remote worker has to balance maintaining a certain amount of availability and responsiveness on communication platforms while still managing distractions to avoid losing productivity.

Pick the right tool for the job. The more synchronous the communication method you reach for the more you are insisting on someone else's time when they might be busy and you might be interrupting their flow. Generally I've found that "escalating" to more synchronous communication allows people to opt in to communicating with you when it's optimal for their own productivity. For example someone might comment on your pull request and if you notice the comment was recent you might ping them if you need additional clarification. If a broader discussion were to arise out of this you might upgrade to a video call so that you can more quickly and effectively share your ideas.

Every team has to establish their own mores on when and how to use communication tools and discover what works best for them.



