% Volume 3: In Which Phil Stops By
%
% 2015-10-02

# Volume 3: In Which Phil Stops By

And, we're back! So far, I've been treating
[hifi](http://hifibyapg.com) as an experiment, but as people sign up,
I'm beginning to think that people are starting to find it, dare I say
"valuable"? If not valuable, at least better than spam, but probably
lesser than a personal email from a close friend who is traveling /
living abroad.

Which is why this week's hifi is so interesting! Because, instead of
being closer to spam, we actually talk to a friend of mine who is
living in Thailand, [Phil Hagelberg](http://technomancy.us). There's a
million and 1 reasons you might know Phil, as he's either touched or
created basically [everything](http://technomancy.us/projects). But if
for some reason you don't, just think of him as the perfect candidate
to present at [Hack && Tell](http://hackandtell.org), if only he were
close to one...

But first, some hacks!

# Hacks (in no particular order)

## Linearizing Lake Michigan --- Daniel Huffman

I'm a sucker for interesting visualizations, and what might be
considered a "crack brain" idea. And, the idea of taking the shoreline
of a lake and visualizing it linearly is one such idea that happened
to produc some fascinating results.

* [Blog Post](https://somethingaboutmaps.wordpress.com/2015/09/28/a-matter-of-perspective/)

## VOC --- Russell Keith-Magee

VOC takes Python bytecode and converts it to JVM bytecode. *[They use the term "transpiler", which is my absolute biggest pet peeve, but it's too cool to boycott--ed]*

* [VOC on Github](https://github.com/pybee/voc)
* [Documentation](https://voc.readthedocs.org/en/latest/)

## lumail --- Steve Kemp

Lumail is a console based email client, so you can stop using Pine. It
features an embedded Lua interpreter for almost infinite amounts of
customizations.

* [lumail on Github](https://github.com/skx/lumail)
* [Website](http://lumail.org/)

# A conversation with Phil Hagelberg on Bussard

**Andrew: First of all, Phil, thanks for taking the time to chat about
  your new project,
  [Bussard](https://gitlab.com/technomancy/bussard). Can you tell the
  readers what it is?**

**Phil:** Bussard is a spaceflight simulator where programming is a key
mechanic.  You fly around a galaxy where you can mine asteroids,
explore star systems, upgrade your ship, trade cargo, and such with
realistic gravitation and thrust. So far pretty standard stuff, but
the modeling of the game centers around the computer systems that make
your ship and the space stations actually function.

Your ship is controlled by a Lua API--when you press the arrow keys to
fly around, the keymap system translates it into function calls that
engage the engine, turning thrusters, etc, but the setup of the
controls is all in "userspace", defined in a config file you can edit
in-game. Many of the upgrades you can find for your ship are purely
software routines that can offer improved things like trajectory
plotting and autopilot.

You can log into space stations over a faux-ssh into a unixlike
environment. Trading cargo, buying ship upgrades, etc. are done by
running unix commands. As the game progresses you will learn how to
read the code to understand what's really going on and eventually
break through some of the station security measures. Eventually you
will find and activate an artifact that lets you break out of the
game's Lua sandbox completely, giving you godlike control over the
universe.

**A: As a player of the game, how much of my time is spent programming versus controlling the ship and interacting with terminals? Is it completely scriptable, such that I could build an AI to play it autonomously?**

**P:** I don't know if it's developed to the point where I can give an
authoritative answer on the point of how your time is spent; some of
it will end up depending on what any given player finds fun. However,
I definitely want to build it such that writing autopilot and AI
functionality is a valid strategy; in fact it may already be
functional enough to allow you to script a trading AI that could rack
up an unreasonable number of credits since the piloting and trading
already happens completely in "userspace".

I would also like to build it so that you can buy other ships and load
your same AI into them, allowing them to function completely
autonomously on their own.

I'm slightly obsessed with the notion of exposing as much in
"userspace" as possible--it's a theme of sorts that runs through my
projects in how the user should be enabled both to do what the
designer of the tool intended but also to reach beyond that and find
new things that the creators never could have anticipated. Placing in
"userspace" things that would normally be hard-coded comes up again
and again. This is one of the core tenets of Emacs in particular
(which is where I learned it) but it can be applied many, many other
places. This is the first time I've actually built something around
the notion of eventually "escaping userspace" though!

**A: How did it come about? What is the end goal?**

**P:** I started working on it because I wanted a way for my kids to
explore programming concepts in a way that was fun without being
contrived. I've been reading a lot about how we learn (primarily
Seymour Papert's ["Mindstorms"](http://amzn.to/1GmZ3ou) and Postman and Weingartner's ["Teaching
as a Subversive Activity"](http://amzn.to/1GmZ6R2)) where it's emphasized that learning is
something that can only happen when a learner takes interest in
something and makes it their own by relating it to concepts they
already "own".

Topics that directly relate to the learner's felt problems are the
best bridges to learning in a way that sticks; in fact some claim that
this is the only way meaningful learning can possibly occur. So
teaching therefore becomes a matter of constructing environments in
which the learner can encounter problems and overcome them by learning
to grasp new techniques and make them their own.

**A: Your epic [list of projects](http://technomancy.us/projects) has but  one, relatively simple, game. What caused you to take on such a large and complicated project in a domain you seem to have little experience in?**

**P:** That's easy--it's because I have kids. I have really enjoyed
working on [Leiningen](https://github.com/technomancy/leiningen), but
there's nothing there that would interest them. Earlier this year I
wrote a number of less-noteworthy small hack games with my kids
(mostly in [Racket](http://racket-lang.org)); this is just the first
one where the idea had legs.

I did also enjoy the experience of writing something very simple
together with my kids over and over as a learning exercise. Even if a
lot of it is over their heads, they start to see patterns and get a
grasp on how things fit together once we've worked our way through
four or five games.


**A: You've written a basic clone of Emacs, and a "unix"-like "operating system" for the game. What have been the most interesting learnings from that experience?**

**P:** I've had a lot of fun thinking about sandboxing in both these
subprojects. The in-game ship REPL sandboxes code so that "userspace"
code only has access to function calls that enforce the rules of the
game. So this is a similar situation to client/server applications
where you can't trust the client; you need to make sure all validation
happens "server-side" or in this case outside the confines of the
sandbox.

The unixlike OS in particular is doubly-sandboxed; you have to keep
the user out of the workings of the OS and the "top-level" Lua
environment, but you also need to keep them out of other users'
files. It uses an interesting pattern to enforce filesystem
permissions. The raw filesystem is simply a Lua table, but before it
is passed to any user code it is wrapped in a proxy that uses Lua
"metatables". This allows for a table-like object in which all lookup
and insertion is intercepted; we can place assertions here that the
given user has read/write permissions before forwarding the lookups
and insertions to the raw table that is wrapped.

The editor has actually been surprisingly straightforward so far; in
particular I was pleased by how little work it took to take it from a
readline-like single-line editor into a full editor that functions
across many lines. Since Lua strings are immutable, the text buffer is
implemented as a table of strings, which makes edit operations that
span multiple lines a bit tricky; but it's not bad.

Of course any Emacs clone is going to land in the uncanny valley of
"feels like Emacs but doesn't get everything quite right" which is
unavoidable, but in a way the oddness and foreign feeling works with
the setting of the game. You have to imagine in the distant future we
will be working with systems that are the far-off descendants of what
we are using today.

**A: One doesn't get to write editors all that often (if ever), and there are clever strategies for implementing them. Have you considered utilizing one of the classical data structures such as [ropes](https://en.wikipedia.org/wiki/Rope_%28data_structure%29) or [gap buffers](https://en.wikipedia.org/wiki/Gap_buffer) instead of your current approach?**

**P:** I'm a pretty big
[YAGNI](https://en.wikipedia.org/wiki/You_aren%27t_gonna_need_it)
believer; so far I've been sticking with the simplest thing that could
possibly work. I have a suspicion that the files you would end up
working on in-game would never get big enough to justify getting
fancy, but you never know; users have a way of surprising you.

If I were writing an editor for the point of having an editor I might
feel otherwise, but I'm still at the point in the game where I'm eager
to have a richer world to explore, so I haven't spent a lot of time on
little polish things yet.


**A: What other technical feats have you encountered while working on this game?**

**P:** I've been really impressed with [LOVE](https://love2d.org/), the game engine I'm
using. It's extremely approachable without being limiting in terms of
power. The accessibility reminds me of QBasic and some of the early
programming environments of the 80s where many hackers got their
start. It is of course much more technically sophisticated, and the
language is dramatically better designed, but it doesn't sacrifice
that initial immediacy that is so key to engagement of younger users.

Another neat feat is Lua's sandboxing system. It's amazing how much
mileage I get out of a single `setfenv` function call when it works with
Lua's semantic simplicity and remarkable degree of orthogonality.

I've been able to basically steal outright the way Emacs represents
major modes and key maps. It's a really solid design, though of course
it could benefit from Vim's notion of general composable actions that
are decoupled from the object (char, word, expression, etc) upon which
they act; I feel like I don't have a good enough grasp of that yet to
implement it. Perhaps an enterprising player will come along and write
a Vim implementation in-game.

**A: Where have you looked to for inspiration on things like game mechanics?**

**P:** A big influence for this game was playing through [Escape Velocity](https://en.wikipedia.org/wiki/Escape_Velocity_%28video_game%29)
as a kid. It rewarded exploration and was set against a fairly rich
universe. I hadn't really encountered an open-world type game before
that, though they are more common these days.


I really enjoy playing [FTL](http://ftlgame.com/) (Faster Than Light)
as well; in particular the way it integrates your ship's power
distribution as a central game mechanic is really well done. I'm not
sure if a similar mechanism will end up making it into Bussard, but I
would like it to.

But the initial impetus for the game was seeing videos of
[Kerbal Space Program](https://en.wikipedia.org/wiki/Kerbal_Space_Program)
and realizing my x86 computer is too old to play it. (Yes, really;
it's old. I have a newer machine but it's ARM-based.) I wanted to
explore the mechanics of orbital spaceflight, and while my model is a
lot less detailed than theirs, it's much more realistic than any other
game I've played. It's also been a good excuse to brush off my math
and do a bit of wikipedia research.

**A: You typically utilize an interesting pattern for naming projects--usually the names are found in semi-obscure books. Can you talk about the origin of the name 'Bussard'?**

**P:** Normally I like to take my names from characters in fiction but
this is slightly different--a
[Bussard Ramjet](https://en.wikipedia.org/wiki/Bussard_ramjet) is a
hypothetical system of propulsion that could operate based on
collecting hydrogen from the interstellar medium.

This is fitting since another key mechanic is fuel consumption. You
can't crash your ship, but you can temporarily strand yourself in the
outer reaches of the system if you're not careful to make sure you have
enough fuel to counteract the velocity you've built up. Your fuel does
recharge slowly, (presumably with a bussard collector) so the game is
forgiving in this aspect.

However, I first heard of the term from Star Trek--the
[Bussard Collector](http://en.memory-alpha.wikia.com/wiki/Bussard_collector)
there is the iconic red component on the tip of the warp nacelle.

**Thanks, Phil!**

# Upcoming things!

* [FSF30 in Boston](https://www.fsf.org/fsf30) --- Join in the festivities as the FSF celebrates 30 years of digital freedom!
* [Hack && Tell: Round 35 in NYC](http://www.meetup.com/hack-and-tell/events/225589654/) --- But you'll never get a spot. Maybe next time?
* [Ricon in SF](http://ricon.io/) --- Ricon is a distributed systems conference put on by the folks at Basho. I really enjoyed last years event and am very much looking forward to descending upon SF for this years.

Well, that's it for Volume 3. If you'd like to see something included in Volume 4 (due out next week), or just want to say hello, feel free to reply to this email!

Happy hacking,

Andrew


