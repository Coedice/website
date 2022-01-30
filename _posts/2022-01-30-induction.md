---
layout: post
title: Proof by Induction
---
Proof by induction allows us to prove things about infinite series. It is a necessary skill for computer programmers to prove that some code or algorithm does what it is supposed to do.

I will describe how it works through the use of an analogy. Imagine a line of dominos that we want to knock over. We need to know two things about the line:
1. That each domino is close enough to knock over the next domino,
2. That we are able to knock over the first domino.
   If we do these two things we have proven that every domino in the line will be knocked over, even if the domino line is infinitely long.

In mathematical induction terms, checking that each domino is close enough to the next to knock it down is called the inductive hypothesis, and this means that **if** a statement is true in one case, then it is true for the following case.
Knocking over the first domino is called the basis or base step, and this means proving that the first statement is true.

Here’s an example:
We want to prove that the sum of every positive integer from $$\begin{aligned}1\end{aligned}$$ to some number $$\begin{aligned}x\end{aligned}$$ is equal to $$\begin{aligned}x(x+1)/2\end{aligned}$$
$$\begin{aligned}1 + 2 + 3 + … + x = x(x+1)/2\end{aligned}$$
We will do that by showing that each domino is close enough to the next domino to knock it over (that is, the inductive hypothesis),
We will assume that $$\begin{aligned}1 + 2 + 3 + …\end{aligned}$$ all the way to $$\begin{aligned}k\end{aligned}$$ equals $$\begin{aligned}k(k+1)/2$$. If this is true, this means domino $$\begin{aligned}k\end{aligned}$$ has fallen.

We will use this assumption to see if domino $$\begin{aligned}k\end{aligned}$$ is close enough to domino $$\begin{aligned}k + 1\end{aligned}$$ to knock it down.
$$\begin{aligned}1 + 2 + 3 + … + k + (k + 1)\end{aligned}$$
$$\begin{aligned}= k(k + 1)/2 + k+1\end{aligned}$$			(using the inductive hypothesis)
$$\begin{aligned}=(k(k + 1) + 2k + 2)/2\end{aligned}$$		(simplifying)
$$\begin{aligned}=(k(k + 1) + 2(k + 1))/2\end{aligned}$$		(simplifying)
$$\begin{aligned}=(k + 2)(k + 1)/2\end{aligned}$$			(simplifying)
This matches what we are trying to prove for domino $$\begin{aligned}k+1$$, because it matches our original statement, but where we have substituted $$\begin{aligned}x\end{aligned}$$ for $$\begin{aligned}k+1$$.
Because we did this all using a general domino $$\begin{aligned}k$$, we have really proved that for every domino, it is close enough to the next domino to knock it down.

Next we want to knock over the first domino (which is the basis step):
$$\begin{aligned}1 = 1(1+1)/2\end{aligned}$$
$$\begin{aligned}1 = 1\end{aligned}$$
That is clearly true.

We have knocked over the first domino, and we know all the dominos are close enough to each other to knock down the whole line, so we know that they will all fall.
And we have proven by the principle of mathematical induction that the sum of every positive integer from $$\begin{aligned}1\end{aligned}$$ to some number $$\begin{aligned}x\end{aligned}$$ is equal to $$\begin{aligned}x(x+1)/2$$.