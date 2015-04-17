# %q
I recently looked up what the heck %w meant in ruby and this inevitably lead me to other percent-sign operators. So here's another one. I'll try to briefer this time.

```
%q(This is a string)
=> "This is a string"
```

So 'q' makes a 'quote'. That's an easy mnemonic. As you might expect it's handy if you've got different kinds of quotes and you don't feel like escaping them (because really who wants to fill up their otherwise perfectly readable string with a bunch of "\" characters?)

```
%q(This is a string. It's filled with "quotes" of different kinds)
=> "This is a string. It's filled with \"quotes\" of different kinds"
```

I can already think of places this would be useful. If you've got strings that you're trying to just write like text and then pass into some other function that's going to display them somewhere you're doubtless going to run into a situation where you were using the wrong kind of quote. I personally have experience with changing text from "can't" to can not, just because I didn't want to worry about filling up my text with escape characters because I'd forgotten what type of quote was surrounding the whole string.

Some on [stackoverflow](http://stackoverflow.com/questions/10144543/what-is-the-use-case-for-rubys-q-q-quoting-methods) mentioned they can be handy when you've got html and javascript strings and you "run out" of quotes. Like this:

```
link = %q[<a href="javascript:method('call')">link</a>]
```

Just like my contrived example, you've already used up your two quotes there. And can you imagine what that would look like filled with "\"s? And what if it. What if this were multiple lines for some reason? This actually brings up the question of the heredoc, which is another way to deal with long strings that I'd like to explore at some point. Another time.

