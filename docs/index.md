---
title: Documentation
layout: default
---

# Introduction

Escalante is an application server for [Scala](http://scalan-lang.org),
based on the popular [JBoss Application Server 7](http://www.jboss.org/as7).

In the current version, Escalante allows you to deploy Lift applications in a
way that optimises the size of the deployment and the memory consumption at
runtime, both of which are of paramount importance. Escalante does however
still allow you to deploy standard Lift applications. Let's look at the
differences between these two deployment modes:

# Optimising Lift applications for Escalante

Lift applications targeted for deployment in Escalante do not require any Lift
dependencies to be shipped within the application, and that includes the Scala
lang libraries too. This vastly reduces the size of your application deployment
archive.

To give you an idea, the most basic of the Lift examples, the war file for the
'Hello World' example, takes in the region of 30 MB. Without all the jar
dependencies, the war file takes a mere 8 KB.

So, the question is, how does Escalante know, at deploy time, which
dependencies your Lift application needs? Escalante figures out which
dependencies your applications needs reading a `WEB-INF/lift.xml` file within
your deployment archive. Here's an example:

    <lift-app version="2.4" scala-version="2.9.1" />

This example descriptor is indicating to Escalante that the Lift version that
this application needs in 2.4, and that the Scala version required is 2.9.1.
Both `version` and `scala-version` attributes are optional in which case,
default values are assumed. The default values currently used by Escalante are
shown in the example.

Once the dependency versions are known, Escalante uses a Maven dependency
resolver library to download, if not already present locally, and build the
necessary building blocks for your application to access these dependencies.

If multiple Lift applications are deployed into Escalante using the method
explained above, some of the dependencies can actually be shared between
different Lift applications, which results in a further reduction on memory
usage.

In the current Escalante release, the Lift and Scala versions supported for
this deployment more are:
* Lift: 2.4
* Scala: 2.8.0, 2.8.1, 2.8.2, 2.9.0, 2.9.1, 2.9.2
Future releases might support more Lift and/or Scala versions.

As a Lift application developer, you will be familiar with the requirement that
Lift applications require a `WEB-INF/web.xml` to be included within them in
order to define a Lift filter. With Escalante, this is not needed any more.

In the absence of a `WEB-INF/web.xml`, Escalante adds one to the deployment
archive. If the user application does contain a `WEB-INF/web.xml`, it uses the
one already shipped, so this means that the if the user provides a web
descriptor, it must contain the Lift filter definition.

Quickstarts that show how ...


When Escalante find this descr


supported...
persistence



In the current version, Escalante can deploy:
- Standard Lift applications: These are standard Lift applicactions that embed
, all the jars necessary to run the application (i.e. Scala and Lift jar
dependencies)
- Escalante fla

- why use Escalante to run Lift applications
- build a an escalante lift track
- deploying to escalante using maven
- developing an