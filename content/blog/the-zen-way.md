---
layout: post
title: The zen way
subtitle: Minimal code for a minimal lifestyle
categories: [minimalism]
date: 2014-03-03
icon: pencil
header: zen_way.jpg
attribution: vinothchandar

---

Sometimes I wonder about my choices. I wonder about my look, the things I say,
the reactions I trigger on people. But since a long time I do not wonder about
one thing: my code choices and how they triggered a life choice.

There are some things that change the way you think. I tend to prefer simple
approaches to things, specially complex problems. I don't see right complex
solutions only because the problem looks complex itself.

So this is a brief story on my journey from a complex point of view **ONLY** in code
to a minimal view not only in code but also in my life.

# Allow yourself to be inspired

> Everything should be made as simple as possible, but not simpler.
>
> **Albert Einstein**

My way started some years ago after struggling with Rails and don't finding
peace with it. I was spending more time fighting with layers and layers of code
that my boss promised me will make my life easier. It was not, I was angry on
the lack of understanding I had. I was angry at me.

The code you write it's nothing more than a reflection of who you are, code it's
a part of you. That's why we need creativity, that's why we burnout because when
that reflection fades, a part of us does the same.

I was promised a world of awesomeness after I started coding with Rails. I fell
in love with Ruby when I started but some time working only with Rails... well I
derailed.

I felt empty, that code was not me. And that was poisonous for me. I do not have
a work-life and a life in another place. This is my life... work and OSS are
parts that define me so doing something annoying breaks my soul.

And then it happened. We were visited by [soveran](https://github.com/soveran)
and he introduced us his latest project: [Cuba](https://github.com/soveran/cuba)
at that point based on [Rum](https://github.com/chneukirchen/rum), maybe you
recognize the name of the author because he wrote
[Rack](https://github.com/rack/rack). The project later evolved to a standalone
lib that didn't use Rum at all.

Long story short I viewed a world beyond the cluttered Rails philosophy. And I
saw that another lifestyle was possible, that my demands of a simpler work-style
could be achievable.

I was still struggling with Rails in my work. I couldn't understand why someone
could see this as "fast development"

```ruby
class ETooMuchMagic < ApplicationController
  def index
  end
end
```

Against something like [Sinatra](http://www.sinatrarb.com/) that was the first
thing I saw as simple.
Don't get me wrong, Sinatra is really pretty... but still... there's magic
there. And I'm a person of science.

```ruby
get "/magic" do
  erb :index
end
```

That's why I started to use Cuba all the time, in every scenario just for the
love of it.

```ruby
on "magic" do
  res.write "Roll your own"
end
```

Obviously the place I worked wasn't really happy about that choice and I only
were "allowed" to use Cuba once in a client project.

And then I got the point of so much minimalism... I started seeing beyond the
code itself.

There were something else, I've started trying to understandd it... every piece of
code. The concept of [Middlewares](http://en.wikipedia.org/wiki/Middleware)
started to appear, pattern matching,
caching, HTTP codes, headers... lot of stuff that was hidden in the magic for
my "protection".

```ruby
Cuba.use Cuba::Render
Cuba.use Middleware::Of::Your::Choice

Cuba.define do
  on root do
    res.write view("home")
  end
end
```

I was forced to learn... to understand, and that's the difference. I was really
understanding every part of the app. When things go wrong I could easily
identify it and fix it... I was extremelly happy knowing that the app was truly
a part of me.

# Build your own tools

> Simplicity is the final achievement. After one has played a vast quantity of
> notes and more notes, it is simplicity that emerges as the crowning reward of
> art.
>
> **Frederic Chopin**

When you start to understand how things work you fall in love of simplicity. Not
as a hacky way on doing stuff but as a form of art.

The first gem I wrote was [Ohm find_by](https://github.com/elcuervo/ohm-find_by)
just because I wanted to have some of the stuff made Rails easy while using
[Ohm](https://github.com/soveran/ohm).

And then it happened. I needed something. But every thing I found had a lot of
code impossible to read or understand. I needed a testing framework for the
browser... just a simple `assert`. But I couldn't find nothing.
That's how [Gerbil](https://github.com/elcuervo/gerbil) was born

```javascript
scenario("This is my scenario", {
  "setup":  function()  { /* When scenario starts */ },
  "before": function()  { /* Before every test */ },
  "after":  function()  { /* After every test */ },
  "cleanup": function() { /* When the scenario ends */ },

  "MagicThing should have a length": function(g) {
    this.someThing.add(1);
    g.assertEqual(this.someThing.length, 1);
  },

  "MagicThing should be valid": function(g) {
    g.assert(this.someThing.valid);
  }
});
```

And it worked... it is crappy code but it worked. Simple, straightforward and
readable since it's only one file.

That was all that I needed to test [Lodis](https://github.com/elcuervo/lodis)
another project just for fun.

And then the snowball effect... I couldn't stop. Open source became part of me.
A really important part. The things I learned from all the incredible people out
there is just amazing.

The same inspiration "forced" me to try to share my thoughts. My ideas.
And with minimalism in mind I gave this talk:

<iframe src="//player.vimeo.com/video/44025029" width="500" height="283" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

# You won't be alone

> Perfection is achieved, not when there is nothing more to add, but when there
> is nothing left to take away.
>
> **Antoine de Saint-Exupe**

I was surprised with this new world, minimal code and joyful solutions. But what
really surprised me was the world I joined.

A lot of brilliant people are out there ready to show you their ways. You can be
blown away with people like [cyx](https://github.com/cyx) and his amazing
[dep](https://github.com/cyx/dep), or [inkel](https://github.com/inkel) and his
plain simple daemon lib [Fallen](https://github.com/inkel/fallen), or laugh
with the brilliance of [gst](https://github.com/tonchis/gst) from the huggable
[tonchis](https://github.com/tonchis), or choose
[gn](https://github.com/lucasefe/gn) the simple generator from
[lucasefe](https://github.com/lucasefe) or even see your closest friend release
outstanding projects like [pote](https://github.com/pote) Go dependency manager
[gpm](https://github.com/pote/gpm).

But nothing prepares you to meet great people in person. You could read every
piece of code, understand every method but you can find a special light when you
hug them, share a beer, a gist, an informal talk.

You are not alone, there's another way to see the world. A way that probably
it's not going to give the top notch job of your Rails shop... but it's going to
give you an amount of knowledge that can help you overcome every rock in the
way.

# Apply it to your life

> Have nothing in your houses that you do not know to be useful, or believe to
> be beautiful.
>
> **William Morris**

Sometimes in life you had to make choices. Choices that go in the opposite
direction that your brain tells you.

One year ago I had a ticket for [Eurucamp](http://eurucamp.org), a ticket that
was around 70EUR if I recall correctly. And I give it away... I really needed
the money but I couldn't use it.

But I had an opportunity, the opportunity to invest my money in hope. Hope in
someone I didn't know. Hope that having less is going to give me more in the
future.

I tweeted to [@eurucamp](https://twitter.com/eurucamp) telling them that I had a
ticket to give away for a good reason. Few moments after that
[@sheley](https://twitter.com/sheley) answered me telling me that she wanted to
switch careers and wanted to go to Eurucamp.

I gave her the ticket with some minor conditions, that happened one year ago. A
Few weeks ago she told me that she now have her first job as a developer.
I'm extremely proud of her and I'm eager to know what's next.

She wrote her journey in [her blog](http://ihatehandshakes.com/blog/2014/it-takes-a-village-to-make-a-programmer/)

**UPDATE:** Currently I see the blog down, but you can see a [cached
version](http://webcache.googleusercontent.com/search?q=cache:ihatehandshakes.com/blog/2014/it-takes-a-village-to-make-a-programmer/)

I started applying that minimalism to my life and my work habits.

I don't have services on login, I have this in my `.zshrc` and this
[tool](https://github.com/elcuervo/dotfiles/blob/master/zsh/zsh/tools.sh):

```bash
load_services() {
  if [ -f ".services" ]; then start_services; fi;
}

chpwd() {
  load_services
}
```

In this journey you find stuff... stuff that changes you. You inspire and get
inspired by people but also by the things around you.

In this attempt to become a minimalist, in code and life I found something else.
I found the inspiration and the transpiration to break my limits, my rules.

When you find a way you want to share it as well and that's what I've been doing
in my talks but one talk is different one talk is the echo of my thoughts it had
my rage and my love.

My talk in [Ruby Conf Argentina](http://rubyconfargentina.org) it's a sum of my
beliefs.

For every action there's a reaction. The great people who inspired me gave me
the tools to became who am I. And that's why I know this talk it's just the echo
of great people. The ones who fought clutter, noise and oppression.

<script async class="speakerdeck-embed" data-id="095e73303aab0131eddb6ef1f34b6106" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

Everyone needs a war and an ideal to stand upon. And thanks to my friends I
found mine.

# Live and let die

> The secret of happiness, you see, is not found in seeking more, but in
> developing the capacity to enjoy less.
>
> **Socrates**

This is my way, the path I've chosen. Most of the things you read here will only
apply to me but maybe and just maybe can inspire you to do something else.

I'd love to be able to inspire someone as others inspire me.

I can't see my life without code, I can't see my code without minimalism
therefore I can't see my life without minimalism. It's one thing, and a thing
that pushes me forward.

Losing can be hard and unnatural. Getting rid of layers and layers in life can
become a struggle since we are raised in a world were you are measured based on
what you have.

It's your life and your code, you have the power to choose your way and share it
if you want but remember , it's your way, your life and at the end the race it's
only against yourself.
