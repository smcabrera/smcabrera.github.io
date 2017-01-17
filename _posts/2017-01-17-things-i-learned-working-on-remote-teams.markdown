---
layout: post
title: Five Things I Learned Working on Remote Teams
modified: 2017-1-17
excerpt: ""
tags: [remote]
comments: true
image:
  feature:
  credit:
  creditlink:
---

I've worked on remote teams in various ways throughout my career before and after becoming a software developer and I've seen things that worked well and things that didn't work so well. There's plenty of resources out there (which I'll try and put together on this blog at some point) but here's a few things that I have learned from my own experience. 

## 1. Slack is your office
Being able to get in touch with your colleagues quickly plays a big role in creating the feeling of being on the same team and being in the same room. You say good morning to everyone when you come, you engage in some random chit chat, you digitally tap people on the shoulder when you have a question or a problem, you crack jokes with people, you congratulate them for their successes.
<br>
Of course this also brings with it some of the downsides of an office as well. In the same way that open concept offices can be "distraction factories" (in the words of Jason Fried and DHH in [remote]()) slack brings those office distractions to your remote work life too. Fortunately unlike with in-person distractions, the distractions caused by slack (and I imagine for other chat platforms as well) can be managed by adjusting the kinds of notifications you receive for different kinds of messages and different channels. You also need to try and respect others' time by ensuring that you don't take up too much of it or insist that people respond by sending direct messages all the time or tagging all of your messages with @chnnnel. People need to have time free of distraction to get work done, just like they do in real life.

## 2. There's nothing like face time 
Talking face to face is important for a team to really feel like a team. Even though video chats make achieving this easier than ever before there is often friction around video chats which keep conversation from being as spontaneous as  on a co-located team. Video chats require scheduling in a way that in person conversations do not.
<br>
One way around this is doing a daily standup over video chat. At a minimum you get to see each other's faces once a day even if there wasn't anything specific that you would have called a meeting for. Invariably in talking about your work things will surface that you wouldn't have thought to address in a meeting but now that you're together you can deal with. If you go too far down any particular rabbit hole you can always table it for another call or pair programming session after the standup is over. Then you get the additional benefit of feeling more like a member of the team.
<br>
I worked with a team that had one set video conference call per week but this didn't seem to work as well. It just seemed like a lot more work getting the meeting going and the meetings dragged on for far longer, with a lot of time spent on issues that weren't pertinent to the entire team. It made me wonder if the lack of face time the rest of the week had caused people to want to take advantage of this precious opportunity and say anything that they had wanted to say during the rest of the week. Whereas when people know that this is something that happens every day it's easier to get into the habit. 
<br>
I've read that Zapier, whose team is 100% remote, randomly pairs people up *solely* for the purpose of getting to know their team members which I suspect could be similarly valuable.

### 3. Remote Pair Programming can be just as good as in person
While there are challenges to remote work that require you to do things very differently pair programming is one where once you have the right setup, the experience is nearly identical to doing it in person.
<br>
My experience with remote pairing has been extremely positive. I learned web development with rails through a completely online rails bootcamp, through pairing with senior developers using [tmate](tmate.io) and screenhero two tools that I highly recommend for this purpose. I've continued to use pairing as a learning and collaboration tool in all of the remote jobs I've had and it hasn't let me down. While I've certainly enjoyed pairing in person at local hack nights, I haven't noticed much difference between sharing a keyboard and sharing screens over a fast internet connection.
<br>
There's a lot out there on remote pairing setups (I even picked up [a book about it](www.example.com) from pragmatic bookshelf) but suffice it to say that you're going to want to have pretty fast internet speeds if you're doing your pair programming using a screensharing application like Screenhero. tmate, a fork of tmux which allows your pair to ssh into a tmux session with you is a very simple low setup way to get started pairing with someone and it's far less demanding on your bandwidth...but you're going to have to use a terminal editor and then you'll still need something else for the calling. You could use whatever you use for  If you're in the same country you could just use an old fashioned phone call, or you can use a tablet for video calls and your computer screen for screensharing). 
<br>
Which leads me to...

## 4. Internet (upload) Speed Matters

In discussions about remote work it's common to read things like "work from anywhere with an Internet connection!" For remote developers (and I suspect others as well) should be amended to "work from anywhere with an upload speed of at least 1mbps on average preferably 10mbps or more".<br>
We discussed the importance of video calls and screen-sharing. Both of these activities, crucial for a remote developer, require not only high download speeds but also high _upload_ speeds. This would be fine if the two were always equal, but wifi for consumers rarely is. Basically consumers value download speed more than upload speed so ISPs can get away with offering _significantly_ slower upload speeds--people want to streaming Game of Thrones but don't care if it takes an extra second to upload their resume to a job site. As a remote worker upload speed is almost always your bottleneck when comparing internet speed options.<br>

You can get a pretty good approximation for average internet speed using sites like speedtest.net. The easiest solution is just to work out of a coworking space (where they have strong incentives to make sure you always have fast internet) or make sure your home internet plan has a high enough upload speed--possibly switching to a business plan if not.  <br>

I've kept track of internet speeds in various places I have visited and they have varied widely. I've found that you can usually get away with internet upload speeds as low as 1 mbps which sounds terrible but you would be surprised how many places that have well over 10mbps of download have upload speeds that don't break 1.

## 5. Use the right level of synchronicity
Different communication tools have different levels of synchronicity that they tend to expect in their users. Most of the time how real time a communication channel defaults to can be a little subjective. Could you have a real-time back and forth conversation over gmail? Sure you could, gmail will refresh the conversation thread when you get new messages. But it clearly isn't meant for that and the app isn't set up to make using it in this way easy.

In general, project management tools like GitHub projects, Trello and Basecamp tend to be better for  more asynchronous communication while video calls and screensharing are on the other side of the spectrum, they require you to drop everything else you were doing. Real time chat tools like slack or hip chat can end up somewhere in the middle--you can often postpone responding to a message that is less directly relevant to you but then be expected to respond promptly to a direct message (for examaple). 

With all of our apps sending us emails and push notifications it would seem that they all want to be real time but we shouldn't always let them. In order to do creative work we need to be able to avoid interruptions so choosing wisely about when to communicate synchronously versus asynchronously is something that needs to be balanced.

This creates a particular challenge for a remote worker as these communication channels need to replace in person interactions and serve the additional function of making them feel part of the team (and sometimes proving to others that they're working). A remote worker has to balance maintaining a certain amount of availability and responsiveness on communication platforms while still managing distractions to avoid losing productivity.

Pick the right tool for the job. The more synchronous the communication method you reach for the more you are insisting on someone else's time when they might be busy and you might be interrupting their flow. Generally I've found that "escalating" to more synchronous communication allows people to opt in to communicating with you when it's optimal for their own productivity. For example someone might comment on your pull request and if you notice the comment was recent you might ping them if you need additional clarification. If a broader discussion were to arise out of this you might upgrade to a video call so that you can more quickly and effectively share your ideas.

Every team has to establish their own mores on when and how to use communication tools and discover what works best for them.



