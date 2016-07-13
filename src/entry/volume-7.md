% Volume 7: The Ants Keep Marching
%
% 2015-11-12

# Volume 7: The Ants Keep Marching

Last week I fell asleep in my hotel room before I could write hifi for its
usual publication time, so I just didn't do it. This week, I'll probably either
fall asleep mi

...

Sorry, drifted off there. What was I saying? Oh yes. I had a wonderful
time last week at [Ricon](http://ricon.io), saw a few old friends, met
a few new, and played some arcade style fighting games. And there were
some great talks, too!

Among my favorites:

* [Deniz Altinbuken](http://www.cs.cornell.edu/~deniz/): [Building Principled Distributed Systems With Transformations](https://www.youtube.com/watch?v=vW8pN07cH8M)
* [Jon Moore](https://twitter.com/jon_moore): [How to Have your Causality, and Wall Clocks, Too!](https://www.youtube.com/watch?v=kaPezxGHHfE)
* [Scott Lystig Fritchie](https://twitter.com/slfritchie): [Managing Chain Replication Metadata with Humming Consensus](https://www.youtube.com/watch?v=yR5kHL1bu1Q)

Now, on to some hacks!

# Hackity Hacks (in pseudo random order)

## Flancy --- Tome Tanasovski

Flancy is a micro web framework for PowerShell! *[Yes, I included something developed for Windows. I'm also a Microsoft shareholder. Ask me some time, why. -- ed]*

* [Github](https://github.com/toenuff/flancy)

## sent --- Markus Teich

I'll have to be honest, I don't understand why it's called "sent", but
you can't beat the simplicity of it, so I sent it your way. sent takes
a plain ole text file and turns it into a set of slides. Works in
X11. Less than 1,000 newlines of C.

* [Sent on Suckless.org](http://tools.suckless.org/sent)

## svgo --- Anthony Starks

SVGO is a Go library for writing Scalable Vector Graphics. Lots of interesting
demos, and a Go Playground like tool for exploration.

* [Github](https://github.com/ajstarks/svgo)

## Reanimated --- Timothy Pratley

An animation library for ClojureScript. *[I'll be honest, I'm including this mostly because of the logo, but I am also a fan of animation. -- ed]*

* [Github](https://github.com/timothypratley/reanimated)

## Scout --- Charles Leifer

Scout implements a full-text searcher, using sqlite and Flask to expose a REST API. *[I'd love to see a simple to deploy, statically built version of this, as easy to deploy as redis. -- ed]*

* [Github](https://github.com/coleifer/scout)
* [Blog post](http://charlesleifer.com/blog/meet-scout-a-search-server-powered-by-sqlite/)

## WOPR --- Yaron Naveh

A very *slick* markup language for writing reports viewable by your terminal. You'll just
have to look at the screenshots. *[Can you guess where the name came from? -- ed]*

* [Github](https://github.com/yaronn/wopr)

## Parinfer --- Shaun LeBron

Simple and elegant [weapon](https://xkcd.com/297/)\^Wtheory for writing Lisp source code. *[I can only imagine there are hundreds of efforts underway right now to port it to $EDITOR -- ed]*

* [Github](https://github.com/shaunlebron/parinfer)
* [Docs](https://shaunlebron.github.io/parinfer/)

## icmptunnel --- Dhaval Kapil

Tunnels IP packets on top of ICMP echo and reply packets. *[I've seen something like this used before to get around wifi paywalls. -- ed]*

* [Github](https://github.com/DhavalKapil/icmptunnel)
* [Homepage](https://dhavalkapil.com/icmptunnel/)

## curio --- David Beazley

Members of the python community will recognize the name immediately as a prolific Python hacker. curio is a library for doing concurrent programming in Python that takes advantage of the new (?????) `async`/`await` syntax. *[I guess I've been out of the Python loop for a while, but naturally async/await just desugars to some magic methods like the with statement. Surely there are lots of potential [new](http://sigusr2.net/dispatching-with-with.html) [hacks](http://sigusr2.net/python-worlds.html) around it! -- ed]*

## Blabr ---  Martin Clark and Gary Ballantyne 

Scientific computing for the web. 

* [Github](https://github.com/puzlet/blab)
* [Homepage](http://blabr.io)

## Ariel --- John Coates

It hasn't shown up on my AppleTV *[maybe 'cause it's not the new one -- ed]* yet, but the Ariel views screensaver looks really neat. This is a port of it to the Mac. *[Remember the 90s when you could buy shrink wrapped screen savers? -- ed]*

* [Github](https://github.com/JohnCoates/Aerial)

## Vibreoffice --- Sean Yeh

Vi bindings for LibreOffice. Not sure why this didn't exist before... *[I can't help myself. A better version would use emacs keybindings. har har. -- ed]*

* [Github](https://github.com/seanyeh/vibreoffice)

## clipmenu --- Chris Down

A [dmenu](http://tools.suckless.org/dmenu/) based clipboard manager.

* [Github](https://github.com/cdown/clipmenu/)

# Yet more stuff to look at

* [CPython Internals](http://pgbovine.net/cpython-internals.htm): Video lectures about the internals of the CPython interpreter. *[disclaimer: I haven't watched these yet, but they appear interesting to me. -- ed]*

# Honk, Honk!

Well, that was a lot of hacks! I guess this is what happens when you
skip a week!

I'm always on the lookout for interesting hacks, projects, pieces of
art, neat papers, etc. If you have something I should see, don't
hesitate to reply to this email!

Oh! And, are you or someone you know working on a big project with an
interesting story (or even a boring story, but with interesting
problems)? Let me know! I'd love to ch chat with you/them.


Until next time!

Happy hacking,

Andrew
