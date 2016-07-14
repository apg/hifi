% Volume 10: You Must be Out of Blinker Fluid
%
% 2016-07-15

# Volume 10: You Must be Out of Blinker Fluid

In the 90s, some web browsers implemented a non-standard HTML tag,
BLINK, that toggled its child elements on a timer--not unlike a
blinker on a car.

Unlike a car's blinker, the BLINK tag was *not* a safety device. One
might argue that a local news website could *save you* by drawing your
attention to pertinent safety information by blinking it, but let's be
real for a moment.

A blinker (or turn signal) on a car is a signaling mechanism that
informs other drivers and pedestrians of an *intent* to make a turn
(or not). This signaling, assuming the intent is upheld, benefits
others by potentially reducing wait time, and drastically increasing
safety, *i.e.*, if I know the driver is turning right, I can continue
going straight without a collision.

If everyone used their blinkers for every turn, I wonder what the
impact would be on accidents and traffic? One can imagine that
accidents at intersections would decrease. Throughput would
*increase*, since drivers could continue quicker, resulting in less
intersection crossing latency, and less backlog.

What's the point of all this? I mostly wanted to get something off my
chest--drivers in southern California suck at signaling. But, when I
started thinking about it a bit more, there are obvious parallels to
distributed systems.

# Hackity Hacks (in pseudo random order)

## Wireworld -- Dan Prince

Wireworld is an implementation of, well,
[Wireworld](https://en.wikipedia.org/wiki/Wireworld), a Turing
complete, cellular automaton that can be used to implement a logic
simulator. This one is online, and written in ClojureScript!

* [Github](https://github.com/danprince/wireworld)
* [Demo](https://danprince.github.io/wireworld/)


## gimli -- Fredrik Wallgren

Utility for converting markup files to pdf files *[like it says on the tin. -- Ed]*.

* [Github](https://github.com/walle/gimli)


## keynav -- Jordan Sissel

keynav allows you to use the keyboad instead of your mouse to navigate
around the screen. Works in Xorg on various platforms.

* [Link](http://www.semicomplete.com/projects/keynav)


## pep -- Charles L

A Vim-like clone.

* [Github](https://github.com/charles-l/pep)


## goed -- Thibaut Colar

goed is a terminal based code editor / developer environment written
in the Go programming language that is heavily inspired by the
[acme](http://acme.cat-v.org/) editor.

* [Github](https://github.com/tcolar/goed)


## kilo -- Salvatore Sanfilippo

 A text editor in less than 1000 LOC with syntax highlight and search. Links only against libc, no ncurses, or other things.

* [Github](https://github.com/antirez/kilo)
* [Blog Post](http://antirez.com/news/108)


## pinboard-notes-backup -- Benjamin Esham

Efficiently back up the notes you've saved to
Pinboard. *[backup your data, folks -- Ed]*

* [Github](https://github.com/bdesham/pinboard-notes-backup)


## Paper.js -- Jurg Lehni and Jonathan Puckey

An vector graphics scripting framework for HTML5 Canvas.

* [Site](http://paperjs.org)
* [Github](https://github.com/paperjs/paper.js)


## kyuubey -- Nicole Izumi

A functional emulation of QBasic! *[because, why not? -- Ed]*

* [Github](https://github.com/kivikakk/kyuubey)


## lecat -- JT Olds

lecat is like [socat](http://linux.die.net/man/1/socat) (a simplified
version), but can do the [Let's Encrypt](https://letsencrypt.org/)
setup process to securely listen on a port you might be proxying.

* [Github](https://github.com/jtolds/lecat)


## sshuttle -- apenwarr

A poor man's VPN over ssh, which doesn't require root, and can even do
DNS tunnelling.

* [Github](https://github.com/apenwarr/sshuttle)


## viewdocs -- Jeff Lindsay

A Markdown based project documentation system.

* [Github](https://github.com/progrium/viewdocs)
* [Site](http://viewdocs.io/)


## Easy Forth -- Nick Morgan

Learn Forth! *[so you can go onto Fifth and Sixth! -- Ed]*

* [Github](https://github.com/skilldrick/easyforth)
* [Read](https://skilldrick.github.io/easyforth/)


## Marp -- Yuki Hattori

A Markdown presentation editor, using
[Electron](http://electron.atom.io/).

* [Github](https://github.com/yhatt/marp/)
* [Site](https://yhatt.github.io/marp/)


# Fun Reads

* [Ocaml vs C++ Raytracer comparison](http://www.ffconsultancy.com/languages/ray_tracer/comparison.html)

* [A Modern Architecture for FP](http://degoes.net/articles/modern-fp)



# Stay Informed

* [In first, U.S. judge throws out cell phone 'stingray' evidence](http://mobile.reuters.com/article/idUSKCN0ZS2VI)
  -- Super important outcome as
  [cell site simulators](https://www.eff.org/sls/tech/cell-site-simulators)
  are tools of the surveillance state.

* A ridiculous
  [ruling](https://www.eff.org/deeplinks/2016/07/ever-use-someone-elses-password-go-jail-says-ninth-circuit)
  by the Ninth Circuit, finds that using someone else's password could
  put you in jail under the even more ridiculous
  [Computer Fraud and Abuse Act](https://www.law.cornell.edu/uscode/text/18/1030).

# In closing...

I can't say when the next hifi will show up, and I have no real excuse
as to where it's been for the past 6 months. Really, I'm just elated
that I pushed myself to produce this volume. I hope it lives up to
your expectations!

In the interest of keeping it going, I love to hear about interesting
hacks, projects, pieces of art, white papers, new conferences. Just
reply to this email, and I'll be sure to check it out. If you have
nothing to share, but want to say hello--don't hesitate! It is fun
to hear from readers.

Happy hacking,

Andrew
