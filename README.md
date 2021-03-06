# DEPRECATION NOTICE

OpenSSH 7.3p1 (circa 2016-08-01) finally added an `Include` directive, so this project is limited in utility unless you truly need Rakefiles to assemble complex ssh\_config rules.

# SSH Config Generator

## Why does this exist?

Yeah, why _does_ this exist!?

`ssh_config`'s flexibilty begs for rich, multipurpose complexity, but unfortunately it didn't provide tools to manage it. You're either forced to manage multiple, entirely distinct files and make sure to invoke them properly on the commandline, or resign yourself to monolithic convolution.

So if you have an enormous piles of hosts to manage (Vagrant, Ansible, etc), especially if they're managed elsewhere (a Git repo, perhaps), you'll find that it's quite a burden... until now!

I made this project so you can deterministically rebuild your ssh configuration from your chosen definitive sources.

You can invoke it manually, stuff it in your crontab, or use hooks from your VCS of choice to automatically rebuild it based on source changes.

----------------

## How to use it

It's pretty easy. Read on.

### Installation

`git pull https://github.com/fl0at/ssh_configurator.git`

* You should probably read the files in `src` that combine into your desired `config`: the warning banner, header, hosts and tail.
  * They're a bit opinionated! ;)
* `rake`, or `make`.

Once you're happy with the resulting `config`, you can move everything into your real `~/.ssh` and enjoy.

#### Make it yours
Optional, but let's be honest: you're gonna play with this :-)

* Add any additional files into the Rakefile
* Move your existing keys into the `keys` directory for cleanliness

### Day-to-day usage

`cd ~/.ssh; rake`

That's it!

If any of your source files have changed, you'll get a shiny new `~/.ssh/config`. Otherwise, no time will be wasted. Science!©

### Automating it

You can write up git hooks around something like `git diff "HEAD@{1}" --name-only | grep -q "$FILE"` to warn when your desired file or files change.  
Other VCSes will likely have similar commands available. PRs welcome!

You can also use `crontab` but that seems silly to me. Still, it takes all sorts!
