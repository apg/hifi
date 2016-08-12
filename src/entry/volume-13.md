% Volume 13: Eagerly Evaluated Questions, with Joseph Jevnik
%
% 2016-08-12

# Volume 13: Eagerly Evaluated Questions, with Joseph Jevnik

Greetings, friends! Last week our engagement took a bit of a nose dive, with opens and clicks dropping a bunch. This is surprising since metrics for *hifi* have always been well above industry average, and pretty damn good, if I do say so. For transparency's sake, the average open rate over 12 volumes has been 58%, with an average click through rate of 30%. The minimum (last week) CTR is 22.26%, and maximum (38.92%). In terms of opens, last week was the low at 45.26%, with a whopping 67.33% topping us off. And as of this writing there are 275 subscribers! 

So what was it about last week? Please let me know! Hit the reply thingy in whatever mail client you're using these days!

Now. On to the real business. This week I've devoted the list of hacks to the famed $20,000 Pyramid category "Things that relate to compilation." The reason for this is that it sort of fits a theme with the *AMMMMAAAAZING featured interview* we have in store. A while back, friend of hifi (and Hack && Tell) [Thomas Ballinger](http://ballingt.com/) replied to my request for feedback and suggested I interview [Joseph Jevnik](https://github.com/llllllllll), who has a little project to make Python lazily evaluated. Joseph was super excited to chat me up about it, and not only did I learn a lot about implementing lazy evaluation, it reinvigorated me to think about passion projects again!

The interview is *long*, so rather than print it in full here, we'll link it later with an excerpt. I *promise*, you don't want to miss it! And, be sure to share it! 

# The hack (short-)list.

## plasma -- joelpx

The project formally known as reverse, is an interactive disassembler for x86/ARM/MIPS. Generates indented pseudo-code with colored syntax code.

* [GitHub](https://github.com/joelpx/plasma)

## fython -- Nicolas Essis-Breton

Fortran, with a Python like syntax.

* [GitHub](https://github.com/nicolasessisbreton/fython)

## bone-lisp -- Wolfgang Jaehrling

bone-lisp looks like a regular Lisp-1 (a la Scheme), but has some interesting implementation features such as its use of [regions](https://en.wikipedia.org/wiki/Region-based_memory_management) instead of garbage collection.

* [GitHub](https://github.com/wolfgangj/bone-lisp)

## TrumpScript -- Sam Shadwell

Makes Python Great Again.

* [GitHub](https://github.com/samshadwell/TrumpScript)

# Other articles you *could* read, but you should probably wait until after you've read the interview!

* [A 6502 lisp compiler, sprite animation and the NES/Famicom](http://www.pawfal.org/dave/blog/2016/05/a-6502-lisp-compiler-sprite-animation-and-the-nesfamicom/)
* [ Writing the Cyclone Scheme Compiler](http://justinethier.github.io/cyclone/docs/Writing-the-Cyclone-Scheme-Compiler)

# Without further ado...

Like I said in my long and winded introduction, I'm printing just an excerpt from the interview in the email due to it's length. If you'd like to just simply skip ahead and read it all, please do.

*[Full Interview Text](http://hifibyapg.com/interviews/joseph-jevnik.html)*

**Andrew: So first, I have to get it out of the way. Your GitHub username is
 `llllllllll`. Can you tell us the story behind that?**

**Joseph:** When I made my GitHub account I was playing a *lot* of StarCraft
II. In that game, userames are not unique, so many players decided to
name themselves with a "barcode" to be anonymous. This would make it
harder for people to know what strategies you were practicing or
stream snipe you. I chose to use this name on GitHub because I thought
it was fun. I have found it to be quite polarizing; some people think
it is funny and some people think it is really annoying. I have been
asked to change it a couple of times but I think it is too much fun. I
also like that the name that meant "anonymous" seems to draw a lot of
attention.

**A: My guess is that a number of readers haven't been exposed to lazy
 evaluation. What is lazy evaluation, and why does adding it to
 Python make sense?**

**J:** Lazy evaluation, also known as "call by need", is an evaluation
strategy where values are produced when only needed. This is the
opposite of eager evaluation, what Python normally does, where
functions are executed as seen and values are produced
immediately. Python has some built in tools for lazily evaluating
code. One of the more explicit ways is with a generator. Generators
only produce values as requested as opposed to a list or tuple which
eagerly evaluates all of the members. Another way people get lazy
evaluation in Python is with closures. ... 

[Click here to read the full, unshortened interview](http://hifibyapg.com/interviews/joseph-jevnik.html)! Go! You won't regret it.

# See you later space cowboy...

Until next time!

Happy hacking,

Andrew
