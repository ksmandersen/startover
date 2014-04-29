# Startover

Startover is a boilerplate for developing static websites on your Mac using HTML5, Compass, Pow and jQuery. With Startover you don't have to start over!

_**NOTICE:** This project is no longer actively maintained. I have since started using [Hammer for Mac](http://hammerformac.com/) which provides much more functionality._

## Another boilerplate?

I agree! We really don't need more boilerplates or frameworks for developing websites. Startover relies heavily on the works
of others like [html5boilerplate](http://html5boilerplate.com/). However none of the boilerplates I've stumpled upon have
been quite right for me. I like things minimal and agile. This is why **Startover is not for everyone**. I created Startover
to fit my workflow with the tools I frequently use when developing websites.

A few disclaimeres:

* Startover is based on my workflow and how I work with static site development. I don't expect the code to be usable for anyone else but if you can use it that makes me happy!
* The code in this repository is mostly not documented. That means if you have no idea what some of the code do or just have a question, then just open up a new issue and I will try to respond.
* I use a mac for development therefore some of the code in this repository will assume the same. If you're on Windows or Linux well then good luck!

## Requirements

You need to have the following installed to use the code in this repository:

* [Ruby](http://www.ruby-lang.org/)
* [Rubygems](http://rubygems.org/)
* [Compass](http://compass-style.org)
* [Pow](http://pow.cx)
* [NPM (Node Package manager)](https://npmjs.org/)
* [UglifyJS2](https://github.com/mishoo/UglifyJS2)

## Usage

Get a copy of the repository onto your machine. You can do that either by cloning the repository like so:

    git clone https://github.com/ksmandersen/startover.git

or you can just grab a [zip of the latest version](https://github.com/ksmandersen/startover/archive/master.zip). To make sure you have all the needed gems on your machine you can run the bundle command:

    bundle

From here you can either just work with the code as it is and setup stuff manually or you can use rake. To get rolling with rake, make sure it is installed and then run this command:

    rake setup

This will setup a Pow virtual host and generate the necessary files and directories. You can optionally pass the setup task a name of the site. The setup will then name the virual host for pow that name instead of basing it on the directory name. Example:

    rake setup["mysite"]

This will create the host ``mysite.dev``. If you're using zsh like me then remember to unescape the brackets (``rake setup\["mysite"\]``). To start watching for changes with compass you can run:

    rake watch

Once ready for production you should run the generate command to compile and compress your stylesheets and javascript.

    rake generate

After generating make sure you include the minified and compressed javascript files in your HTML. The minified files will be located in ``js/min``.

## Compass

If you write a lot of CSS there are a lot of tools out there that can hugely speed up your process. [Compass](http://compass-style.org) is one of these tools. It uses the [Sass](http://sass-lang.com) syntax and gives you stuff like nested rules, variables, mixins, inheritance and much more. In addition to the nice syntax it also gives you a huge framework for dealing with CSS3 compatabiliy issues between browsers.

Startover is hugely built around the use of compass because it's totally awesome! To get rolling you'll have to have compass
installed. You can do so like so:

    (sudo) gem install compass

Once installed you can start generating stylesheets by navigating to your project in the terminal and running the watch command:

    compass watch

Compass will tell automatically generate a new stylesheet each time you save tou sass files. Startover already has a [config](config.rb) file for Compass bundled. The default sass file is [main.sccs](style/sass/main.sccs). Compiled stylesheets are located in [style/css](style/css).

### Plugins

There are a couple of tools and extensions for compass that can make your life easier depending on the task at hand.

#### Bless

If you have a site with a huge amount of CSS rules you might wan't to install [Bless](http://blesscss.com). Bless can split your stylesheets into several files to get around the [IE CSS Selector Limit](http://stackoverflow.com/questions/9906794/internet-explorers-css-rules-limits). You can easily install Bless with [npm](http://npmjs.org/) like so:

    (sudo) npm install bless -g

When you have Bless installed navigate to the compass configuration file ([config.rb](config.rb)) and uncomment the following lines:

    on_stylesheet_saved do |filename|
        system('blessc',filename,'-f')
    end

Depending on how you installed Bless and your $PATH you might need to specify the full path for blessc above.

#### HiDPI

If you have to serve images for retina devices like the iPhone, iPad or Retina macs you might wan't to use the [HiDpi](git.io/hidpi) mixin for Compass. The mixin is bundled with Startover. All you have to do is uncomment the include statement in the [style/sass/main.scss](main.scss) file.

#### Susy

Finally, if you need to develop a grid based responsive site you should totally check out [Susy](http://susy.oddbird.net). It installs just as easy as compass like so:

    (sudo) gem install susy

## Javascript and Uglify

Startover uses the [UglifyJS2](https://github.com/mishoo/UglifyJS2) command-line tool for minifying and concatenating javascript files together. Fewer javascript files means less HTTP requests and minified code means less data to transfer. You'll need to have [NPM](https://npmjs.org/) installed before installing UglifyJS2. To install the command line version of the library run this command:

    (sudo) npm install ufligy-js -g

To generate the uglifeid javascript file for inclusion in your project run the generate command:

    rake generate

Don't forget to include the minified version from your HTML.

## Pow

Installing and setting up a local webserver for hosting your new project is a pain in the A\*\*. Right? Wrong! [Pow](http://pow.cx) is the ultimate tool wheen it comes to developing static websites on your Mac. Pow will take any static site or Rails app you throw at it and turn it into a ``mysite.dev`` URL that you can access in your browser. Setting up Pow can be done just by running a single command:

    curl get.pow.cx | sh

Once installed just set up an alias for your project like so:

    rake setup ["mysite"]

Startover has a custom rackup configuration to avoid the use of a public folder that would otherwise be necessary with Pow. If you need access more folders within the project other tham ``/fonts``. ``/images``. ``/js`` and ``/style`` you will need to configure the rackup server. To do so take a look at [config.ru](config.ru).

### Debugging remotely

With pow and [xip.io](http://xip.io) you can reach your websites from any device within your local network. Say your local website is at ``mysite.dev`` and your local ip address is ``192.168.1.100`` then you pick your iPad and go to ``http://myapp.192.178.1.100.xip.io`` and test your website.

If you need to test your site outside your local network you can do that to using [Forward](https://forwardhq.com/). The service is paid but definitely worth every penny.

## Legal

The source code for this project is released under the Open Source MIT License.

The MIT License (MIT)
Copyright (c) 2013 [Kristian Andersen](http://github.com/ksmandersen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
