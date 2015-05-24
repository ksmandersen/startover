# Startover

[![](https://travis-ci.org/ksmandersen/startover.svg)](https://travis-ci.org/ksmandersen/startover)
[![David](https://img.shields.io/david/strongloop/express.svg)]()

Startover is a highly opinionated boilerplate for developing static websites on your Mac using HTML5, Sass, Gulp and Pow. With Startover you don't have to start over!

## Another boilerplate?

I agree! We really don't need more boilerplates or frameworks for developing websites. Startover relies heavily on the works of others like [html5boilerplate](http://html5boilerplate.com/). However none of the boilerplates I've stumbled upon have been right for me. **Startover is not for everyone**. I created Startover to fit my workflow with the tools I like to use when developing websites. Starover can be used either as it is or as an inspiration for your development workflow.

A few disclaimeres:

* Startover is based on my workflow and how I work with static site development. I don't expect the code to be usable for anyone else but if you can use it that makes me happy!
* The code in this repository is mostly not documented. That means if you have no idea what some of the code do or just have a question, then just open up a new issue and I will try to respond.
* I use a mac for development therefore some of the code in this repository will assume the same.

## Startover in the wild

Here are some sites that was built with Startover:

* [robo.cat](http://robo.cat/) ([Source](http://github.com/robocat/robo.cat))
* [itsbreaking.com](http://itsbreaking.com/) ([Source](http://github.com/robocat/itsbreaking.com))
* [thermodo.com](http://thermodo.com/) ([Source](http://github.com/robocat/thermodo.com))
* [televisedapp.com](http://televisedapp.com/) ([Source](http://github.com/robocat/televisedapp.com))
* [designdk.co](http://designdk.co/) ([Source](http://github.com/ksmandersen/designdk))
* [cphfront.com](http://cphfront.com) ([Source](http://github.com/ksmandersen/cphfront.com))

If you're using Startover you should totally tell me so you can get featured here on this list of awesome sites (self-five).

## Requirements

You need to have the following installed to use the code in this repository:

* [Ruby](http://www.ruby-lang.org/)
* [Rubygems](http://rubygems.org/)
* [Pow](http://pow.cx)
* [NPM (Node Package manager)](https://npmjs.org/)

The easy way to get Ruby and Node.js is with homebrew. Just run:

```
brew update & brew install ruby npm
```

For installing pow we recommend getting [Anvil for Mac](http://anvilformac.com/), it's free and pretty!

## Getting started

Clone the repository:

```bash
git clone git@github.com:robocat/itsbreaking.com.git
```

Install the project depencies for ruby gems and node packages:

```
make install
```

## Building

Build a local version of the site:

```
make build
```

Build a release version of the site:

```
make release
```

## Deploying

```
make deploy
```

## License

The MIT License (MIT)
Copyright (c) 2013-2015 [Kristian Andersen](http://github.com/ksmandersen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
