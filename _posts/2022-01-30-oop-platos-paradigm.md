---
layout: post
title: Object-Oriented Programming - Plato’s Paradigm
tags: programming compsci
---
Plato’s Theory of Forms provides a great lens for thinking about Object-Oriented Programming, and I believe using this philosophical lens results in making better decisions when writing OOP code.

In this post I will create an analogy between OOP and the theory of Forms. I believe that understanding their similarity helps to write better OOP code.

## What Is the Theory of Forms?
The theory of Forms is a philosophical idea from Plato, which states that observable objects are just imitations of perfect, unchanging, incorruptible, non-physical essences, or “Forms.” Plato believed these Forms were absolutely real, but that you could not directly interact with them.

This post is not intended to support this worldview, but to draw a comparison with it to OOP. This post is also not intended to be a complete and perfect explanation of the theory of Forms. The purpose of this post is to help you write better OOP code with the help of this analogy.

## What Is the Analogy?
Forms are analogous to classes. The qualities of Forms are that they are unchanging, incorruptible, and non-physical, which are all true of classes, since classes do not have state, and so cannot be changed or corrupted, and they are essentially non-physical since they can’t be interacted with directly.

The physical objects in the theory of Forms are analogous to code objects, as they both mimic their idealised version (their Form or class). Since code objects do have state, they are changeable, they are also “physical”, since you can directly interacted with them.

## What about Subclasses?
Subclasses can be thought of as relating to a Form that is more specific than another Form.
For example, here are some descriptions for the Forms of chairs and stools:
- Chair: “A device for sitting, with a platform to sit on, and some positive integer number of legs.“
- Stool: “A device for sitting, with a platform to sit on, and one leg.“

In the OOP sense, we would say that stool is a subclass of chair, in the theory of Forms sense, we would say that the Form of chair fully encompasses the form of stool.

## How Does This Help Me Code?
Coding with this analogy in mind, we can ensure that our classes truly represent idealised and non-physical progenitors of objects, and that objects are only implemented and stateful offspring from classes. Classes should basically define the Form of the thing you are describing. Using the analogy above, if you are not checking in the initialiser of the stool class whether a positive integer number of legs has been passed, you have not actually specified the Form of a stool.

Of course, most classes in real code don’t have anything to do with real-world things like chairs and stools, but nevertheless, the exercise of thinking about the true essence of what you are describing will result in better OOP code.