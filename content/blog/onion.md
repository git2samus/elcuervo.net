---
layout: post
title: Onion
subtitle: TOR hidden services for dinner
categories: [crypto]
date: 2016-06-01T22:30:01-03:00
icon: code
header: onion.jpg
attribution: maroon

---
[TOR](https://www.torproject.org/) is incredibly important and useful in the
current state of the Internet.

It provides the ability to browse with a pretty thick layer of anonymity but it
also includes some amazing stuff, called "hidden services".

These services are the building block of the most know
[DarkNet](https://en.wikipedia.org/wiki/Darknet) nowdays.

Hidden services provide nice technical challenges but they are fundamental
because they can not be taken down due to an ISP blacklising an IP or registrant
taking down the domain.

They give the Internet a resiliency layer to ensure that information gets out
there.

# Run hidden services

There are no particular differences between a normal computer service and a TOR
hidden service. The difference is in the routing.

Instead of connecting to a DNS to resolve certain name and then connect directly
to the ip a hidden service is only reachable via the TOR network.

# .onion address generation

From wikipedia:

> Addresses in the .onion TLD are generally opaque, non-mnemonic, 16-character
alpha-semi-numeric hashes which are automatically generated based on a public
key when a hidden service is configured.

> These 16-character hashes can be made
up of any letter of the alphabet, and decimal digits from 2 to 7, thus
representing an 80-bit number in base32. It is possible to set up a
human-readable .onion URL (e.g. starting with an organization name) by
generating massive numbers of key pairs (a computational process that can be
parallelized) until a sufficiently desirable URL is found

Getting a "good" address takes time, a lot. The longer the wanted address the
longer the time.

For example in the
[Facebook onion address](https://www.facebook.com/notes/protect-the-graph/making-connections-to-facebook-more-secure/1526085754298237/)
scenario they did a smart workaround which was generating a long but not full
.onion address and just pick the one that looked the better.

You can generate the private key in many ways but I opted for [Scallion](https://github.com/lachesis/scallion)
because it uses GPU for the hashing so it can run really fast if you have a
proper video card.

Start the generation of the private key is as easy as:

```bash
mono scallion.exe elcuervo
```

This is the output, you can use `-o [FILE]` to avoid depending of `stdout`:

```xml
<XmlMatchOutput>
<GeneratedDate>2016-06-02T01:25:55.540627Z</GeneratedDate>
<Hash>elcuervogx7fy5kz.onion</Hash>
<PrivateKey>-----BEGIN RSA PRIVATE KEY-----
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-----END RSA PRIVATE KEY-----
</PrivateKey>
</XmlMatchOutput>
```

This is an extract of my `torrc` config file:

```
HiddenServiceDir /var/lib/tor/elcuervo/

HiddenServicePort 80 127.0.0.1:80
HiddenServicePort 22 127.0.0.1:22
```

You can can have as many hidden services as you want just add the `private_key`
and the `hostname` file.

add a `hostname` with the newly generated hash and add the key to the
`private_key` file.

I ran this process in a `gx.large` EC2 instance using GPU. It took 19 minutes to
generate it.

# Server configuration

For this example I'll be using [Caddy](https://caddyserver.com) because is just
awesome and really easy:

`Caddyfile`:

```
elcuervo.net, http://elcuervogx7fy5kz.onion {
  root /var/www/elcuervo.net
}
```

Be sure to restart the both `tor` and `caddy` and you are good to go. You can
read this same information in the onion version of my blog:
http://elcuervogx7fy5kz.onion/

Just download
[TORBrowser](https://www.torproject.org/projects/torbrowser.html.en) and give it a try.
