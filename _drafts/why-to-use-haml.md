# Why You Should Actually Bother Learning Haml

haml is an alternative to erb for rendering html and running ruby code in your views. I've been playing around with it recently and I'd like to share some initial impressions.

I've been playing around with haml in some of my views. Ocasionally I've had some difficulty with the syntax and I've wondered if this is worth it.

As an aside, I think this is an excellent model for adding new technologies to your workflow. Don't be extreme about it, just start introducing gradually, in areas where the costs are lower. This is basically what I did to learn vim--I was doing a course and during the introductory (easy ) part of the course I decided to do it using vim to make it a little more interesting.

So today I learned why haml can be worth bothering with. I was trying to use haml for a partial to display flash notices in a rails app. I got tripped up on how to deal with the data-dismiss html attribute so I started googling and I found [this on stack overflow](http://stackoverflow.com/a/13978951/2181217).

That little code fragment seems a better explanation of why to use haml than anything else I've seen. It would have been kind of a pain in the ass to write the same view code with erb, and frankly it's probably why I hadn't bothered with it (I knew it would be better but it seemed like it was going to be kind of a mess).


