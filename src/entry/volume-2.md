% Volume 2: The Hacks in Vegas, Stay in Vegas
%
% 2015-09-25

# Volume 2: The Hacks in Vegas, Stay in Vegas

For those of you who may have missed Volume 1, welcome! And for those
of you who have been with it from the beginning, thanks for coming back!

Positive response last week, has left me but no choice but to put out
hifi Volume 2--here goes!

# Hacks (in no particular order)

## Totally Simple Web Server --- Dave Fletcher

A pretty simple web server that uses Bash and socat to do its thing. This
doesn't sound very exciting, but the code is both well documented, and
well written shell.

* [tsws on Github](https://github.com/dfletcher/tsws)
* [Socat](http://www.dest-unreach.org/socat/)

## Serve2d ---  Kenny Levinsen

Let's say you happen to have a static IP address, and you want to open
but a single port to the outside world. Is there a way in which you
could serve multiple protocol types? Over ssh, you say? Sure! But, what
about just *detecting* the the protocol is and forwarding the traffic
to the right place on the internal network? That's what serve2d aims to
do.

* [serve2d on Github](https://github.com/joushou/serve2d)

## ghfs --- Jason Hall

Github filesystem is simple an experimental [FUSE](https://en.wikipedia.org/wiki/Filesystem_in_Userspace) filesystem for Github
repositories.

* [ghfs on Github](https://github.com/ImJasonH/ghfs)
* [FUSE](https://en.wikipedia.org/wiki/Filesystem_in_Userspace)

## catimg --- Eduardo San Martin Morote

Does exactly what it says on the tin. It "cats" an image. To your terminal.
In 256 colors. But, without dependencies.

* [catimg on Github](https://github.com/posva/catimg)

## stb --- Sean Barrett

catimg is really quite interesting, but the no dependencies thing threw
me for a loop. stb is a collection of public domain libraries for doing
things like decoding images, fonts, audio (vorbis) and more! Each library
is a single C header file!

* [stb on Github](https://github.com/nothings/stb)

## PolyPasswordHasher --- Justin Cappos, Santiago Torres

PolyPasswordHasher is a new passsword hashing scheme which uses a
Shamir Secret Share, and are, apparently, extremely hard to crack. I
can't speak for the security here, but a paper exists that makes an
argument which you can read and audit for yourself *[probably best to not just adopt this without more peer review--ed]*.

* [the Paper](https://github.com/PolyPasswordHasher/PolyPasswordHasher/blob/master/academic-writeup/paper.pdf)
* [PolyPasswordHasher on Github](https://github.com/PolyPasswordHasher/PolyPasswordHasher)

## Pseudo3DTouch --- Adam Bell

Mimicking Apple's 3D touch on hardware that doesn't have it.

* [Pseudo3DTouch on Github](https://github.com/b3ll/Pseudo3DTouch)

# Other things to learn from, or be fascinated by

* [Building an Enterprise CSS Framework](https://medium.com/salesforce-ux/building-an-enterprise-framework-is-hard-1e8d8b33e082), discusses the development of an "enterprise" CSS framework, and a very insightful read. *[Disclaimer: I work for Salesforce, well, Heroku--ed]*
* [Megapole by RSI](https://www.youtube.com/watch?v=Z8Av7Sc7yGY) is a 256 *byte* 3D raycasting demo. It's more or less *insane*. Oh, and it runs on DOS. More information can be found [here](http://www.pouet.net/prod.php?which=66372).
* [There is No Now](https://queue.acm.org/detail.cfm?id=2745385) discusses the problem of "simultaneity" in a distributed system.
* [The Handmade Manifesto](http://static.chronal.net/hmh/manifesto.html). An interesting perspective on modern software.

Well, that's it for Volume 2. If you'd like to see something included in Volume 3, or just want to say hello, feel free to reply to this email.

Happy hacking,

Andrew


