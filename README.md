

Bibliomaniac
===========

A Node.js playground, pretending to be an ebook repository and information retrieval system
--------------------------------------------------------------------------------------------

# Introduction #

Bibliomaniac is going to be an ebook repository and information
retrieval system. Note the future tense: because in effect it is a
playground in order to practice with as many aspects of the rapidly
growing node.js ecosystem as can be crammed into one particular
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
for further, future development. And apart from the program itself, a
log will be kept on http://soyrochus.github.com/bibliomaniac
concerning the experiences gained in developing the program.

# The program #

Suppose that you happen to encounter a directory full with epub and
mobi files on your hard disk. Ethical questions aside (being adherents
of the "new economy", we will deal with those at a later date), the
sheer number of files makes *using* i.e. *reading* the files a
hassle. Which one to choose, what information is enclosed in those
obfuscated titles? What contain those files "Mockingbird -
S. Lewis.mobi", "To kill a Mockingbird.Harpel.Lee.1960.epub" and
"MockingBird by Sean Stewart.epub"?  Wouldn't it be nice to be able to
automatically retrieve of each individual file information such as a
synopsis or bibliographic data like author, title, index terms or
genre? It would be handy to be able to see how the books are
evaluated by different reviewers and the public. Ideally with a
comparative overview to top it off: a simple display of which book is
what: ordered per genre and rating. This will allow the user to easily
separate grain from chaff, which after all is clearly a philistine' s
prerogative.

## A Use case ##

A typical use case for example could be:

 * The user has a directory filled with ebooks
 * She can import the books in Bibliomaniac which:
   * indexes the files (makes them search-able)
   * presents embedded meta-data
   * aggregates bibliographic data from public sources (internet)
   * aggregates other meta-data, like review, page on Amazon (or equivalent point-of-sale)
 * She can subsequently present the data in several "easy to pick" lists, ordered by:
   * genre
   * author
   * popularity
   * year of publication
 * which allows her to select one or more books and, optionally, transfer it to the reading device of her choice
 * navigate automatically to the Amazon page (or other point-of-sale) where she can purchase the book

## Requirements ##

The functional characteristics as described above will need to be
implemented in a first public release of the program in order for it
to be really useful (correspond "business value"). The books may be
incorporated in a monolithic database but they should be:

 * easily accessible and
 * easily exportable, while
 * the repository as such needs to be easy to back up (contained in
   one single base directory)

The program should contain both a command line interface for power
users as well a browser (or other GUI) interface for ordinary users.

Currently not required are:

 * functionality to convert the ebooks from one format to another
 * provide for synchronization between different devices

# Technical requirements #

The technical requirements are based more on the needs of the program
to be a "playground" for whatever fetish the developer may dream up,
rather then what is needed to comply with the formulated functional
requirements. It is assumed that the application will be over-engineered
and developed according to a rather well-heeled process. This should
not have any detrimental effect on the actual usability of the program
itself.

The technical requirements in order to properly reflect the
"architect's" most naughty dreams are:

 * Specifications must be declared and verified (tested) through Vows specs/tests.
 * The application must be based on Node.js for the back-end and console interface
 * All code must be written in Coffeescript instead of JavaScript
   both on the client as well as server
 * The application must consist of multiple layers and offer separate console
   and web user interface
 * The web interface must consist of a single web page application
   using a proper MVC architecture. It should incorporated Backbone to
   facilitate this
 * Apart from Backbone, the web client should use Underscore to focus
   on functional patters (where Coffeescript's facilities are not
   sufficient) and JQuery for operations on the DOM.
 * The web interface should communicate with the back-end through Socket.IO
 * The back-end should run on Node.js and use, where possible Backbone
 * The console and web back-end should be instances of the same component
 * This component, i.e. both console as well as the back-end, should
   communicate with a service layer using ØMQ
 * The service layer should use MongoDB to store the data
 * MongoDB must be abstracted within a storage layer. This layer can
   be used as a Node module from within the service layer

# Architecture #

## General system design ##

The application will implement the following system-side architecture:


      +----------------+             +-------------------+        +--------------------+
      |                |             |                   |        |                    |
      |    Console     |             |   Service layer   |        |  Storage Layer     |
      |    Client      |-------------+                   +--------+                    |
      |      A)        |     2)    /-|       D)          |   3)   |        E)          |
      +----------------+         /-  +-------------------+        +--------------------+
                               /-
                              /
      +-----------+    +-----/-----+
      |           |    |           |
      |           | 1) |  web svc  |
      |  SPA      +----+  router   |
      |    B)     |    |    C)     |
      +-----------+    +-----------+


 - A: the console client 
 - B: The web client, a single page "AJAX" application, served by
 - C: The "web layer" which is responsible for serving the web client
   and facilitating the JSON web services (across HTTP or WebSocket:
   see '1') which the web client ('A') uses.
 - A/C) Both client components use ØMQ (see '2') to connect to
 - D) The Service layer runs in a separate process. It contains the
   actual application logic, decoupled from client-specific logic. It
   stores and retrieves data using:
 - E) The Storage layer. This runs in the same process as 'D' and is
   loaded and used a Node module (see '3')

The main application will consist of two processes, depicted as either
'A' or 'C', depending on whether the console or web client is used,
and 'D'/'E' respectively, both running Node (with a hidden background
threads managed by ØMQ). The DB will run in a third process. The web
client application will be served over over HTTP (on a configurable
port) by 'C'. Apart from this, the SPA will connect through HTTP or
WebSocket.

All remote connections use json-rpc as the inter-process communication
protocol irrespective of the underlying transport protocol (HTTP,
WebSocket and ØMQ).

To pimp the architecture a bit in literary terms, the three basic discernible layers will be described as:

 - The Desk (client end, either web client and router or console client)
 - The Curator (Service layer)
 - The Shelves (Storage layer)

Per component Backbone will be used to implement a light MVC structure where feasible and useful.

## Web client ##

*TO BE DONE*

# Specifications #

The functional requirements are formalated as BDD Scenario's. They are
included in the file SPECS. The scenarios are incorporated as "vows",
Test suites as implemented by the Vows BDD framework. The vows are
defined in Coffeescript. During development a desiscion will be made
whether the vows-bdd specification DSL will

# Prerequisites #

In order to build and use the program the following programs and libraries need to be installed:

 * Node.js: for installation instructions see http://nodejs.org/
 * Npm, the Node package manager: http://npmjs.org/
 * tl;dr: checkout https://github.com/joyent/node/wiki/Installation
 * ØMQ: http://www.zeromq.org/
 * MongoDB: http://www.mongodb.org/


all other requisites can be installed running:

    make deps

# Installation & usage #

A copy of this repository can be obtained the usual way. Building the
program, running it as well as the tests, generation of the
documentation etc. can be done through the Makefile located in
src/node. Run

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

# Usage #

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


<!--  LocalWords:  Bibliomaniac js Coffeescript SocketStream NoSQL tl
 -->
<!--  LocalWords:  ØMQ Github Behaviour Docco epub mobi MockingBird
 -->
<!--  LocalWords:  ebooks MVC Coffeescript's JQuery DOM MongoDB svc
 -->
<!--  LocalWords:  bibliomaniac JSON WebSocket json rpc Npm dr deps
 -->
<!--  LocalWords:  Makefile src coffeescript javascript docco Iwan
 -->
