---
title: Quickstarts
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

### Escalante Lift Hello World

This [quickstart](https://github.com/escalante/escalante-quickstart/tree/0.2.0/helloworld-lift)
shows how to deploy a basic, optimised Lift application in Escalante.

### Escalante Lift Persistence

This [example](https://github.com/escalante/escalante-quickstart/tree/0.2.0/persistence-lift)
shows how to deploy a more complex application, based on Lift's Mapper ORM
extensions, in an optimised way to Escalante. This example shows how to
interact with the app servers's default datasource.

### Escalante Lift JPA Library Persistence

This [example](https://github.com/escalante/escalante-quickstart/tree/0.2.0/library-lift-jpa)
shows how to deploy and run an application that tracks books and authors in a
library, using Lift's JPA integration. This application interacts with
Escalante's JPA infrastructure, based on Hibernate, which is used to persist
these books and author instances.

### Standard Lift Hello World

This [quickstart](https://github.com/escalante/escalante-quickstart/tree/0.2.0/standard-helloworld-lift)
demonstrates that you can deploy standard, non-optimised, Lift applications
to Escalante.

### Scaladin Hello World

This [example](https://github.com/escalante/escalante-quickstart/tree/0.2.0/helloworld-scaladin)
demonstrates a simple, Hello World style, Scaladin web application deployment
on top of Escalante. Scaladin is a wrapper that makes it easier to use
<a href="http://vaadin.com">Vaadin Framework</a> with Scala programming
language. To find out more about check <a href="/faq/#vaadin">
Vaadin/Scaladin FAQ section</a>.

## JBoss Developer Studio for Scala developers

As well as these quickstars, users benefit from ease of development
and deployment of Scala applications for Escalante thanks to JBoss Developer
Studio. To be able to write Scala applications in JBoss Developer Studio, the
following steps are required:

<ol>
   <li>Install JBoss Developer Studio following <a
   href="https://openshift.redhat.com/community/page/install-jboss-developer-studio">
   these instructions</a>.</li>

   <li>Install <a href="http://scala-ide.org/docs/user/gettingstarted.html">
   Scala IDE</a>. The version to install depends on the Scala version you'll
   be using:
      <ul>
         <li>For Scala 2.9.x applications, install Scala IDE via the <a
         href="http://download.scala-ide.org/releases-29/stable/site">
         update site for Scala 2.9.x</a></li>

         <li>For Scala 2.8.x applications, install Scala IDE via the <a
         href="http://download.scala-ide.org/releases-28/stable/site">
         update site for Scala 2.8.x</a></li>
      </ul>
      <div class="alert">
         <button type="button" class="close" data-dismiss="alert">×</button>
         <strong>Warning!</strong>
         Unfortunately a single JBoss Developer Studio, or Eclipse,
         installation can be installed with both versions of Scala IDE, so if
         you're going to deploy Scala applications for different Scala
         versions, you'll have to maintain multiple JBoss Developer Studio
         copies, each installed with a different Scala IDE version.
      </div>
   </li>

   <li>Install <a href="http://alchim31.free.fr/m2e-scala/">m2eclipse-scala</a>
   via this <a href="http://alchim31.free.fr/m2e-scala/update-site">
   update site</a>.
   <div class="alert alert-danger">
      <button type="button" class="close" data-dismiss="alert-danger">×</button>
      <strong>Check version!</strong> Installing version <code>0.4.2</code>
      or higher is strongly recommended to avoid facing <a
      href="https://issues.jboss.org/browse/JBDS-2259">JBDS-2259</a>
      when running either the
      <a href="#standard_lift_hello_world">Standard Lift Hello World</a> or
      <a href="#scaladin_hello_world">Scaladin Hello World</a> quickstarts. If
      you're stuck with an older version, <a
      href="https://issues.jboss.org/browse/JBDS-2259">JBDS-2259</a>
      contains a valid, proven and tested workaround.
   </div>
   </li>

</ol>

Once all these steps have been completed, your JBoss Developer Studio copy
should be ready to import and enhance the quickstarts above. Just remember to
check which Scala version each quickstart has been developed for, and depending
on that select which JBoss Developer Studio version you should import it in.
