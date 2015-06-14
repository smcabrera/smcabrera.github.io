---
layout: post
title: Duck Typing and Case Statements
excerpt: "A few options for accepting different types of parameters in your ruby methods"
modified: 2015-6-14
tags: [ruby]
comments: true
image:
  feature: duck-typing.jpg
  credit: Victor Arias
  creditlink: http://victorarias.com.br/2013/08/10/quacking-the-duck.html
---

How do you write a method that can accept different types of arguments? What does "duck typing" mean and will it help me solve this problem?

I had these questions myself recently and I thought I'd lay out the answers that I found.

Sometimes we want to write methods that don't know exactly what type of arguments they're going to have passed in, and are able to be a little more flexible. I'm going to talk about a few ways to do that in ruby as well as discuss what the heck duck-typing means and how it can be useful to you.

How do you write a method that can handle different outputs? This post is going to discuss a few of your options 

## Handling different inputs
Let's make things really concrete from the beginning. I have a Visa class that can instantiate Visa objects with the date that someone entered the country and will have methods that can tell me things about the visa like when it's going to expire or how many days are left.

Here's a very simple implementation of such a class:

~~~ ruby
class Visa
  def initialize(entry_date)
    @entry_date = entry_date
  end

  attr_accessor :entry_date

  def to_s
    @entry_date.to_s
  end
end
~~~

Note that we can instaniate new visa objects by passing in an argument, but we really don't care what class that argument is (though we probably should!). When I pass in a string the ```entry_date``` attribute will be a string, if I pass in a ```Time``` object, the attribute will be of class ```Time```, etc.

```ruby
visa = Visa.new("Today")
puts visa # => Today
```

 you  term duck-typing being used  recently What if you need to actually check the types with a case statement? This article is helpful for that as it can be a little confusing.

[stack overflow post](http://stackoverflow.com/questions/3908380/ruby-class-types-and-case-statements) explains this point nicely.

Let's say I want to allow my initializer for a class to take different types as an input and then convert them into a date. I could have something like this:

```ruby
class Visa
  def initialize(entry_date, days_granted = 90)
    self.entry_date = self.parse_date(entry_date)
    self.days_granted = days_granted
  end

  def parse_date(date)
    case date
    when Date
      date
    when Time
      date.to_date
    when String
      Chronic.parse(date).to_date
    else
      "Something else"
    end
  end
end
```

An example here using duck-typing would be if rather than using a case statement checking for type, I decided to not bother with that and let each data implement the parsing itself. So each of the classes would have to have a ```parse_date``` method. Now in this particular case we probably don't want to implement such methods as this would involve monkey-patching the Date class and the Time class--but it could be done!

here I'm calling the parse_date method on the argument to new before saving it away as a part of the object's date, because I want to make sure that it's saved as a Date object for the other methods I'm going to define on this class. In order to be able to receive different kinds of arguments other than Date I have a case statement in the parse_date method switch on the class of the argument and then return the argument converted into a date.

Now that I think about it, I think the above isn't actually an example of duck typing...not yet.

I think (and it would be good to double check this) that duck_typing would be to say "hey, we can actually forget about the type checking and just assume that whatever gets passed in is something that has a to_date method and then just call its to_date method assuming that all the possible arguments will know how to turn themselves into dates.
