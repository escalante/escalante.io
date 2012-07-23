---
title: Documentation
layout: default
toc: true
---

<div class="page-header">
<h1>Documentation</h1>
</div>

#{page.table_of_contents}

# Introduction

Escalante is an application server for [Scala](http://scalan-lang.org),
based on the popular [JBoss Application Server 7](http://www.jboss.org/as7).

To find out how to install Escalante, or how to start it up, please check
Escalante's installtion guide. The rest of the documentation focuses on how to
take advantage of what Escalante provides for Scala application developers.

# Escalante for Lift Web Applications

In the current version, Escalante allows you to deploy
[Lift web applications](http://liftweb.net/) in a way that optimises the size
of the deployment and the memory consumption at runtime, both of which are of
paramount importance. Escalante does however still allow you to deploy
standard Lift applications. Let's look at the differences between these two
deployment modes:

## Optimising Lift applications for Escalante

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

    <lift-app version="2.4" scala-version="2.9.2" />

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

* Lift versions: `2.4`

* Scala: `2.8.0`, `2.8.1`, `2.8.2`, `2.9.0`, `2.9.1`, `2.9.2`

Future releases might support more Lift and/or Scala versions.

As a Lift application developer, you will be familiar with the requirement that
Lift applications require a `WEB-INF/web.xml` to be included within them in
order to define a Lift filter. With Escalante, this is not needed any more.

In the absence of a `WEB-INF/web.xml`, Escalante adds one to the deployment
archive. If the user application does contain a `WEB-INF/web.xml`, it uses the
one already shipped, so this means that the if the user provides a web
descriptor, it must contain the Lift filter definition.

## Standard Lift application support

Escalante can also deploy standard Lift applications that have not been
optimised. So, if you are already have packaged Lift applications, you can
deploy them without problems into Escalante. Bear in mind though that when
deploying such applications into Escalante, they must ship all the
dependencies required.

## Integration with application server services

Lift applications, whether optimised or not, can integrate with services
provided by the application server. For example, integration with the default
persistence datasource:

### Connecting to datasources

Lift applications can connect very easily to the default persistence
datasource. To do so, Lift's bootable class, normally located in
`bootstrap.liftweb.Boot` needs to be modified to define the default database
connection identifier to point to the JNDI name of the example datasource:

    DefaultConnectionIdentifier.jndiName = "java:jboss/datasources/ExampleDS"

# Quickstarts

To help you get started with development and deployment of Scala applications
for Escalante, several quickstarts have been developed to help the users.
Currently these quickstarts come with a Maven pom file used to build and
deploy them (SBT files will be provided very shortly):

1. [Escalante Lift Hello World quickstart](https://github.com/escalante/escalante-quickstart/helloworld-lift):
This quickstart shows how to deploy a basic, optimised Lift application in
Escalante.

2. [Escalante Lift Persistence quickstart](https://github.com/escalante/escalante-quickstart/persistence-lift):
This examples shows how to deploy a more complex application, based on Lift's
Mapper ORM extensions, in an optimised way to Escalante. This example shows
how to interact with the app servers's default datasource.

3. [Standard Lift Hello World quickstart](https://github.com/escalante/escalante-quickstart/standard-lift):
This quickstart demonstrates that you can deploy standard, non-optimised, Lift
applications to Escalante.