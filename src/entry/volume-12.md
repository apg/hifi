% Volume 12: Published via lofi since 2015
%
% 2016-08-04

# Volume 12: Published via lofi since 2015

The idea for hifi came about last September, and I ran with it without
thinking too much about how I'd organize everything to publish
volumes. I figured I'd simply pull links out of Trello or something and
just do it. That adhoc style worked well for 9 volumes.

A couple of weeks ago, when I decided that I would finally do
[Volume 10](http://hifibyapg.com/volume-10.html), I realized that I
could probably hack together something using the (awful) Trello API,
and force myself to discover the details of the project at link save
time, instead of the all too time consuming strategy of "the night
before the volume should go out."

Each hifi volume is simply a list on the "hifi" board in my Trello
account. Because most of the projects I capture actually happen from
my phone, the actual GitHub links end up as attachments on Cards, and
the title of the page gets tossed into the Card's title. I manually
edit that down to the *project-name* -- *author-name* template, and
add markdown formatted text to the Card's description.

From there, the aptly named [lofi](https://github.com/apg/lofi) simply
pulls the cards from the list I specify and dumps it into the golang
template I use for each volume.

The [website](http://hifibyapg.com) is rendered using
[more-modest](https://github.com/apg/hifi/blob/master/Makefile), which
is quite simply a GNU make specific Makefile, which calls upon the
powers of [discount](https://github.com/Orc/discount)'s theme binary.

I copy and paste the rendered body into the predefined Mailchimp
template I created for Volume 1, schedule it, and "boom goes the
dynamite".

It goes without saying that I could make more optimizations to this
workflow if I took the time to do so, and maybe I eventually will.

# On to the hacks!

## Kepler -- Pablo Torres, Robert Lord

A solar system simulator written in JavaScript, for the web. *[This is now broken for me; YMMV -- ed]*

* [Kepler Demo](http://ptn.github.io/kepler/)

## Macmoji -- Ryan McLeod

* [GitHub](https://github.com/warpling/Macmoji)

## vm86 -- ruki

A basic 32-bit x86 virtual machine.

* [GitHub](https://github.com/waruqi/vm86)

## smu -- Enno Boland

smu is a small (e.g. ~650 lines of C) and simple implementation of a markdown like language. It's one-pass, so it doesn't support reference style links, but most other features are supported, in addition to a few others.

* [GitHub](https://github.com/Gottox/smu)

## Kgif -- Kirill

Creates a animated gif from interactions in the active window, using scrot and imagemagick.

* [GitHub](https://github.com/luminousmen/Kgif)

## python-prompt-toolkit -- Jonathan Slenders

A library for building powerful interactive command lines in Python.

* [GitHub](https://github.com/jonathanslenders/python-prompt-toolkit)

## ln -- Michael Fogleman

ln is a 3d line art renderer written in Go.

* [GitHub](https://github.com/fogleman/ln)

## selfie_formatter -- Skye Shaw

The RSpec Selfie Formatter: A Formatter that takes photos of you while your tests run and uses them to track progress and format the results.

* [GitHub](https://github.com/sshaw/selfie_formatter)

# Curiosities

* [Polyvariadic Functions and Printf](http://chris-taylor.github.io/blog/2013/03/01/how-haskell-printf-works/)

Or.. *How Haskell's Printf works*.

A coworker stated: "My favorite experiment for a type system is 'how would you do printf?'" I'm not a Haskell expert, but I immediately came up with an idea. I then looked at the types to see that I was on the *right* track, but not quite keeping up with the pack, so to speak. I searched for an explanation, and this post cleared it all up. It's pretty clever!

One has to wonder, though, why the requirement for polyvariadic functions existed, and why `[PrintfArg]` wasn't good enough, but the API is obviously nicer without the list, so...

* [A simple synchronization algorithm](https://unterwaditzer.net/2016/sync-algorithm.html)

Reader, and friend of hifi, [Justin Abrahms](https://justin.abrah.ms/) recently asked about an offlineimap like tool for calendars. Little did I know that sitting in the inbox of hifi links was an article that pointed at a [potential solution](https://github.com/pimutils/vdirsyncer)!

# That's a wrap!

I'm always on the lookout for interesting hacks, projects, pieces of
art, neat papers, etc. If you have something I should see, don't
hesitate to reply to this email!

Until next time!

Happy hacking,

Andrew
