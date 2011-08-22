

Bibliomaniac 
===========

A Node.js playground, pretending to be an ebook repository and information retrieval system 
--------------------------------------------------------------------------------------------

# Introduction #

Bibliomaniac is going to be an ebook repository and information
retrieval system. Note the future tense: because in effect it is a
playground in order to practice with as many aspects of the rapidly
growing node.js eco-system as can be crammed into one particular
project.

So it will use Node.js, obviously. But it will also be written in
Coffeescript, be based on several important libraries - like Backbone
and Socket.IO - use a framework like Express or SocketStream, store
the data in a NoSQL DB and will incorporate ØMQ to connect the
different application layers. All done according to presumably best
practices which are currently being established: not just the use of
Github but also Behaviour Driven Development & unit testing with Vows,
something approaching literate programming with Docco (documentation
from source) etc.

So, although Bibliomaniac is intended to be a real, usable and useful
program, it will definitely be massively overdone and
over-engineered. Its use is to serve an an example or even template
for future further development. And apart from the program itself, a
log will be kept on http://soyrochus.github.com/bibliomanias
concerning the experiences gained in developing the program.


# Prerequisites #

In order to build and use the program the following programs and libraries need to be installed:

 * Node.js: for installation instructions see http://nodejs.org/
 * Npm, the Node package manager: http://npmjs.org/
 * tl;dr: checkout https://github.com/joyent/node/wiki/Installation

 and real soon....
 
 * ØMQ: http://www.zeromq.org/
 * MongoDB: http://www.mongodb.org/
 

all other requisites can be installed running:

    npm install coffee-script vows
    
or, using make

    make deps 
    
 
# Installation & usage #

A copy of this repository can be obtained the usual way. Building the program, running it as well as the tests, generation of the documentation etc. can be done through the Makefile located in src/node. Run 

    make show

in order to show all available options:

     make all           : build all files & run app
          run           : run application
          deps          : install node packages needed to build & run the application
          compile       : compile all coffeescript files to javascript
          compile-tests : as above; for test files
          watch         : compile all and watch for changes; compile as needed
          run-tests     : compile all and run tests
          docs          : generate docco documentation
          clean         : cleanup

Generated source documentation can be found in src/node/docs 

# Usage @

To be done ...

# Copyright #

    Copyright © 2011, Iwan van der Kleijn 
  
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

