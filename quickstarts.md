---
title: Documentation
layout: default
toc: true
---

<div class="page-header">
<h1>Quickstarts</h1>
</div>

#{page.table_of_contents}

To help you get started with development and deployment of Scala applications
for Escalante, several quickstarts have been developed to help the users.
Currently these quickstarts come with a Maven pom file used to build and
deploy them (SBT files will be provided very shortly):

## Escalante Lift Hello World

This [quickstart](https://github.com/escalante/escalante-quickstart/tree/master/helloworld-lift)
shows how to deploy a basic, optimised Lift application in Escalante.

## Escalante Lift Persistence

This [examples](https://github.com/escalante/escalante-quickstart/tree/master/persistence-lift)
shows how to deploy a more complex application, based on Lift's Mapper ORM
extensions, in an optimised way to Escalante. This example shows how to
interact with the app servers's default datasource.

## Standard Lift Hello World

This [quickstart](https://github.com/escalante/escalante-quickstart/tree/master/standard-helloworld-lift)
demonstrates that you can deploy standard, non-optimised, Lift applications
to Escalante.