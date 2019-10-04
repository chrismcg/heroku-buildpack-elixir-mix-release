# A Heroku buildpack for Elixir / Phoenix Mix Releases.

## Purpose

This is intended to be used after the
[Elixir](https://github.com/HashNuke/heroku-buildpack-elixir) and
[Phoenix](https://github.com/gjaldon/heroku-buildpack-phoenix-static) buildpacks
to construct a release.

It will automatically setup a default Procfile to run:

`_build/prod/rel/<your app name>/bin/<your app name> start`

You would use this if you are currently using both Elixir and Phoenix buildpacks
and you want to use releases. If you are not using the Phoenix buildpack this
could also be useful but there is a [PR open to support releases in the Elixir
buildpack
directly](https://github.com/HashNuke/heroku-buildpack-elixir/pull/153) that you
might want to keep an eye on.

### Why releases

Why you might use releases vs `mix run phx.server` is covered in these links:

* https://hexdocs.pm/mix/master/Mix.Tasks.Release.html#module-why-releases
* https://elixirforum.com/t/always-use-releases/4573

The tldr is it avoids latency spikes caused by lazily loading the code after the
app starts.

## Features

* Builds a release using `mix release --overwrite`
* Sets up a default Procfile
* Not much else!

## Configuration

There's no configuration as yet. If you have need please send a PR or open an
issue. I'm not going to have a lot of time for maintenance on this so make no
guarantees on response times. That said please open a PR/issue if there's
something you think is useful so I can gauge interest.
