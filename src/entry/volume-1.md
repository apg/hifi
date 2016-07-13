% Volume 1: Just the Hacks, ma'am
%
% 2015-09-18

# Volume 1: Just the Hacks, ma'am.

Welcome to hifi! hifi, or "hacks I find interesting", is a mailing list
curated by one, Andrew Gwozdziewycz, inspired by the venerable ["wrap up"](https://gist.github.com/apg/8499daa3daac44f80081)
emails we did after nearly all Hack and Tell events. I'm so glad you could join me!

(Note: I'd *greatly* appreciate any and all feedback on this!)

Without further ado...

# Hacks (in no particular order)

## Video Digest --- Anastasis Germanidis

Video Digest uses an automatic summarization algorithm against the video's subtitles files to give you, a lazy video watcher, a condensed version of the video. Check out the examples, including a 3 minute version of [The Empire Strikes Back](https://www.youtube.com/watch?v=IFbB3zXBnv4&index=4&list=PLdMqYckobjk4RMRMw7jR2xDfisWUvLSg1)!

* [Github](https://github.com/agermanidis/videodigest)
* [Examples](https://www.youtube.com/watch?v=IFbB3zXBnv4&list=PLdMqYckobjk4RMRMw7jR2xDfisWUvLSg1)
* [Automatic Summarization on WikiPedia](https://en.wikipedia.org/wiki/Automatic_summarization)

## TMUX Resurrect --- Bruno Sutic

I'm not a fan of TMUX (screen has served me well for over 10 years now), but I like the idea of this project. Resurrect will restore your tmux environment after a system restart. While it'd be impossible to restore the exact *state* of the running programs, it promises to restore everything else (window layout, working directories), and even can be configured to restore vim / neovim sessions!

* [Github](https://github.com/tmux-plugins/tmux-resurrect)

## makelisp --- Shinichiro Hamaji

It's a lisp implementation using nothing but GNU make. How could I not include this?

* [Github](https://github.com/shinh/makelisp)

## Alex --- Titus Wormer

Alex is essentially a linter, for text, that helps you find gender favouring, polarising, race related, religion inconsiderate, or other unequal phrasing. Basically, it helps be a considerate writer. *(I'll try to remember to use this on hifi -- ed)*

* [Website](http://alexjs.com/)
* [Github](https://github.com/wooorm/alex)

## Passbox --- Rob Bollons

Why would I include yet another, "dime a dozen", GPG enabled, flat file, password storage mechanism in here? Because it's no frills, requiring only bash, grep, and gpg, and appears to be well written. That's why.

* [Github](https://github.com/RobBollons/passbox)

## Par --- Jonathan Roes

Simply put, par executes a templated command for each line read from stdin. You just have to see the examples to understand it. Sorry.

*(disclaimer: I work with Jonathan, but I stumbled upon this via other means! -- ed)*

* [Github](https://github.com/jroes/par)
* [Examples](https://github.com/jroes/par#examples)

## Muxy --- Matt Fellows

Muxy serves as a proxy that mucks *[cute!--ed]* with your system and application, allowing you to simulate common failures at layer 4 and 7 of the [OSI model](https://en.wikipedia.org/wiki/OSI_model). It sounds like this thing has moxie.

* [Github](https://github.com/mefellows/muxy)

# Other Interesting Things of Note

* [Let's Encrypt's first cert is now live](https://letsencrypt.org/2015/09/14/our-first-cert.html). I'm very pleased to hear that Let's Encrypt is actually working, and extremely happy that I won't have to shell out a bunch of money, to some some faceless C-corp, for a pair of numbers.

* Adam Sah's Masters Thesis, [TC: An Efficient Implementation of the TCL Language](http://www.eecs.berkeley.edu/Pubs/TechRpts/1994/CSD-94-812.pdf), from 1994 isn't surprising if you're into the implementation of programming languages, but it did remind me of a question I used to ask as to why Tcl popularity seems to have declined.

Happy hacking,

Andrew


