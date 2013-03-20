---
title: Escalante SBT plugin 0.1.2 out now!
author: Galder Zamarreño
sbt_version: 0.1.2
layout: news
display_tag_cloud: true
tags: [ release, sbt ]
---

We've just released version [`0.1.2`](https://repository.jboss.org/nexus/content/groups/public/io/escalante/sbt/sbt-escalante_2.9.2_0.12/0.1.2/)
of the Escalante SBT plugin.

## What's in this release?

Extra dependencies other than Lift and Scala ones are now included in
`WEB-INF/lib` directory within the generated Lift war archive. Once again
thansk to [**Ali Salim Rashid**](https://github.com/arashi01) for spotting
and fixing [this issue](https://github.com/escalante/sbt-escalante/issues/12)!! :))

## How to use it?

To use this new version, update the SBT plugin version to be used in your
project, i.e.

    addSbtPlugin("io.escalante.sbt" % "sbt-escalante" % "0.1.2")

Check the [Escalante SBT Git repo](https://github.com/escalante/sbt-escalante)
to find out out more about the Escalante SBT plugin.

## Warning

Seems like [the wrong dependency resolution issue](https://github.com/sbt/sbt/issues/647)
has resurfaced as seen by [this user forum
post](http://stackoverflow.com/questions/15351171/escalante-sbt-plugin-does-not-find-org-jboss-shrinkwrap-descriptorsshrinkwrap-d).
It appears that a workaround has been found, but we're waiting for full
confirmation before suggesting users to configure the Escalante SBT plugin
that way.

Once confirmed, README files and quickstarts will be updated to show the
recommended way to configure the plugin.

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
