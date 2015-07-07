# Screwing Up Rails Migrations

I make *tons* of mistakes when writing code. Missing a semicolon in a javascript file, mispelling a method from the ruby standard library, using the wrong capitalization or pluralization in a rails class; there are so many opportunities for mistakes! Fortunately rails and most modern web stacks are pretty forgiving in this regard, giving you pretty helpful error messages. A core part of the TDD workflow after all is writing tests that fail and then just moving error through error as you create the functionality needed to stop getting errors. You learn to not be afraid of errors.

One area though that *does* cause problems for me when I screw it up are my migrations. Unlike the rest of your code the rails code in your migrations is responsible for changing the structure of your database so you want to be extra careful with how you write it and what you do when you screw up. You can’t just run the file again like you would with your controller for example.


 • I’d like to see if I can find some tool that will allow you to tinker around with your database before writing your migrations, that or some workflow that will make it easier for me to go back and fix things—I feel like I’ve been doing this very wrong.
- You can actually run a generator with some kind of test or pending flag which allows you to see what files the generator would create before it's run for real. There will be plenty of things you won't notice until you're tinkering away with the project, but some mistakes you'll be able to detect just by looking at the files generated.
• This article on "etiquette" for rails migrations (how to play nice in teams) seems like a really useful one http://jordanhollinger.com/2014/07/30/rails-migration-etiquette/

Situations: Deleted a bad migration, but it's still there
• If you deleted a migration for a table or named a table wrong. I did this when I accidentally wrote CreateCollaborationsTable in the generator and it wrote a migration for a collaborations_table table. Not good. I deleted this migration. But then when I try to restart the database with ```rake db:reset``` it won't get rid of the offending table because it still has the wrong table in the schema. My understanding is this is because reset runs all the "downs" for the migrations followed by all their "ups". But since there are no migrations for this one it's got nothing to run and so leaves the schema alone.

To solve this:
drop the whole database and create it again:
```
rake db:drop
rake db:create
rake db:migrate
```

It’s not enough to recreate the database and try to go on with your business. You need to drop the database and then recreate the schema by migrating again.

How to Avoid this:
Don’t panic and delete your migrations! If you’ve already run migrations they’re “live” as it were. *Always rollback migrations before changing them*! This ensures that if the migration is bad in some way your database is not reflecting that badness. As long as you always get in the habit of running a rollback immediately—before making changes to the migration—then you should be good because you’ve made sure to undo the work you’ve done before doing it again. Remember:

```
Rails generate migration BadMigration
rake db:rollback
rm BadMigration # or edit it or whatever
Rails generate migration CorrectMigration # Unless you edited instead.
rake db:migrate
```


