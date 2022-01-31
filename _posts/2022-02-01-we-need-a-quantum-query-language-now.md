---
layout: post
title: We Need a Quantum Query Language Now
---
While quantum computers are still out of arms reach for practical applications, this is an important time to establish a standard format for querying quantum computers over the internet to get classical output. I will call this language Quantum Query Language (QQL).

# The Future of Quantum Hardware
At the time of writing, the state of quantum computation is a small number of quantum computers which are not practically useful, due to fast decoherence and other significant engineering challenges.
There is even doubt from some academics that quantum computers will ever be practically useful, given the magnitude of the obstacles in the way.
Assuming they do become viable, we can be sure that it would take a very long time before (or if) they move from large and expensive devices in warehouses, to co-processors in every laptop and phone.

# Why Now?
Historically, more successful (i.e. ubiquitously supported) open standards have had in common that they were standardised before there was much practical need for them.
It is much easier to keep uniformity when you have it, and modify the standard when needed, than to start off with many competing standards and try to get [uniformity by outcompeting other standards](https://xkcd.com/927/).

# A Case Study in Late Standardisation
E. F. Codd invented the concept of relational databases in 1970, and in 1976 the Multics Relational Data Store was the first RDBMS to be sold. Oracle came next in 1979, after which there was a flurry of new RDBMS options, including Ingres, IBM BS12, and 4D, bringing us to 1987, the same year ANSI standardised the first version of SQL, SQL-86.

Can we be surprised that SQL has so many flavours when it took so long to standardise? If developers had already learned a single, standard SQL, no RDBMS developer would even try to diverge from the standard, since no back-end devs would want to learn a new syntax just for a single vendor.

SQL does not **need** interoperability to function like other standards such as HTML do, but the lack of interoperability is a pain for many developers that will likely never be fixed, at least until/if some other database paradigm takes over from relational databases.

# QQL Should Not Repeat SQL's Mistakes
QQL will share the same attribute as SQL in not requiring interoperability in order to technically function, but if standardised soon enough, QQL would become the ubiquitous standard for quantum computation delegation that SQL could have been for relational database interaction.
