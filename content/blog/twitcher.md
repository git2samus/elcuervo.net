---
layout: post
title: Twitcher
subtitle: The missing Go ticker
categories: [golang, oss]
date: 2014-02-21
icon: code
header: eyes.jpg
attribution: martinaphotography

---

One of the beautiful things about Open Source it's just to build something you
want ONLY because you want it.

Everyone has a mentor or at least references, people you admire. On top of my
list are [soveran](https://github.com/soveran), [cyx](https://github.com/cyx)
and [inkel](https://github.com/inkel) and thanks to their guidance I'm a big
advocate of small libraries with clear responsibilities.

With that in mind I made [Twitcher](https://github.com/elcuervo/twitcher) wich
is basically a wrapper on top of the `Go` `time.NewTicker` function.

## How does it work?

```go
twitcher := twitcher.NewTwitcher(time.Second * 30)
twitcher.Do(func() {
  println("I'm going to be executed every 30 seconds")
})
```

But that's just slightly different from using `Go` stdlib `Ticker`...

Yes, this would be the example using it:

```go
t := time.NewTicker(time.Second * 30)
go func() {
  for {
    <-t.C
    println("I'm going to be executed every 30 seconds")
  }
}()
```

But the catch comes when you want to update the "ticking".

You can't just modify the channel you need to wrap it in something and that's
what Twitcher does. Let's you easily modify the reference to the channel.

And for that reason `Twitcher` exists. To have an `Update` and an easy way to
execute a function on each tick.

```go
twitcher.Update(time.Second * 5)
```

Will change the execution time of the function.

And you can `Stop` the function just by calling it.

```go
twitcher.Stop()
```

Sometimes you want to access the channel to do your own stuff. And you can:

```go
for {
  <-twitcher.C
}
```

I hope you find this helpful.
