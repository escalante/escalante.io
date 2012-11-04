---
title: FAQ
layout: default
toc: true
---

<div class="page-header">
<h1>FAQ</h1>
</div>

#{page.table_of_contents}

## Escalante

### What is Escalante ?

Escalante is a [Scala](http://scalan-lang.org) application server, based on
the popular JBoss Application Server 7. Escalante aims to provide an
environment for deploying and running Scala applications that is easier to use
and more efficient than existing solutions.

## Scala

### What is Scala ?

TODO

### Why should I develop in Scala?

TODO

## Lift

### What is Lift ?

[Lift](http://liftweb.net/) is one of the most mature web application
development frameworks written for the Scala programming language. It has been
designed to build sophisticated, rich and vibrant web applications using
Scala, a hybrid programming language incorporating both functional and object
oriented capabilities.

### Why develop web applications using Lift ?

Lift has been particularly developed for those web developers who want to
build highly interactive, real-time web applications that push data to the
browser when needed, without users having to send requests to the server. Lift
uses technologies such as
<a href="http://en.wikipedia.org/wiki/Comet_(programming)">Comet</a> or
<a href="http://en.wikipedia.org/wiki/Ajax_(programming)">Ajax</a>, to be
able to build this type of applications.

**Security** has been a major design goal for Lift creators, and this is
reflected in the fact that Lift web applications are protected against [SQL
injection](http://en.wikipedia.org/wiki/SQL_injection), [CSRF (cross-site
request forgery)](http://en.wikipedia.org/wiki/Cross-site_request_forgery),
[XSS (cross-site scripting)](http://en.wikipedia.org/wiki/Cross-site_scripting)
, and many other attacks without web application developers needing to do any
extra configuration or work.

Since Lift is built on top of Scala, it enables development of web
applications that are very **concise**, and Lift itself comes with a lot of
utilities that help web developers build applications with less code.

Based on an architecture designed around well-formed HTML5 or XHTML
template views and snippets that get injected into the templates, it offers
a **clear separation** between the work done by web UI designers
and web developers. This guarantees that designers won't introduce problems as
a result of modifying web framework specific code within template.

[FourSquare](https://foursquare.com/) or [Montreux Jazz
Festival](http://metamedia.epfl.ch/page-80142-en.html) are examples of
companies that have developed Lift based web applications. These applications
are subject to enormous traffic spikes, and are living proof that Lift
applications are scalable and resilient.

To find out more about developing Lift applications, [Lift In
Action book](http://www.manning.com/perrett/) offers a comprehensive,
detailed guide to writing Lift web applications following best practices.

### Why deploy Lift applications on Escalante ?

Escalante allows you to deploy [Lift web applications](http://liftweb.net/)
in a way that optimises the size of the deployment and the memory consumption
at runtime, both of which are of paramount importance. Escalante does however
still allow you to deploy standard Lift applications. For more info, check
the [documentation](/documentation).

## Vaadin

### What is Vaadin ?

Vaadin is a server-side java java web application framework. The UI is built
on the server-side by composing components, using any JVM language
(no XML needed). On the client-side, Vaadin uses GWT to render the UI in
the browser as pure HTML, CSS and javascript. To find out more about
Vaadin, visit <a href="https://vaadin.com/faq">their FAQ</a>.

### What is Scaladin ?

Scaladin is a wrapper that makes it
easier to use <a href="http://vaadin.com">Vaadin Framework</a> with Scala
programming language.

## IDEs

### What IDE should I use to develop applications for Escalante ?

TODO

