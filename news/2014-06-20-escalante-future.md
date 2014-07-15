---
title: Escalante's Future
author: Galder Zamarreño
layout: news
display_tag_cloud: true
tags: [ ]
---

Escalante started out as a way to bring in the capabilities and functionality
within a managed environment like JBoss Application Server 7 or Wildfly to 
Scala developers. Among the existing frameworks, Lift has tried to take the 
most advantage of this combination, so it was an easy place to start at.

Based on our experience of pitching Escalante to Scala developers, it has 
become clear that managed environments are considered too heavyweight, 
particularly when it comes to ease of development, and hence most Scala 
developers building concurrent applications are trying to stay away from them
choosing instead to build Akka or Play applications. In other words, Scala
developers are focused on building solid, statically typed, applications with 
the least amount of resistance.

Around the same time as we were working on Escalante 0.3.0 a couple of 
interesting things happened:

* First, the [Reactive Manifesto](http://www.reactivemanifesto.org/) came out 
(July 2013), pretty much laying the foundations for the type of applications 
that Scala developers have been trying to build.
   
* Secondly, [Vert.x](http://vertx.io/) founder and lead developer, Tim Fox joined Red Hat 
(January 2013). Vert.x is an polyglot, event-driven application development 
framework for the Java Virtual Machine which promotes development of reactive 
applications.

Right until mid-2013, [Vert.x's Scala language extension](https://github.com/vert-x/mod-lang-scala) 
was lagging behind other languages such as Java or Groovy. Tim was very keen 
to get this effort moving and I started contributing to Vert.x's Scala module, 
eventually becoming the lead of it.
 
The amount of feedback received on Vert.x Scala language extension and the community involvement
in the project has surpassed anything Escalante had, demonstrating even more 
where the focus is for Scala developers. They want to easily build multi-node 
reactive applications that are scalable and fault tolerant. Managed containers, 
in spite of providing a lot of base middleware and come with good monitoring 
tools, are rooted in the single node vision and their ease of development is 
lagging behind. 

So, with all this in mind, we have come to the conclusion to not develop 
Escalante any further. For those Lift users that have tried Escalante, there
are other containers out there which should fit your use case. 

Thanks to everyone who has been involved in Escalante!
