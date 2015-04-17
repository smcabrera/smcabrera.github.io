# Active Record Defaults and the Danger of Callbacks

I noticed something really sneaky about the method I used for setting initial values. This is something I've been doing in a couple projects now, following the advice of [this stack overflow answer](http://stackoverflow.com/a/5127684/2181217).

Basically the issue is that Rails ActiveRecord class hijacks our the normal ruby class initialize method. In order to set attributes in the child classes (our models) we need to do something else. The suggestion above is to use an after_initialize callback. Callbacks are actions that will take place when a specific event happens, in this case, when an active record object is first instantiated.

For example if we have a User model and we want that user's role to default to "free" (as oppposed to "admin") we could do something like this

```ruby
 class User < ActiveRecord::Base
    after_initialize :init

    def init
      self.role  ||= "free"
    end
  end
```

Note that I used the || operator above to set a default value *only if the value is nil*. This is something that I neglected to do the first time around. If you don't use this syntax and just do something like this:

```ruby
 class User < ActiveRecord::Base
    after_initialize :init

    def init
      self.role = "free"
    end
  end
```

You'll then be unable to set your own values for your resources. So now if you run something like:

```ruby
admin = User.create(:name => "Steve", :role => "admin")
admin.role
=> "free"
```

If you don't remember where you created that callback (maybe you did it a long time ago) you might end up with no idea where this error came from!

In this case it's not so bad--you're setting the callback someplace that's actually reasonably obvious (within the model itself) and the code that it's calling is right there too. Plus it's in the same general area fo the model where a regular ruby class initialize would be, and fulfills much the same role. So it's *relatively* harmless (though it would still be nice if rails came with a more elegant solution for this). Still, I think it shows off the danger of using callbacks and why you always need to be very careful with them.

More on active record callbacks (and their perils):
[Rails Guides: Active Record Callbacks](http://guides.rubyonrails.org/active_record_callbacks.html)
[The Problem with Rails Callbacks](http://samuelmullen.com/2013/05/the-problem-with-rails-callbacks/)
[The Only Acceptable Use for Callbacks in Rails Ever](https://www.bignerdranch.com/blog/the only acceptable use for callbacks in rails ever/)








I noticed something really sneaky about the method I used for setting initial values. This is something I've been doing in a couple projects now, following the advice of [this stack overflow answer](http://stackoverflow.com/a/5127684/2181217).

Basically the issue is that Rails ActiveRecord class hijacks our the normal ruby class initialize method. In order to set attributes in the child classes (our models) we need to do something else. The suggestion above is to use an after_initialize callback. Callbacks are actions that will take place when a specific event happens, in this case, when an active record object is first instantiated.

For example if we have a User model and we want that user's role to default to "free" (as oppposed to "admin") we could do something like this

```ruby
 class User < ActiveRecord::Base
    after_initialize :init

    def init
      self.role  ||= "free"
    end
  end
```

Note that I used the || operator above to set a default value *only if the value is nil*. This is something that I neglected to do the first time around. If you don't use this syntax and just do something like this:

```ruby
 class User < ActiveRecord::Base
    after_initialize :init

    def init
      self.role = "free"
    end
  end
```

You'll then be unable to set your own values for your resources. So now if you run something like:

```ruby
admin = User.create(:name => "Steve", :role => "admin")
admin.role
=> "free"
```

If you don't remember where you created that callback (maybe you did it a long time ago) you might end up with no idea where this error came from!

In this case it's not so bad--you're setting the callback someplace that's actually reasonably obvious (within the model itself) and the code that it's calling is right there too. Plus it's in the same general area fo the model where a regular ruby class initialize would be, and fulfills much the same role. So it's *relatively* harmless (though it would still be nice if rails came with a more elegant solution for this). Still, I think it shows off the danger of using callbacks and why you always need to be very careful with them.

More on active record callbacks (and their perils):
[Rails Guides: Active Record Callbacks](http://guides.rubyonrails.org/active_record_callbacks.html)
[The Problem with Rails Callbacks](http://samuelmullen.com/2013/05/the-problem-with-rails-callbacks/)
[The Only Acceptable Use for Callbacks in Rails Ever](https://www.bignerdranch.com/blog/the only acceptable use for callbacks in rails ever/)








