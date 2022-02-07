---
layout: post
title: Data's Tragedy of the Commons
tags: programming compsci
---
Memory and storage virtualisation have created a problem in a world where computers have many processes competing for
limited hardware resources. Since so many users don't know (or are unable to know) how to check which processes are
running on their computers and what resources they are using, developers and companies are not sufficiently incentivised
to reduce their use of these resources.

## What does "The Tragedy of the Commons" Mean?
Here is an example: a group of fisherman find a lake with fish in it. They know that if each of them only fished as much
as they needed, there would always be plenty of fish. However, it is in each fisherman's interest to fish more, since
they could sell the extra fish and make more money. Each of the fishermen begins to overfish, and before long, there are
no more fish in the lake.

The lake in this metaphor is a *commons*, a resource that does not belong to anyone, but that can benefit many parties.
A tragedy of the commons is the abuse of this commons based on the uncoordinated self-interest of each party.

## Memory and Storage
Many popular apps like Facebook are large memory hogs because they face no repercussions for taking up an excessive amount
of resources. In fact, by taking up all this memory, they can run slightly faster. Facebook doesn't care that these resources are are
then taken away from other processes, Facebook only needs to make sure Facebook is fast.

This is why we have a tragedy of the commons in memory and storage. With so many companies cluttering devices with their
own data, this shared commons is degraded.

## What to Do about It
I can think of two solutions two this problem:

Include a section on app stores about memory use reasonableness. This names and shames apps that are using too much
memory than makes sense for it to use for what it does.

Reject app submissions to app stores if their memory use isn't reasonable. This may seem heavy-handed, but app stores
often reject app submissions because they don't follow the expected design language of the platform. They do
that in order to increase users' experience using their device. I believe that restricting app submissions for memory hogs
would also improve the user experience, and so for the same reason, should be added to app store submissions tests.