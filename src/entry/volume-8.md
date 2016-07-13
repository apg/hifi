% Volume 8: Subatomic Bytes
%
% 2015-12-11

# Volume 8: Subatomic Bytes

There are at least 2 (known) subatomic bytes. The bit, and the
nibble. For those unfamiliar with bytum theory, the bit is a single,
well, bit. The nibble is a half-octet, or 4 bits. It's interesting to
consider what information one can actually store in a nibble.

There are a decent number of enumerations that have less than 16
values. Of which, the types common to a programming language. As a
result, an implementor might get away with storing the tag for boxed
objects in a single nibble, with at least 4 bits more for GC flags or
something else.

More interestingly, at least to me, is that in 4 nibbles, one can
store a single character for a 3x5 pixel font, with a bit left over to
encode, say, reverse video information. In a 3x5 pixel font, `hifi`
might look like:

    #    #    #  #
    ##       #
    # #  #  ###  #
    # #  #   #   #
    # #  #   #   #

(apologies for the crude ASCII art). In 4 nibbles, or just 2 bytes, a
lowercase `h` is simply 0x9ada, `i` is 0x2092, and `f` is 0x15d2.  We
haven't saved any space in terms of a regular transmission; in fact
we've *doubled* the cost of sending text on the wire. Instead of
just *representing* the value, we've given all the information
necessary to *render* it for the reader.

I wonder what kind of interesting applications can be created from
such things. What if we took long strings of text, and rendered them
as the starting state for a cellular automaton? After N iterations,
might we get back new 3x5 encoded characters that we could unencode
and use as the basis for passphrases, or cryptographic keys?

Are there other, creative ways in which to explore this? If you've
thought about it, or know someone who has, please let me know! I
can't help but think it's worth more thought.

# Hackity Hacks (in pseudo random order)

*Editor's Note:* I'm deep in the backlog of hacks this week. I've been
doing a poor job of finding new and interesting things, due to
holidays, being under the weather, yak shaving, and of course telling
people they are wrong on the Internet. Expect less hacks, and more
links to interesting articles and discussions this week.

## MagSpoof --- Samy Kamkar

Imagine being able to spoof the mag stripe on all of your credit cards
to make your own [Coin](https://onlycoin.com/). Well, the original
MySpace, w0rm creator, has something that might be of interest. Lots
of information about mag stripes work, and schematics and firmware for
building your own contact free device.

* [Github](https://github.com/samyk/magspoof)

## Yi --- Many

Yi is a hackable, scriptable editor written in Haskell, with a purely
functional core, supporting both virtual terminals, and GTK based
graphical UIs.

* [Github](https://github.com/yi-editor/yi)
* [Homepage](https://yi-editor.github.io/)

## Planck --- Mike Fikes

An alternative, bootstrapped, REPL for ClojureScript on OS X. 

* [Github](https://github.com/mfikes/planck)
* [Homepage](http://planck.fikesfarm.com/)

## adsuck --- Conformal Systems

adsuck is a DNS server which blacklists known ad addresses, and
forwards the rest. Alternative and/or compliment to some of the
features of [privoxy](http://www.privoxy.org/)

* [Homepage](https://opensource.conformal.com/wiki/adsuck)

## IRCAnywhere --- IRCAnywhere Developers

IRCAnywhere is a multi-user IRC bouncer and web based client, meant
for teams. You and your team can use this instead of giving into
proprietary services such as Slack or HipChat, without giving up all
of the graphical nonsense you've grown to love (or at least
eventually).

* [Github](https://github.com/ircanywhere/ircanywhere)

## mdp --- Michael Gohler

A curses based, command line, presentation tool backed by markdown
files.

* [Github](https://github.com/visit1985/mdp)

## vnStat --- Teemu Toivola

Network monitoring for Linux and BSD that doesn't require capturing
packets. Stats are persisted across reboots.

* [Homepage](http://humdi.net/vnstat/)

## kickstart --- Bruno Lara Tavares

Some time ago, I asked for feedback on hifi (I'm happy to receive
more, both positive and negative!), and Bruno wrote me. He mentioned
his project kickstart, which is a provisioning tool, in the vain of
Chef or Puppet, requiring no special clients--just bash and ssh.

*[This is the first hack submission I've received and published--ed]*

* [Github](https://github.com/bltavares/kickstart)

# Discussion!

I alluded, wayyy back thousands of words ago, that I'd include some
articles and posts that I've found interesting in the past couple of weeks. Here they are.

* [It's 2015. Why do we still write insecure software?](http://www.jerf.org/iri/post/2942) --- Great thesis, interesting article, lots to think about, even if you don't agree with the presented solutions.
* [What can a technologist do about climate change? A personal view.](http://worrydream.com/ClimateChange/) --- I'll admit to not having made it all the way through this, but the first half was pretty interesting to me, so I'm including it here in hopes that *you* will read it all, and then give me the TL;DR.
* [Why Percentiles Don't Work the Way You Think](https://www.vividcortex.com/blog/why-percentiles-dont-work-the-way-you-think) --- Admittedly bad title, but the content is good.
* "[Pull up a chair, lemme tell you a story](https://marc.info/?l=openbsd-misc&m=144963518227229&w=2)" --- OpenBSD-misc, seems to generally think that all the HTTPS everywhere is overrated. The major take away is of course that UX of these things is horrible, and it doesn't always provide the benefits you *think* it does.

# Signed. Sealed.

That's it for Volume 8. If you've got complaints, I've got an
INBOX. If you have suggestions, I've got an INBOX. If you have
something to show me... I have an INBOX.  Just reply to this email and
you'll be on your way to communicating with me.

OH! And, I'm in search of introductions to people doing ambitious and
interesting projects, in their spare time. I want to chat with them, and
expose them for all they are! (most likely wonderful people!)

And, if I don't write again before the new year... Happy Holidays if
that applies to you, and Happy days to all!

May the December the 18th be with you.

Happy hacking,

Andrew
