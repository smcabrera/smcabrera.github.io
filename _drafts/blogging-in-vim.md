# Blogging in vim: Tools and tricks I use to write blogs without ever leaving vim

```viml
  command! Blog tabe~/workspace/smcabrera.github.io
  command! Draft ! cp % ~/workspace/smcabrera.github.io/_drafts/
  command! Publish ! cd ~/workspace/smcabrera.github.io ; bundle exec octopress publish %
```

These are custom commands that allow me to make things easier such as for instance. I can type :Blog and be automatically brought into the folder for my blog. I keep some notes as a markdown file so that if I'm working on something and I learn something that I might like to blog about, I can make a note about it.

```viml
  command! Til tabe~/workspace/til
```

Til stands for "Today I learned" and is an idea I got from Thoughtbot: https://github.com/thoughtbot/til

The idea is just to make small notes about little tidbits that you learn. It turns out that these little tidbits can make good blog posts. So if I'm working on something and I learn something new I can interrupt myself briefly to make a quick note about it just by typing

```viml
:Til
```

This will open up a new tab in a repo where I keep such learnings.

Then at some later date I can come back and run

```viml
:Draft
```

A command I created with the following line

```viml
  command! Draft ! cp % ~/workspace/smcabrera.github.io/_drafts/
```
which just copies the current file into my drafts folder. "/_drafts/" is a folder that octopress expects to be there and will use that folder to move posts into "/_posts/" from which they are then published.


