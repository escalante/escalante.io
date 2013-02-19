---
title: Why JBoss AS should use Scala... ;)
author: Galder Zamarreño
layout: news
display_tag_cloud: true
tags: [ jboss-as, arquillian, shrinkwrap, lift, maven-scala-plugin ]
---

I bet the title got the attention of a few [JBoss Application
Server](http://www.jboss.org/jbossas) developers, but let me clarify
something before I go on: __My intention is not to rewrite JBoss AS in Scala__.
However, I think __Scala makes it easier to build and test JBoss AS
extensions/subsystems compared to Java__. Let me explain:

JBoss Application Server 7+ is formed out of a MSC core and a bunch of
subsystems built on top of it. To test these subsystems, a mix of
steps are required including: compile the code, build the module(s) for this
subsystem, change application server configuration, start the server and
run your tests.

If you look at the JBoss Application Server code base, you'll find that
all these steps are achieved with a mix of operations involving:
Java compilation, Maven, Ant scripts...etc, which is a bit of pain.

When I started developing Escalante, one of my aims was to be able to test
my Escalante subsystems with __minimal need from a build tool__ and in the
__fastest possible way__. The end result is that today I can just right click
one of the Escalante Arquillian tests (i.e.
[Lift `HelloWorldTest`](https://github.com/escalante/escalante/blob/master/modules/lift/src/it/testsuite/src/test/scala/io/escalante/test/lift/helloworld/HelloWorldTest.scala))
, and it will run all the steps above without the need of a build tool!
How is that possible? Let me explain:

## Building an Escalante subsystem

Escalante code is layered in such way that subsystems can be built purely
using Scala code. For this post, let's take
the Lift subsystem as example (For those unaware, Lift is a web application
development framework for Scala, more info in the [FAQ](/faq/#lift)). So for
Lift, we have a class called
[`LiftModule`](https://github.com/escalante/escalante/blob/master/modules/lift/src/it/testsuite/src/test/scala/io/escalante/test/lift/LiftModule.scala)
which builds the JBoss module supporting the subsystem from scratch.
For that it uses:

* [ShrinkWrap](http://www.jboss.org/shrinkwrap) to build the JBoss module jar
which includes classes in a number of packages and definition of the
corresponding the JBoss AS Extension service provider:

<script src="https://gist.github.com/galderz/2c449b02d5759420b3a6.js"></script>

* Scala XML integration to define XML directly in the code (without annoying
Java formatting required to write an XML programmatically). XML is a
requirement of the JBoss Application Server, and the Lift module uses XML to
define itself and its dependencies. XML is also required in order to
configure the extension and subsystem in the main app server
configuration file:

<script src="https://gist.github.com/galderz/7ee50d97c14de904326d.js"></script>

<div class="alert alert-warning">
<strong>Warning</strong>: I'm fully aware that XML is one of Scala's most
controversial features, but it's actually very handy in this particular case
because it allows for seamless XML coding within Scala code. This promotes
encapsulation allowing both metadata information and logic to build a JBoss
module to reside in the same place, without the need of separate XML files.
</div>

## Running Escalante Arquillian tests

With the subsystem built, it's time to figure out how to make sure the
JBoss Application Server instance is ready to serve our applications.
For this, Escalante has implemented some nifty
[Arquillian](http://arquillian.org/) callbacks in a class called
[`ArquillianListener`](https://github.com/escalante/escalante/blob/master/modules/lift/src/it/testsuite/src/test/scala/io/escalante/test/lift/ArquillianListener.scala)
, which allow us to execute some code at different stages. This listener
class uses an
[`AppServer`](https://github.com/escalante/escalante/blob/master/modules/artifact/src/it/testsuite/src/test/scala/io/escalante/test/AppServer.scala)
class that encanpsulates logic to do with setting up the application
server correctly.

#### Unzip JBoss AS before test set up

Using `@Observes` with `BeforeSetup`, we can force the base JBoss Application
Server to be unzipped so that Arquillian has a JBoss Home to use:

<script src="https://gist.github.com/galderz/04a5114d5fc26f2ff5e5.js"></script>

The `testUnzipAppServer()` method just unzips the server and changes file
permissions if necessary:

<script src="https://gist.github.com/galderz/f1fe9dbb4b6f3eb75986.js"></script>

<div class="alert alert-success">
<strong>Prayer to the JBoss AS Gods</strong>: I hope at some point there will
be an easier way to kick off a JBoss Application Server from Arquillian
without the need of this unzipping... I'd love to have a way to say: my
application needs subsystems X, Y and Z, go fetch them and start a server
with those subsystems.
</div>

#### Set up modules before container start

Using `@Observes` with `BeforeStart`, we can force Arquillian to install
the modules into the JBoss Application Server using the code mentioned above.
This way, by the time the server starts, all the extensions we want to install
are ready with their modules built and the configuration ready:

<script src="https://gist.github.com/galderz/9d5a30135fea775f15b4.js"></script>

#### Tear down modules after container stop

This is a very important step because it's here where the app server is
restored to its initial state in order for other tests to run cleanly. This
involves restoring the original configuration:

<script src="https://gist.github.com/galderz/56dfb099672388ec430b.js"></script>

<div class="alert alert-info">
<strong>Note</strong>: In order to minimise changes to the application server
and simplify cleanup phase, the modules that we're testing are stored under a
different module path to the one the server uses. Arquillian allows us for
these extra modules paths to be passed to the server through the `modulePath`
property. See <a href="https://github.com/escalante/escalante/blob/master/modules/lift/src/it/testsuite/src/main/resources/arquillian.xml">arquillian.xml</a>
used by Escalante for more details.</div>

#### Plug Arquillian with the listener

Once the code is written, we just need to write the corresponding service
provider definition so that Arquillian picks it up:

<script src="https://gist.github.com/galderz/ee40eda5647bb506d08c.js"></script>

#### Run the tests from the IDE

With this in place, you can now run your JBoss Application Server subsystem
in-container tests directly from the IDE (of course, if you run it from Maven
it will also work)!!

## Reuse, reuse, reuse...

A very cool thing things about Scala is that it can work both as an
standard programming language to build applications, but also as a scripting
language, so this means that whatever code I've used to build the subsystems
and set up the app server for the unit tests, it can be perfectly used when
building an Escalante distribution.

With minimal changes, and the help of the
[Maven Scala plugin](https://github.com/davidB/scala-maven-plugin), I was
able to create a simple Scala script that would build the entire Escalante
distribution, which effectively builds the modules alongside their
configurations, and installs the subsystems and extensions in the main
configuration:

<script src="https://gist.github.com/galderz/bd2d67b6fa99f33309fb.js"></script>

Configuring Maven Scala plugin to run this script is dead easy:

<script src="https://gist.github.com/galderz/2bb6d4a0fedb7bcddc04.js"></script>

# Summary

Pretty much everything I explained in this blog post could have been achieved
using just Java (i.e. Maven has a Java exec plugin that could execute a Java
class to build the distribution).

However, I think Scala makes it a lot more concise and cleaner to write all
this up, particularly when it comes to embedding XML.

So, next time you're building a JBoss Application Server extension, give
Scala a go! Using the code in this blog post you should be able to build
JBoss Module jar archives required to test and run application server
extension/subsystems programmatically, as well as adding their own
configuration to the main app server configuration in a nice, reusable, way.

There are other benefits JBoss Application Server could get from using Scala
as opposed to Java, but I'll leave those for future blog posts ;).

Finally, all the code I mentioned above is located in the
[Escalante Git repository](https://github.com/escalante/escalante), so you
can clone it, open it in your favourite IDE and see all of this in action :)
