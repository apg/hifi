% Andrew Kelley on GenesisDAW [Volume 6]
%
% 2015-10-30

**Andrew G: What is [Genesis](https://genesisdaw.org)?**

**Andrew K:** One of my interests is in producing music. On my
[soundcloud page](https://soundcloud.com/superjoe30) you can hear a
small sample of some of the stuff I've made (warning: it's very
amateur).

As a music producer, it's hard to find the line between creativity
and blindly reusing other people's work. If you use presets from a
synthesizer, you're using someone else's synth programming. If you
use someone else's synth, you're using someone else's Digital Signal
Processing code. You can purchase melodies and chord progressions
from a MIDI store. You can use sample packs for musical instruments
that somebody else recorded. You can use pre-made drum loops.

At each step along the way, it becomes less clear what your role is
in the creation process.

I have decided to solve the problem by adding restrictions to the
creative process. These restrictions include:

* Use only samples that I personally have recorded with a microphone.
* Use only synthesizers that I personally have coded the DSP and
  programmed the presets.
* Use only DAW software that I personally have coded, including recording
  software for recording samples.
* Use only melodies and chord progressions that I personally have created.

I first started looking into what it would take to build a DAW in the
browser, because I thought that would make it easy for people to try it out
without having to install anything, and it would make it easy to
collaborate with other people. I also wanted to have a built-in community
of people who would share their work with each other, in the same way that
open source community shares code with each other. That project was called
Nemesis, in the spirit of sticking it to The Man, because the project would
be the nemesis of the big labels and companies trying to squeeze money out
of artists, while this software and community would be a place to create
art without optimizing for profit.

In my research I realized that the browser is pitifully inadequate in terms
of taking advantage of the power of the hardware of a computer, and that a
DAW is an application that absolutely must squeeze every last drop of
performance out of the hardware it runs on. So I started over, writing a
native application. However, instead of pushing a commit in which I delete
all the code and start over like I normally do, for some reason I started a
new project named Genesis, and created a new repository. Not to worry
though, because after that I ended up deleting all the source code and
starting over 3 separate times. Also not to worry, because Genesis is still
all about the open source music community.

**AG: And, what the hell is a DAW, anyway?**

**AK:** Well, it stands for Digital Audio Workstation, which I guess
could mean any software application that processes or produces
audio. That would include applications like Audacity which only
process audio, as well as sequencers such as Ableton or FL Studio,
which allow you to compose music with virtual instruments.

Genesis aims to do it all.

**AG: Personally, I know very little about audio programming. I once
  stayed up into the wee hours working on a simple random wav file
  generator, but that's about it. What resources would you recommend
  for someone who is interesting in audio programming, but has no clue
  where to begin?**

**AK:** There are lots of different things you can do.

* Take a Coursera class on Digital Signal Processing. The introduction
  will be a great place to start. Another class I'm currently taking
  is Audio Signal Processing for Music Applications. The math gets
  difficult but it's all good stuff.
* Are you interested in building a synthesizer? Fork an existing LV2
  synth, delete the guts, and write your own code. You can use an
  existing DAW that supports the LV2 standard to test your code.
* Join the Linux Audio Developers community. It's a small community, but
  the mailing list, #lad IRC channel on Freenode, and the subreddit
  are all active.
* Figure out what topics you are interested in. Here are some: music
  players, sequencers, synthesizers, encoding/decoding, effects,
  visualizations.
* Try making some music in a DAW. Sadly the open source ones are not
  really as powerful or stable as the proprietary ones (which is one
  reason I started Genesis). But, if you want to mess around for free,
  try LMMS.

**AG: You're using OpenGL for the UI, which doesn't seem like an obvious
choice. What makes OpenGL the right choice for something like Genesis?**

**AK:** Take a look at a screenshot of some of the popular
DAWs. You'll notice that most of the screen is special drawn stuff and
most of the widgets are non-standard OS widgets.
 
Widget toolkits come with a lot of baggage. Consider Qt or GTK. These
are huge, complicated libraries, and as such, they come with bugs, and
they come with opinions about how user interfaces should work. Genesis
has its own opinions about how user interfaces should work, and I want
all the bugs to be in my own code so that I can fix them.

The main feature of a DAW is the user interface. You are interfacing
with an artist, and you want that artist's experience to be as fluid,
powerful, and natural as possible. You need ultimate power over the
user interface and you need it to be the same across platforms.

Genesis is going to have a plugin registry and a plugin API. Plugins
such as virtual instruments such as synthesizers, as well as
effects. The plugin API will support creating a user interface, so I
need tight control over what that API will be, and I need to be able
to provide guarantees about what will or will not happen in the user
interface code called into via the plugin API.


**AG: What's been the most interesting challenge so far while working on this?** 

**AK:** Figuring out how undo and redo will work when multiple users
are collaborating on a project. Consider the following scenario:

* User A creates Track 1.
* User B adds an audio clip to Track 1.
* User A presses Undo.

Should that delete Track 1? What about the audio clip User B added?
What happens if User B then presses undo? What about if User B then
presses redo?

Also, consider that this is going to be peer-to-peer, without a server
in the middle to negotiate edits. So it's possible for User A and User
B to do conflicting edits simultaneously, and the DAW has to be able
to resolve that somehow in a consistent manner so that User A and User
B see the same project.

The plan is to have numerically increasing *transaction* numbers, and
when multiple users send each other transactions with the same number,
one of the transactions is determined to be the winner by looking at
the transaction ID number (which is a 256-bit random number assigned
by the peer who sent the transaction). Then transactions are either
un-applied, re-applied, or both, and now all peers have the same
project.

**AG: The problems of peer-to-peer consensus seems like it's probably
been studied a great deal in the literature. Have you considered what
Merkle Trees might provide for you? Or even if findings from the Bayou
Architecture, which is designed for synchronizing data for mobile
applications, might apply?**

**AK:** Merkle Trees are relevant to peer-to-peer file transfer, such
as the BitTorrent protocol, but not so much in achieving stable,
intuitive, and live project collaboration.

As for the Bayou Architecture, it looks like it might be relevant, but
I'd have to pay for the article for some reason? It doesn't really
matter though. I could spend an eternity reading academic papers, or I
could continue building this thing which I already designed and
understand completely and know it will solve the problem correctly. At
heart, I'm an engineer, not a researcher :-)

**AG: How can we, as readers of hifi, help?**

**AK:** Well, I am asking for
[donations](https://salt.bountysource.com/teams/gdaw). However, I
don't really want to push it with the asking for money thing until I
actually have a stable released version. In the future, exactly once,
I plan to send an email to the people who have starred Genesis on
[Github](https://github.com/andrewrk/genesis) soliciting them for
financial support. I feel a little guilty about that, but on the other
hand, I have to eventually get funding or go back to work. If I didn't
quit my job, by now I'd have saved up $81,000. So if you're willing to
subject yourself to an unsolicited email sometime in the future when
Genesis has a major release milestone, you can star the GitHub
repository.

If any readers are designers or have designer friends, I'd love to
work with an artist to make Genesis look pretty. Right now it's very
minimally designed. I feel comfortable getting the user experience to
feel right, but it's not going to look super sexy. Having an improved
logo would be a great start.

This is very much your typical crowd funding project situation. So the
more subscribers I have to the [blog](http://genesisdaw.org/), the
more people show the project to their friends, the more media
attention the project receives, the better.

*Thanks to Andrew Kelley for chatting with me!*
