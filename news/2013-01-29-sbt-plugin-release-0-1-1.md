---
title: Escalante SBT plugin 0.1.1 out now!
author: Galder Zamarreño
sbt_version: 0.1.1
layout: news
display_tag_cloud: true
tags: [ release, sbt ]
---

We've just released version [`0.1.1`](https://repository.jboss.org/nexus/content/groups/public/io/escalante/sbt/sbt-escalante_2.9.2_0.12/0.1.1/)
of the Escalante SBT plugin.

## What's in this release?

The primary reason for the release is that some users could encounter an
[SBT issue](https://github.com/sbt/sbt/issues/647) that was causing the wrong
dependency to be resolved, and since this dependency didn't exist at all,
that would render the plugin unusable. This new SBT plugin version gets around
the issue adding a explicit dependency on the library that caused issues.
On top of that, a [minor
issue](https://github.com/escalante/sbt-escalante/issues/9) with the location
of the JBoss Home folder has been fixed.

Many thanks to [**Ali Salim Rashid**](https://github.com/arashi01) for
spotting and fixing both issues!! :))

## How to use it?

To use this new version, update the SBT plugin version to be used in your
project, i.e.

    addSbtPlugin("io.escalante.sbt" % "sbt-escalante" % "0.1.1")

Check the [Escalante SBT Git repo](https://github.com/escalante/sbt-escalante)
to find out out more about the Escalante SBT plugin.

## Get In Touch

If you have any questions, issues, or other feedback about Escalante, you
can find us on [#escalante on freenode](/community/#irc)
or our [public forums](/community/#user_forum).

## Twitter

If you're interested in anything Escalante related, make sure you follow
[@escalanteio](https://twitter.com/escalanteio) to find out first :). If you
want to make any comments on Twitter, make sure you use the
[`#escalante`](https://twitter.com/search/?q=%23escalante&src=hash)
hash tag.
