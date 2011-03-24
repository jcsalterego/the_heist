
Heist
=====

Take the output of `gem list` and generate installation commands.


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

Apologies
=========

There is probably a better way to do this.

Known Side Effects
==================

Coughing, wheezing, sneezing, itching, runny nose, loss of appetite, dabbling in Clojure.

Suppresses ri/rdoc by default.

Likely due to dependencies, more gem versions will be installed than the designated versions.
