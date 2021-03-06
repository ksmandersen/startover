# Startover

[![](https://travis-ci.org/ksmandersen/startover.svg)](https://travis-ci.org/ksmandersen/startover)
[![node](https://img.shields.io/node/v/gh-badges.svg?maxAge=2592000)]()
[![apm](https://img.shields.io/apm/l/vim-mode.svg?maxAge=2592000)]()

Startover is a highly opinionated boilerplate for developing static websites on your Mac using HTML5, Sass, Gulp and ES2015. With Startover you don't have to start over!

## Another boilerplate?

I agree! We really don't need more boilerplates or frameworks for developing websites. Startover relies heavily on the works of others like [html5boilerplate](http://html5boilerplate.com/). However none of the boilerplates I've stumbled upon have been right for me. **Startover is not for everyone**. I created Startover to fit my workflow with the tools I like to use when developing websites. Starover can be used either as it is or as an inspiration for your development workflow.

A few disclaimers:

* Startover is based on my workflow and how I work with static site development. I don't expect the code to be usable for anyone else but if you can use it that makes me happy!
* The code in this repository is mostly undocumented. That means if you have no idea what some of the code do or just have a question, then just open up a new issue and I will try to respond.

The code in this repo assumes that you're familiar with the following technologies:

* [Gulp](http://gulpjs.com/). A toolkit for automating tasks like moving, copying, building or otherwise manipulating files.
* [Sass](http://sass-lang.com/). A superset of CSS that enables nesting, functions, mixins and more.
* [BEM](http://getbem.com/). A strategy for naming CSS classes and HTML elements in a modular reusable fashion.
* [Handlebars](http://handlebarsjs.com/). A templating language for HTML written in Javascript.
* [Express](http://expressjs.com/). A simple web server written running on node.js
* [Babel](https://babeljs.io/). A compiler that generates web browser supported Javascript from your ES2015/ES2016 code.
* [Dokku](https://github.com/dokku/dokku). A docker powered PaaS server. (Basically allows you to have your own Heroku server).

Other technologies used in this boilerplate: [BrowserSync](https://browsersync.io/), [Browserify](http://browserify.org/), [jQuery](https://jquery.com/), [Ladda](http://lab.hakim.se/ladda/), [normalize.css](https://necolas.github.io/normalize.css/), [retina.js](http://imulus.github.io/retinajs/), [Watchify](https://github.com/substack/watchify).

## Startover in the wild

Here are some sites that uses Starover 2.0:

* [conductthis.com](http://conductthis.com) ([Source](https://github.com/Northplay/conductthis.com))
* [northplay.co](https://northplay.co) ([Source](https://github.com/Northplay/northplay.co))

Here are some sites that was built with Startover 1.0:

* [robo.cat](http://robo.cat/) ([Source](http://github.com/robocat/robo.cat))
* [itsbreaking.com](http://itsbreaking.com/) ([Source](http://github.com/robocat/itsbreaking.com))
* [thermodo.com](http://thermodo.com/) ([Source](http://github.com/robocat/thermodo.com))
* [televisedapp.com](http://televisedapp.com/) ([Source](http://github.com/robocat/televisedapp.com))
* [designdk.co](http://designdk.co/) ([Source](http://github.com/ksmandersen/designdk))
* [cphfront.com](http://cphfront.com) ([Source](http://github.com/ksmandersen/cphfront.com))

If you're using Startover you should totally tell me so you can get featured here on this list of awesome sites (self-five).

## Requirements

You need to have the following installed to use the code in this repository:

* [NPM (Node Package manager)](https://npmjs.org/)
* [GraphicsMagick](http://www.graphicsmagick.org/)

The ease way to get node.js and GraphicsMagick on a mac is using homebrew. Just run:

```
brew update & brew install node graphicsmagick
```

## Getting started

Clone the repository:

```bash
git clone git@github.com:ksmandersen/startover.git
```

Install the project dependencies for ruby gems and node packages:

```
npm install
```

## Building

To run the local development version of the site with browser sync:

```
npm run dev
```

Build a local version of the site:

```
npm run build
```

Build a release version of the site:

```
npm run build-production
```

## Deploying

I've been using [Dokku](http://dokku.viewdocs.io/dokku/) for some time to deploy this stack.
The repo includes a simple nodejs server app running on express to serve the static content of the
site. You should be able to deploy the code anywhere that accepts a simple nodejs app, like Heroku.

## License

The MIT License (MIT)
Copyright (c) 2013-2016 [Kristian Andersen](http://kristian.co)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
