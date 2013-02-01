# Startover

Startover is a boilerplate for creating static websites using html5, Compass (SASS) and jQuery. With Startover you don't have to start over!

## Another boilerplate?

I agree! We really don't need more boilerplates or frameworks for developing websites. Startover relies heavily on the works
of others like [html5boilerplate](http://html5boilerplate.com/). However none of the boilerplates I've stumpled upon have
been quite right for me. I like things minimal and agile. This is why **Startover is not for everyone**. I created Startover
to fit my workflow with the tools I frequently use when developing websites.

## Components

### Compass

If you write a lot of CSS there are a lot of tools out there that can hugely speed up your process. [Compass](http://compass-style.org) is one of these tools. It uses the [Sass](http://sass-lang.com) syntax and gives you stuff like nested rules, variables, mixins, inheritance and much more. In addition to the nice syntax it also gives you a huge framework for dealing with CSS3 compatabiliy issues between browsers.

Startover is hugely built around the use of compass because it's totally awesome! To get rolling you'll have to have compass
installed. You can do so like so:

    (sudo) gem install compass

Once installed you can start generating stylesheets by navigating to your project in the terminal and running the watch command:

    compass watch

Compass will tell automatically generate a new stylesheet each time you save tou sass files.

#### Plugins

**Bless:**

There are a couple of tools and extensions for compass that can make your life easier depending on the task at hand. If you have
a site with a huge amount of CSS rules you might wan't to install [Bless](http://blesscss.com). Bless can split your stylesheets into several files to get around the [IE CSS Selector Limit](http://stackoverflow.com/questions/9906794/internet-explorers-css-rules-limits). You can easily install Bless with [npm](http://npmjs.org/) like so:

    (sudo) npm install bless -g

When you have Bless installed navigate to the compass configuration file ([config.rb](config.rb)) and uncomment the following lines:

    on_stylesheet_saved do |filename|
        system('blessc',filename,'-f')
    end

Depending on how you installed Bless and your $PATH you might need to specify the full path for blessc above.

**HiDPI:**

If you have to serve images for retina devices like the iPhone, iPad or Retina macs you might wan't to use the [HiDpi](git.io/hidpi) mixin for Compass. The mixin is bundled with Startover. All you have to do is uncomment the include statement in the [main.scss](main.scss) file.

**Susy:**

Finally, if you need to develop a grid based responsive site you should totally check out [Susy](http://susy.oddbird.net). It installs just as easy as compass like so:

    (sudo) gem install susy

### Pow

Installing and setting up a local webserver for hosting your new project is a pain in the A\*\*. Right? Wrong! [Pow](http://pow.cx) is the ultimate tool wheen it comes to developing static websites on your Mac. Pow will take any static site or Rails app you throw at it and turn it into ``mysite.dev`` URL that you can access in your browser. Setting up Pow can be done just by running a single command:

    curl get.pow.cx | sh

Once installed just set up an alias for your project like so:

    cd ~/.pow
    ln -s /path/to/mysite

Now you're all set. Go make some awesome websites!

## Legal

The source code for this project is released under the Open Source MIT License.

The MIT License (MIT)
Copyright (c) 2013 [Kristian Andersen](http://github.com/ksmandersen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.