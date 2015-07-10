---
layout: post
title: "Refactoring Legacy Code"
date: 2015-07-10T11:58:13-04:00
excerpt: "A first foray into improving someone else's messy untested code"
modified: 2015-7-9
tags: [refactoring, rails]
comments: true
image:
  feature:
  credit:
  creditlink:
---

In his book, *Working Effectively with Legacy Code*, Michael Feathers writes "To me, legacy code is simply code without tests." This isn't just because tests are nice and let you make changes without breaking things. It's also because of the truism that code that's easy to test tends to be easier to reason about and easier to maintain.

For a recent client project I have been working with code that has no tests and, unsurpisingly if Mr. Feathers is to be believed, some less than ideal production code too. What follows is a look at one example of how I went about trying to make a marginal to the codebase by adding tests and then refactoring.

## Context
In this application we have ```users``` and these users have ```items``` with monetary values associated with them. We need to display the "Net worth" of users, which is defined (currently!) as the total value of the user's items.

Right now this data is persisted on the user with an attribute called ```net_worth```. This attriute is then updated as needed. As is, "as needed" just means "when the user accesses his dashboard and the other view templates that use this data. Several view templates make a call to a ```set_net_worth``` a method defined both in the ```application_controller``` and ```application_helper```. Here is that method:

```ruby
def set_net_worth
  if current_user
    if current_user.net_worth == nil
      current_user.net_worth = 0
      current_user.save
    else
      @item_values = 0
      current_user.items.each do |item|
        if item.value != nil
          @item_values += item.value
        end
      end
    end
   current_user.net_worth = @item_values
   current_user.save
  end
end
```

## The Problem
You may have noticed a few potential problems with what I've just mentioned. Mutating our user object from the presentation layer violates the MVC separation of concerns, duplicates the *exact* same method in two places violates DRY and the method itself is pretty large. However, my policy is to wait to refactor something until doing so would ease another change I'm trying to make. I'm not going to spend my time, and therefore my client's money, to change something just because it gives me migraines.

In this case the issue arose when I wanted to show my client a version of the app populated with seed data (using the excellent ```Faker``` gem) to give a sense of what it would look like populated with users. When I did this I was surprised to find that the users were all displayed with a net worth of 0. This is because set_net_worth doesn't get called until the user visits one of the pages where it gets called. I wasn't about to log in as each user and visit all the pages nor was I going to double down on what I already consider to be bad design by calling set_net_worth in more places. It was time to fix the cludge starting with some test coverage.

## Starting with a test
The last thing you want to do when refactoring is break existing functionality and have to tell your client that you're charging him for two hours of your work that you spent breaking the app you were given. By starting with a test I know that if nothing else we'll have a bit better test coverage when this is all done. So I started by writing a test for the set_net_worth method I already had.

I did change one thing from the start though--I copied the method into the user class. This maps what I eventually intended to do with the method but it also gives me the advantage that I no longer have to worry about who the ```current_user``` is (a method from devise that requires me to have a signed in user). Also instead of writing an integration test I can just add a unit test to my user test suite:

```ruby
describe "set_net_worth" do
  it "sets user's net worth to the sum of the value of their items" do
    user = create(:user)
    3.times { user.items.create(value: 1000) }
    user.items.create(value: nil)

    expect(user.set_net_worth).to eq(3000)
  end

  it "set user's net worth to zero if they have no items" do
    user = create(:user)

    expect(user.set_net_worth).to eq(0)
  end
end
```

Here we see another advantage of writing tests for current functionality before refactoring. Looking at the current ```set_net_worth``` method I noticed that it checks for items having a value of nil. This tells me that items can have a value of nil (as it stands--this may be a bad idea in the long run, but we work with what we have). Any refactoring of set_net_worth will have to take this fact into account. To make sure I do I include a nil value for an item in my test case so that the suite will only pass if my new method is able to handle this possibility. Had I just rewritten the method from scratch I likely wouldn't have thought of this and would have had to chase down nil-related bugs later on.

## My Solution

I wrote the production code in two steps:

### Move set_net_worth to user class
Copied the code from the old set_net_worth method to the user class and change it to make its test suite pass.

This enabled me to gradually simplify the method, while ensuring that at no point did any of my changes make the test suite fail. The resulting method looked like this:

```ruby
def set_net_worth
  net_worth = items.map { |i| i.value }.compact.sum
end
```

Even if we stopped here we'd have brought this method from 15 lines in two places to 1 line in the user class (of course we'd have to update all those set_net_worth calls to current_user.set_net_worth).

### Change set_net_worth to net_worth
Drop the ```net_worth``` field from the database and change the name of ```user#set_net_worth``` to simply ```user#net_worth```. This way we never need to call ```set_net_worth``` at all and the existing references to the ```net_worth``` attribute will work without modification since they'll just call my ```net_worth``` method instead of the ActiveRecord getter method.

Our method then looks like this:

```ruby
def net_worth
  items.map { |i| i.value }.compact.sum
end
```

## Alternatives
It's worth noting that there's a potential tradeoff by calculating net worth on the fly as opposed to saving it in the database. By calculating on the fly you risk a performance hit if doing so involves accessing many model objects (we have to access all of the user's items and all of their value attributes albeit with map which I think is faster than iterating over them with each). If this calculation became more complicated for some reason (if it involved more than just a sum maybe). I suppose this could turn into a lot of computation every time you wanted to display a user's ```net_worth```.

If you thought that you were going to do slow computations a lot and that you weren't going to have to recalculate net worth very often you could keep ```net_worth``` in the database. Instead of the view templates though, you'd want to move calls to set_net_worth to controllers or to a callback like this:

```ruby
class Item < ActiveRecord::Base
  ...
  after_save update_net_worth
  ...

  private

  def update_net_worth
    user.net_worth = user.items.map { |i| i.value }.compact.sum
  end
end
```

I considered this, but it seems like a worse idea. There's been a lot written about [the danger of callbacks](http://samuelmullen.com/2013/05/the-problem-with-rails-callbacks/). Some argue that, while tempting, you should just never resort to callbacks, while others take the stance that [callbacks should only be used without any external dependencies](https://www.bignerdranch.com/blog/the-only-acceptable-use-for-callbacks-in-rails-ever/) something which my quick example clearly violates, mutating the item's parent user when it is saved. I like to think of the problem as simply one of obfuscation--at some point in the future you're going to get behavior you don't expect when you're updating something and other objects change without you're having asked them to and even without.

Either way, our virtual attribute solution is clearly better than the status quo which calculates ```net_worth``` *every time the view loads*. Also if I do need to change things later it's way more transparent to another developer or a future me--I can see that the user's net worth is being displayed by a call to user#net_worth and if I go to the class definition the ```net_worth``` method is right there, its logic not hidden away in two different helpers and various view layers.

I love discussing the sorts of tradeoffs that different solutions require so if you've got any ideas about my process or my solutions to problems I'd love to hear about them in the comments.

