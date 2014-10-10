
```
[2] pry(main)> cd Array
[3] pry(Array):1> ? map 

[1mFrom:[0m array.c (C Method):
[1mOwner:[0m Array
[1mVisibility:[0m public
[1mSignature:[0m map()
[1mNumber of lines:[0m 12

Invokes the given block once for each element of [32mself[0m.

Creates a new array containing the values returned by the block.

See also Enumerable#collect.

If no block is given, an Enumerator is returned instead.

   a = [ [31;1;31m"[0;31ma[1;31m"[0;31;0m, [31;1;31m"[0;31mb[1;31m"[0;31;0m, [31;1;31m"[0;31mc[1;31m"[0;31;0m, [31;1;31m"[0;31md[1;31m"[0;31;0m ]
   a.collect { |x| x + [31;1;31m"[0;31m![1;31m"[0;31;0m }        [1;34m#=> ["a!", "b!", "c!", "d!"][0m
   a.map.with_index{ |x, i| x * i } [1;34m#=> ["", "b", "cc", "ddd"][0m
   a                                [1;34m#=> ["a", "b", "c", "d"][0m
```

```
a = [ "a", "b", "c", "d"]
=> [ "a", "b", "c", "d"]

a.map { |x| x + "!" }
=> [ "a!", "b!", "c!", "d!"]

```



### Pry and Slimux: REPL-driven development Nirvana

The final breakthrough for me was when I discovered a vim plugin called slimux.  I've already mentioned how I think the speed of feedback is key to learning. I also think that the future of text editors and shells will be to converge to the point where they become indistinguishable. We're not there yet but slimux comes pretty darn close. Basically it let's you specify a tmux window and then start sending lines of text to that terminal window. I'll usually open up a pane in my existing tmux window with vim on top and pry on the bottom. I've got ```<leader>s``` mapped to send a line to tmux so that in less than a second the line(s) I'm currently on in vim are sent to pry. Everytime I write a new line of code and I want to test my expectations for what it will do I send it to pry and in less than a second I have feedback. And importantly it's just that one line of code. I think it's actually immensely important that I don't have to run the whole file and then see what happens. Then of course all the data that I send sticks around in memory so I can poke and prod it just to reassure me of things and not clog up my text file.

It may seem trivial to get excited about shaving off the admittedly tiny amounts of time that it would have taken to go back and forth between a text editor and a terminal. However I think those small amounts of time are enough that they allow you to maintain better focus on the task at hand since your feedback is even faster. It reduces the friction for testing your hypotheses, meaning that you do such testing more often. This is key, and it's why I think REPL-driven development deserves more attention both as a means of wrapping your head around new code and learning as a beginner.

