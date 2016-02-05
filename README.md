# SSH Config Generator

## Why does this exist?

Why _does_ this exist?!

`ssh_config`'s flexibilty begs for rich, multipurpose complexity, but unfortunately it doesn't provide tools to manage it. You're either forced to manage multiple, entirely distinct files and make sure to invoke them properly on the commandline, or resign yourself to monolithic convolution.

So if you have an enormous piles of hosts to manage (Vagrant, Ansible, etc), especially if they're managed elsewhere (a Git repo, perhaps), you'll find that it's quite a burden... until now!

I made this project so you can deterministically rebuild your ssh configuration from your chosen definitive sources.

You can invoke it manually, stuff it in your crontab, or use hooks from your VCS of choice to automatically rebuild it based on source changes.

## How to use it

It's pretty easy. Read on.

### Initial setup
* You must modify the files in `src/`: the warning banner, header, hosts and tail of the end-result `config` file. They're a bit opinionated!
* *OPTIONAL:* Add any additional files into the Rakefile
* *OPTIONAL:* Put your keys into `~/.ssh/keys` for cleanliness

### Day-to-day usage

`cd ~/.ssh; rake`

That's it!

If any of your source files changed, you'll get a shiny new `~/.ssh/config`. Otherwise, no time will be wasted. Science!©

#### Automating it

You can write up git hooks around something like `git diff "HEAD@{1}" --name-only | grep -q "$FILE"` to warn when your desired file or files change.
Other VCSes will likely have similar commands available. PRs welcome!

You can also use `crontab` but that seems silly to me. Still, it takes all sorts!
