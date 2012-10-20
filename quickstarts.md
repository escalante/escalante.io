---
title: Documentation
layout: default
toc: true
---

<div class="page-header">
<h1>Quickstarts</h1>
</div>

#{page.table_of_contents}

## Quickstarts

To help you get started with development and deployment of Scala applications
for Escalante, several quickstarts have been developed to help the users.
Currently these quickstarts come with a Maven pom file used to build and
deploy them (SBT files will be provided very shortly):

1. **Escalante Lift Hello World**

    This [quickstart](https://github.com/escalante/escalante-quickstart/tree/master/helloworld-lift)
    shows how to deploy a basic, optimised Lift application in Escalante.

2. **Escalante Lift Persistence**

    This [examples](https://github.com/escalante/escalante-quickstart/tree/master/persistence-lift)
    shows how to deploy a more complex application, based on Lift's Mapper ORM
    extensions, in an optimised way to Escalante. This example shows how to
    interact with the app servers's default datasource.

3. **Standard Lift Hello World**

    This [quickstart](https://github.com/escalante/escalante-quickstart/tree/master/standard-helloworld-lift)
    demonstrates that you can deploy standard, non-optimised, Lift applications
    to Escalante.

## JBoss Developer Studio for Scala developers

As well as these quickstars, users benefit from ease of development
and deployment of Scala applications for Escalante thanks to JBoss Developer
Studio. To be able to write Scala applications in JBoss Developer Studio, the
following steps are required:

1. Install JBoss Developer Studio following
[these instructions](https://openshift.redhat.com/community/page/install-jboss-developer-studio).
2. Install `m2eclipse-scala` via this
[update site](http://alchim31.free.fr/m2e-scala/update-site).
3. Next, you need to install [Scala IDE](http://scala-ide.org/docs/user/gettingstarted.html),
but the version to install depends on the Scala version you'll be using:

    For Scala 2.9.x applications, install Scala IDE via the
    [update site for Scala 2.9.x](http://download.scala-ide.org/releases-29/stable/site)

    For Scala 2.8.x applications, install Scala IDE via the
    [update site for Scala 2.8.x](http://download.scala-ide.org/releases-28/stable/site)

<div class="alert">
  <button type="button" class="close" data-dismiss="alert">×</button>
  <strong>Warning!</strong>
  Unfortunately a single JBoss Developer Studio, or Eclipse, installation can be
  installed with both versions of Scala IDE, so if you're going to deploy Scala
  applications for different Scala versions, you'll have to maintain multiple
  JBoss Developer Studio copies, each installed with a different Scala IDE
  version.
</div>

Once all these steps have been completed, your JBoss Developer Studio copy
should be ready to import and enhance the quickstarts above. Just remember to
check which Scala version each quickstart has been developed for, and depending
on that select which JBoss Developer Studio version you should import it in.
