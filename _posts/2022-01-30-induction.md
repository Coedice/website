---
layout: post
title: Proof by Induction
use_math: true
tags: compsci
icon_alt: Dominos in a line, beginning to be knocked over
doi: 10.5281/zenodo.8325588
---
Proof by induction allows us to prove things about infinite series. It is a necessary skill for computer programmers to prove that some code or algorithm does what it is supposed to do.

I will describe how it works through the use of an analogy. Imagine a line of dominos that we want to knock over. We need to know two things about the line:

1. That each domino is close enough to knock over the next domino,
2. That we are able to knock over the first domino.

If we do these two things we have proven that every domino in the line will be knocked over, even if the domino line is infinitely long.

In mathematical induction terms, checking that each domino is close enough to the next to knock it down is called the inductive hypothesis, and this means that **if** a statement is true in one case, then it is true for the following case.
Knocking over the first domino is called the basis or base step, and this means proving that the first statement is true.

Here’s an example:
We want to prove that the sum of every positive integer from $$1$$ to some number $$x, x \in \mathbb{Z}^{+}$$ is equal to $$\frac{x(x+1)}{2}$$.

$$1 + 2 + 3 + \ldots + x = \frac{x(x+1)}{2}$$

We will do that by showing that each domino is close enough to the next domino to knock it over (that is, the inductive hypothesis),
We will assume that $$1 + 2 + 3 + \ldots + k = \frac{k(k+1)}{2}$$. If this is true, this means domino $$k$$ has fallen.

We will use this assumption to see if domino $$k$$ is close enough to domino $$k + 1$$ to knock it down.

$$1 + 2 + 3 + \ldots + k + (k + 1)$$\
$$= \frac{k(k + 1)}{2} + (k + 1)\quad$$ (using the inductive hypothesis)\
$$=\frac{k(k + 1) + 2(k + 1)}{2}\quad$$ (simplifying)\
$$=\frac{(k + 1)(k + 2)}{2}\quad$$ (simplifying)

This matches what we are trying to prove for domino $$k+1$$, because it matches the statement we would like to prove ($$1 + 2 + 3 + \ldots + x = \frac{x(x+1)}{2}$$), but where we have substituted $$x$$ for $$k+1$$.
Because we did this all using a general domino $$k$$, we have really proved that for every domino, it is close enough to the next domino to knock it down.

Next we want to knock over the first domino (which is the basis step):

$$1 + 2 + 3 + \ldots + x = \frac{x(x+1)}{2}$$\
$$1 = \frac{1(1+1)}{2}\quad$$ (substituting $$x = 1$$)\
$$1 = 1\quad$$ (simplifying)

That is clearly true.

We have knocked over the first domino, and we know all the dominos are close enough to each other to knock down the whole line, so we know that they will all fall.
And we have proven by the principle of mathematical induction that the sum of every positive integer from $$1$$ to some number $$x$$ is equal to $$\frac{x(x+1)}{2}$$.
