# %w(array) and Rubocop
Okay maybe I'm cheating here because I've got two things to mention in this one. The rubocop gem and the %w syntax for arrays.

## rubocop
I just discovered a very cool gem called [rubocop](https://github.com/bbatsov/rubocop). Rubocop is a gem that checks your ruby files for violations of the [ruby community style guide](https://github.com/bbatsov/ruby-style-guide), a community-driven compendium of what people have found to be the most readable ways of writing ruby code. Sweet. And there's a vim plugin! Double sweet.

So, right away I wanted to try running it on some of my code. Fortunately I've got some ruby code that's great for sandboxing and getting community feedback--the code in my code katas I'm working on with exercism.io.

It turns out that the comments can be pretty handy for learning little things about ruby as well. Which brings me to the %w(array) syntax

## %w(array)
I got the following message from rubocop:

Use %w or %W for array of words.

Ok, I'll bite. How do you use %w?

A quick check on stackoveflow reveals the following:
```
%w(foo bar)
```
is a shortcut for
```
["foo", "bar"]"
```

I could have immediately made the change to my kata at this point, but it seems like there's more to be gained from exploring this a little bit. Let's open up pry.

```
pry(main)> %w(foo bar)
=> ["foo", "bar"]
```
unsurprisingly that delivers as promised. That does seem like a nicer way to initialize an array because you can avoid a bunch of quotes if your array is going to be full of strings anyway. Wait. Strings...the rubocop comment mentioned 'words'. I bet these wouldn't work with strings that have spaces:

```
%w(foo "baz bar")
=> ["foo", "\"baz", "bar\""]
```

So yes that doesn't "work" if what you wanted was a string "baz bar". Ruby assumes that you wanted baz and bar separately but that you wanted those "words" to begin and end with double qoutes respectively. So it's really only useful when you've got are "words" in the vim conception of a word--a unit of text surrounded by spaces.

Someone pointed out that this is basically "whitespace delimited" array or "word array".

It turns out though that these spaces can be escaped, just as you can escape double-quotes when you need to.

```
%w(foo baz\ bar)
=> ["foo", "baz bar"]
```

And then you get your words with spaces in them. But really it's probably better for when they're just words.

One last point. The rubocop comment mentioned using either %w or %W. I tried these both out in pry but didn't see any difference in result. So I looked it up. According to stackoverflow:

"When capitalized, the array is constructed from strings that are interpolated, as would happen in a double-quoted string; when lowercased, it is constructed from strings that are not interpolated, as would happen in a single-quoted string. For example:"

That's a little confusing. Fortunately he gives an example:
```
foo = "bar"
=> "bar"

%w(#{foo} bar baz)
=> ["\#{foo}", "bar", "baz"]

%W(#{foo} bar baz)
=> ["bar", "bar", "baz"]
```

This carries a bonus with it because I actually didn't know that that was something different about double and single quotes! So that means that similarly if you did this:
```
x = "FOO!"
=> "FOO!"
"#{x} is tasty"
=> "FOO! is tasty"
'#{x} is tasty'
=> "\#{x} is tasty"
```

Cool! This should be really handy. Makes me want to check out what other ruby formatters are out there. And it seems like I could learn a lot by running rubocop on all my ruby files and seeing what comes up. I've got a lot of violations!


