---
title: Deploying Lift applications on OpenShift
author: Galder Zamarreño
layout: news
display_tag_cloud: true
tags: [ lift, openshift ]
---

Having released the [first milestone](/news/2012/08/31/announcing-0-1-0/) of
[Lift](http://liftweb.net/)'s integration into Escalante a short while back,
we turned our heads to getting more people to deploying Lift applications
on top of Escalante.

<div class="alert alert-success">
<strong>What is Lift?</strong> If you've never heard of Lift, or you don't know
what Lift-based web applications can offer you, please check
<a href="/faq/#lift">Lift's FAQ section</a>.
</div>

So, I'm very proud to announce that you can now run Lift applications on [Red
Hat's OpenShift cloud](https://openshift.redhat.com/app/). OpenShift is
Red Hat's free, auto-scaling Platform as a Service (PaaS) for applications.
As an application platform in the cloud, OpenShift manages the stack so you
can focus on your code.

For Lift users this means that you can now deploy your Lift applications
on OpenShift, and let it manage the stack for you which behind the scenes will
run on top of Escalante.

## Deploying your first Lift app on OpenShift

1. First of all, [sign up](https://openshift.redhat.com/app/account/new) for
OpenShift and follow the instructions in the
[Getting Started guide](https://openshift.redhat.com/community/get-started) to
set up SSH keys, command line tools...etc.

2. Once you've signed up, log in, go to [My
Applications](https://openshift.redhat.com/app/console) and create a brand
new <a class="btn btn-info"
href="https://openshift.redhat.com/app/console/application_types/cart!jbosseap-6.0">
JBoss Enterprise Application Platform 6.0</a> application.

3. Give the application a name, for example `escalante`, and click on
`Create Application` button.

4. Once you've installed Git locally, clone the application following the
instructions on OpenShift, i.e:

        $ git clone \
           ssh://[USER_ID]@escalante-[YOUR_DOMAIN].rhcloud.com/~/git/escalante.git/
        $ cd escalante/

5. Get rid of the default sample application and commit it:

         $ git rm -r pom.xml src
         $ git commit -m "Remove default app"

6. From the root of the local copy of the application, merge in the modules
and server configuration needed to run Escalante on top of JBoss EAP. The
merged files will be stored under the `.openshift` folder:

        $ git remote add escalante -m master \
            git://github.com/escalante/escalante-openshift.git
        $ git pull -s recursive -X theirs escalante master

7. To help users get started with Escalante, we've developed some quickstarts
out of which we'll be demostrating how Hello World Lift application runs on
OpenShift. So, merge in the Escalante quickstarts:

        $ git remote add quickstart -m master \
            git://github.com/escalante/escalante-quickstart.git
        $ git pull -s recursive -X theirs quickstart master

8. You now have all you need to run the [Hello World Lift Escalante
quickstart](/quickstarts) on OpenShift. To run it, you need to push the
changes in your local repository. By pushing the changes, OpenShift will
build the application and deploy it, so might take a little while. Execute:

        $ git push

9. Once the push finishes access the application via:
[http://escalante-[YOUR_DOMAIN].rhcloud.com/
](http://escalante-[YOUR_DOMAIN].rhcloud.com/) and you should see something
like this:

     <img src="/images/say-hello-world-escalante.png" class="thumbnail" />

<div class="alert alert-info">
<strong>Run alternative quickstarts: </strong> The quickstarts repository you
merged in contains several applications that can run on top of Escalante.
Check the <a href="/quickstarts">Escalante Quickstarts documentation</a>
for detailed information on these examples. You can alternatively enable other
applications, such as the `persistence-lift` quickstart. To do so, modify the
root `pom.xml` file and select which quickstart to build:
<img src="/images/select-different-lift-example-openshift.png" class="thumbnail" />
</div>

## Future Work

Deploying Lift applications to OpenShift this way is a bit arduous, which is
why we're also working on producing an OpenShift cartdridge designed
specifically for Lift applications that can run on top of Escalante, which
would simplify the process significantly. Watch this space!

## Get in touch!

If you have any questions, issues, or other feedback about Escalante, you
can find us on [#escalante on freenode](/community/#irc)
or our [public forums](/community/#user_forum).
