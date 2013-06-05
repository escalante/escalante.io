---
title: Documentation
layout: default
toc: true
---

<div class="page-header">
<h1>Documentation</h1>
</div>

#{page.table_of_contents}

## What is Escalante?

Escalante is an application server for [Scala](http://scalan-lang.org),
based on the popular [JBoss Application Server 7](http://www.jboss.org/as7).

### Open Source

Escalante is a project of the JBoss Community, and is completely
open-source software. Escalante is licensed under the
[EPL](http://www.eclipse.org/legal/epl-v10.html). You may download the
binaries or the source-code, modify it if you desire, and use it, even for
profit, without any licensing costs.

## Escalante Installation

This section explains how to install Escalante application server step by step:

### Ensure you have Java 6

Escalante requires Java JDK 6. To determine which version, if any, is
installed on your system, at a command-line, attempt to run the java
command with the -version argument.

    $ java -version
    java version "1.6.0_31"
    Java(TM) SE Runtime Environment (build 1.6.0_31-b04-415-11M3646)
    Java HotSpot(TM) 64-Bit Server VM (build 20.6-b01-415, mixed mode)

If the version is at least 1.6, your version of Java is sufficient. If you
have no Java installed, or a version less than 1.6, you'll need to install a
Java Development Kit. For many systems, it is easy to install the open-source
OpenJDK.

For installation on Ubuntu, Fedora, OpenSuse, or Debian, please refer to the
installation instructions provided by the OpenJDK project. If you find a java
on your system, ensure that it is not actually gcj, as it is insufficient for
running the Esclante server.

For Apple OSX systems, Apple provides a JDK version 6.

### Download binary distribution

You can obtain the latest version of Escalante from the [downloads
section](/download).

### Unzip it somewhere handy

We'll install Escalante under your user's $HOME directory.

    $ unzip -q escalante...

### How to run Escalante

Running Escalante essentially amounts to running JBoss:

    $ $ESCALANTE_HOME/bin/standalone.sh

## Escalante for Lift Web Applications

If you've never head of Lift, or have never used it, you might wanna check
the [FAQ section](/faq) where you can find answers to questions such as:

> Q. [What is Lift ?](/faq/#what_is_lift)

> Q. [Why develop web applications using
Lift ?](/faq/#why_develop_web_applications_using_lift)

> Q. [Why deploy Lift applications on
Escalante ?](/faq/#why_deploy_lift_applications_on_escalante)

Now that you're familiar with Lift, let's see what Escalante provides for
Lift developers. Escalante offers the possibility of deploying Lift
applications in two different ways. Let's look at the differences between
these two deployment modes:

### Optimising Lift applications for Escalante

Deploying Lift applications in other servlet engines, or application servers,
normally require the application to ship both the Lift and Scala libraries
within them, bloating the deployment archive.

Lift applications targeted for deployment in Escalante can be configured in
such way that they do not require any Lift dependencies to be shipped within
the application, and that includes the Scala language libraries too.
This vastly reduces the size of your application deployment archive.

To give you an idea, the most basic of the Lift examples, the war file for the
'Hello World' example, takes in the region of 30 MB. Without all the jar
dependencies, the war file takes a mere 8 KB.

So, the question is, how does Escalante know, at deploy time, which
dependencies your Lift application needs? Escalante figures out which
dependencies your applications needs reading a `META-INF/escalante.yml`
file within your deployment archive. This file should be formatted
following the [YAML](http://www.yaml.org/) markup language which offers a
human-readable way of defining metadata for your application.

Here's an example of `META-INF/escalante.yml` configuring all available
properties:

    scala:
      version: 2.10.1
    lift:
      version: 2.5-RC4
      modules:
        - mapper
        - jpa

This example descriptor is indicating to Escalante that the Lift version that
this application needs in 2.5-RC4, and that the Scala version required is 2.10.1.
Both `version` attributes are optional in which case, default values are
assumed. The default values currently used by Escalante are shown in the
example.

Once the dependency versions are known, Escalante uses a Maven dependency
resolver library to download, if not already present locally, and build the
necessary building blocks for your application to access these dependencies.

If multiple Lift applications are deployed into Escalante using the method
explained above, some of the dependencies can actually be shared between
different Lift applications, which results in a further reduction on memory
usage.

Lift's `modules` attribute defines a list of extra modules that the Lift
application requires. These modules essentially translate to Maven Lift
artifacts with these coordinates:

    <groupId>net.liftweb</groupId>
    <artifactId>lift-$<MODULE_NAME>_$<SCALA_VERSION></artifactId>
    <version>$<LIFT_VERSION><version>

By default, if no `modules` is given, Escalante brings in the `webkit` module
which is the base of any Lift application.

There's no limitation to the Scala or Lift versions supported. The only
requirement is that they can be resolved using Maven. Lift artifacts are
resolved using the coordinates mentioned above. For Scala dependencies,
these are resolved from these coordinates:

    <groupId>org.scala-lang</groupId>
    <artifactId>scala-library</artifactId>
    <version>$<SCALA_VERSION><version>

As a Lift application developer, you will be familiar with the requirement that
Lift applications require a `WEB-INF/web.xml` to be included within them in
order to define a Lift filter. With Escalante, this is not needed any more.

In the absence of a `WEB-INF/web.xml`, Escalante adds one to the deployment
archive. If the user application does contain a `WEB-INF/web.xml`, it uses the
one already shipped, so this means that the if the user provides a web
descriptor, it must contain the Lift filter definition.

### Maven support

Lift applications can be created and deployed into Escalante using Maven.
By far the best way to find out how to configuration applications to deploy to
Escalante using Maven is to inspect the [Escalante Quickstarts](/quickstarts)
and use them as starting point.

### SBT support

Lift applications can now be created and deployed into Escalante using SBT.
Thanks to the [Escalante SBT plugin](http://github.com/escalante/sbt-escalante),
`META-INF/escalante.yml` can be generated (if not already present in the
source tree) using the build's metadata information, and Lift applications
can be deployed to an embedded Escalante instance which does not require a
separate process.

By far the best way to find out how to configuration applications to deploy to
Escalante using SBT is to inspect the [Escalante Quickstarts](/quickstarts)
and use them as starting point.

### Standard Lift application support

Escalante can also deploy standard Lift applications that have not been
optimised. So, if you are already have packaged Lift applications, you can
deploy them without problems into Escalante. Bear in mind though that when
deploying such applications into Escalante, they must ship all the
dependencies required.

### Integration with application server services

Lift applications, whether optimised or not, can integrate with services
provided by the application server. For example, integration with the default
persistence datasource:

#### Connecting to datasources

Lift applications can connect very easily to the default persistence
datasource. To do so, Lift's bootable class, normally located in
`bootstrap.liftweb.Boot` needs to be modified to define the default database
connection identifier to point to the JNDI name of the example datasource:

    DefaultConnectionIdentifier.jndiName = "java:jboss/datasources/ExampleDS"

## Escalante for Play Framework 2 Applications

[Play Framework](http://www.playframework.com/) is a popular, lightweight,
stateless Scala web framework that's build on Akka and enables highly-scalable
applications. Check [FAQ section](/faq) for more in depth details about
Play Framework.

Starting in Escalante `0.3.0`, Play Framework 2.1 Scala web applications can
be deployed on top of Escalante natively. The integration is currently limited
to deployment of the applications and resolution of Play library dependencies,
but in future versions further integrations with the services provided by
Escalante will be developed.

### Getting started

By far the best way to get started deploying Play 2.x applications on top of
Escalante is to have a look at the [Escalante Play Quickstarts](/quickstarts)
and use them as starting point.

The primary way to deploy Play 2.x applications on top of Escalante is to use
[SBT](http://www.scala-sbt.org/), along with the Play and Escalante SBT plugins,
in order to build, deploy and run these type of applications. With this in mind,
the following system properties should be passed to the `sbt` command in order
to configure runtime configuration options:

* `-Dhttp.address`: configure HTTP address or host name for the application.
Default value is `0.0.0.0`.
* `-Dhttp.port`: configure HTTP port for the application. Default value is `9000`.
* `-Dhttps.port`: optional SSL port configuration.

### Logging from SBT

Logging, when running Escalante on top of SBT, works slightly differently to
standalone Play 2.x applications. Instead of defining logging information in
either `application.conf`, or providing `application-logger.xml`, in order to
fine tune logging settings, you need to pass a `-Djava.util.logging.config.file=`
property which points to a logging settings file. A typical JDK logging
configuration file would contain:

    handlers=java.util.logging.FileHandler,java.util.logging.ConsoleHandler
    .level=INFO

    io.escalante.level=FINEST
    org.level=INFO
    com.level=INFO
    play.level=FINEST

    java.util.logging.FileHandler.pattern = %t/escalante-%u.log
    java.util.logging.FileHandler.count = 1
    java.util.logging.FileHandler.level = FINEST
    java.util.logging.FileHandler.formatter = java.util.logging.SimpleFormatter

    java.util.logging.ConsoleHandler.level = FINEST
    java.util.logging.ConsoleHandler.formatter = java.util.logging.SimpleFormatter

### Reloadable Application Support

Currently Escalante does not support automatic Play application reload based
on source file changes. When application source code changes, it's currently
necessary to start Escalante once again (i.e. running `escalante-run` from
SBT console). Future versions of Escalante will provide this functionality.
