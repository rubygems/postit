# PostIt
## The Bundler Version Manager

```bash
$ gem install postit
```

Bundler is great at managing your gem dependencies, but if you've ever thought
"What I really need is a way to manage my _bundler_ version" -- look no further!

PostIt has a few different modes of operation, all of which attempt to make
keeping your team on a consistent bundler version a breeze.

### Usage

The main way of using PostIt is via the `postit` command -- you can use it just
like the `bundle` command, and PostIt will handle invoking the correct bundler
executable and forwarding along all of your arguments. So to `bundle install`,
you'd just run `postit install`, etc.

Additionally, if you have `require 'bundler/setup'` anywhere in your code, you
can replace it with `require 'postit/setup'` and it will activate the correct Bundler version and then `require 'bundler/setup'`.

If you're building tooling and want to know what version of Bundler PostIt has
inferred, you can run `postit --bundler-version` to have that version printed to
`STDOUT`.

### Bundler Version Selection

#### `Gemfile.lock`

By default, PostIt will read your Bundler version from your `Gemfile.lock`,
meaning you don't have to do anything special to use the same bundler version as
the rest of your team -- just `postit install` and PostIt will automatically
infer the correct Bundler version for you.

#### Command Line Argument

When invoking `postit`, you can specify the Bundler version as the first argument, so to run `bundle exec` with Bundler 1.9.6, for example, you can do `postit 1.9.6 exec`.

#### Environment Variable

Setting the `BUNDLER_VERSION` environment variable to the desired Bundler version will work as if you'd passed the version as a command line argument.
