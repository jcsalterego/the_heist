
The Heist
=========

Take the output of `gem list` and generate installation commands.

What Kind of Gem Includes A Definitive Article?
===============================================

But the gem name `heist` was already taken!

Installation
============

    $ gem install the_heist

Usage
=====

Example gem list:

    $ gem list
    
    *** LOCAL GEMS ***
    
    redis (2.0.6, 2.0.5, 1.0.7)
    redis-namespace (0.8.0, 0.7.0)

Now pull off the heist!

    $ gem list | heist
    gem install redis --version=1.0.7 --no-ri --no-rdoc
    gem install redis --version=2.0.5 --no-ri --no-rdoc
    gem install redis --version=2.0.6 --no-ri --no-rdoc
    gem install redis-namespace --version=0.7.0 --no-ri --no-rdoc
    gem install redis-namespace --version=0.8.0 --no-ri --no-rdoc

Optinally, you can pull off the heist with only the newest version of each gem !
    $ gem list | heist --recent
    gem install redis --version=2.0.6 --no-ri --no-rdoc
    gem install redis-namespace --version=0.8.0 --no-ri --no-rdoc  

Apologies
=========

There is probably a better way to do this.

Known Side Effects
==================

Coughing, wheezing, sneezing, itching, runny nose, loss of appetite, dabbling in Clojure.

Suppresses ri/rdoc by default.

It is likely that gem dependencies will pile on more gem versions than the explicitly designated ones.
