---
layout: default
title: Source
toc : true
---

<div class="page-header">
<h1>Contribution Guide</h1>
</div>

#{page.table_of_contents}

In this chapter we quickly walk through the basics of contributing to
Escalante, including getting hold of the source code, building it and
opening it from your favourite IDE, and we also explain more advanced
concepts related to submitting fixes or integrating them into the
main repository.

## Pre-requisites
* Java 1.6: Escalante is baselined on Java 6.0, and is built and tested using
Sun Java 6.0.
* Maven 3: The Escalante build uses Maven, and we recommend using Maven 3.
* Git (optional):	The Escalante sources are stored in Git. If you don't wish
to install Git, you can download source bundles.

## Source Control

Information on the location the Escalante code can be found
[here](/development/source).

## Scala

This section focuses on the use of
[Scala programming language](http://www.scala-lang.org/) within Escalante.

**Note:** Some of the recommendations in this section have been adapted from
[Twitter's Effective Scala](http://twitter.github.com/effectivescala) document.

### Introduction

Escalante source code should be written in Scala unless a programming
construct is needed which is not present in Scala itself, i.e. annotations.

While highly effective, Scala is also a large language, and our experiences
have taught us to practice great care in its application.

Scala provides many tools that enable succinct expression. Less typing is
less reading, and less reading is often faster reading, and thus brevity
enhances clarity. However brevity is a blunt tool that can also deliver
the opposite effect: **After correctness, think always of the reader**.

Above all, program in Scala. You are not writing Java, nor Haskell,
nor Python; a Scala program is unlike one written in any of these. In order
to use the language effectively, you must phrase your problems in its terms.
There’s no use coercing a Java program into Scala, for it will be inferior in
most ways to its original.

If you're new to Scala, these are some best resources for learning Scala are:

* [Official Scala Tutorials](http://docs.scala-lang.org/tutorials/)
* [Twitter's Scala School](http://twitter.github.com/scala_school/)
* [Learning Scala in Small Bites](http://matt.might.net/articles/learning-scala-in-small-bites/)
* [Learning Scala](http://www.scala-lang.org/node/1305)
* [Programming in Scala, by Odersky, Spoon, and Venners](http://www.artima.com/shop/programming_in_scala_2ed) (Book)
* [Scala for the Impatient, by Horstmann](http://horstmann.com/scala/) (Book)

This is a living document that will change to reflect our current
“best practices,” but its core ideas are unlikely to change:
Always **favor readability**; write generic code but not at the expensive of
clarity; take advantage of simple language features that afford great power
but **avoid the esoteric** ones (especially in the type system).
Above all, **be always aware of the trade offs you make**. A sophisticated
language requires a complex implementation, and complexity begets complexity:
of reasoning, of semantics, of interaction between features, and of the
understanding of your collaborators. Thus complexity is the tax of
sophistication — you must always ensure that its utility exceeds its cost.

### Formatting

Escalante adheres to the
[Scala style guide](http://docs.scala-lang.org/style/overview.html) with the
addition of these rules:

* Preferably, stick to lines of 80 characters maximum, but if it needs to be
exceeded, please avoid lines greater than 100 columns, otherwise reading or
reviewing code in sites, such as [GitHub](http://github.com), becomes a
problem.

* Use short names for small scopes: `i`s, `j`s and `k`s are all but expected
in loops.

* Use longer names for larger scopes: External APIs should have longer and
explanatory names that confer meaning. `Future.collect` not `Future.all`.

* Avoid esoteric abbreviations, common ones are Ok. Everyone knows `ok`,
`err` or `defn` whereas `sfri` is not so common.

* Don't rebind names for different uses. Use `val`s.

* Avoid using overloading reserved names. Use active names for operations
with side effects user.activate() not user.setActive()

* Use descriptive names for methods that return values `src.isDefined` not
`src.defined`.

* Don't prefix getters with get. As per the previous rule, it's redundant:
`site.count` not `site.getCount`

* Use braces when importing several names from a package:
> `import io.escalante.modules.{JBossModule, JBossModulesRepository}`

* Use wildcards when more than six names are imported (Don't apply this
blindly: some packages export too many names). e.g.:
> `import io.escalante.modules._`

* When using collections, qualify names by importing
`scala.collection.immutable` and/or `scala.collection.mutable`. Mutable and
immutable collections have dual names. Qualifiying the names makes is obvious
to the reader which variant is being used (e.g. "immutable.Map").

* Do not use relative imports from other packages

* Put imports at the top of the file. The reader can refer to all imports
in one place.

## Maven

Escalante uses Maven as build system. To find detailed instructions on how to
build Escalante, including the project structure, please check
[the build instructions](https://github.com/escalante/escalante/blob/master/README.md)
in the Escalante source code.

## IDE Setup

The majority of Escalante's source currently requires Scala 2.8, but there is
one integration test project that requires Scala 2.9 in order to test
deployments with this Scala version.

Currently, the only IDE that supports multiple Scala versions within the same
workspace is [IntelliJ IDEA](http://www.jetbrains.com/idea/). Unfortunately,
to compile Scala code, [Eclipse](http://www.eclipse.org/)
requires [Scala IDE](http://scala-ide.org/) which can only be installed for
either Scala 2.8 or 2.9. So, if you're an Eclipse user, you'll need two
Scala installations to develop Escalante: one to compile Scala 2.8 source
code, and another to compile Scala 2.9 source code.

With this in mind, here are the set up instructions for each of the IDEs.

### IntelliJ IDEA

TODO

### Eclipse

TODO

## Testing

TODO

## Continuous Integration

TODO

## Logging

## Contribution Style Requirements

Spelling, license headers, check-in comments

## Git

TODO

### Occasional Contributor (merge with Committing your work)

TODO

### Fequent Contributor

TODO

### Project Admin

TODO

## Contributor License Agreement

TODO

## Publishing Snapshots

TODO

## Writing Documentation and FAQs

TODO
