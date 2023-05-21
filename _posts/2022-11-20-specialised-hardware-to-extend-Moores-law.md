---
layout: post
title: Specialised Hardware to Extend Moore's Law
tags: compsci
icon_alt: Gordon Moore wearing a suit
---
As [Moore's Law](https://en.wikipedia.org/wiki/Moore%27s_law) continues to become less accurate, computer scientists have had to
become more clever to satisfy the economy's need for speed. One way this has happened is with the increased number of specialised
hardware components.

## Why Use Specialised Hardware Components?

These components can allow certain types of computation to occur very quickly, in a way that traditional, bare-bones, Von Neumann
architecture computers could not. Here are some examples of these additions from the past:

- GPUs - Graphics processing and [GPGPU](https://en.wikipedia.org/wiki/General-purpose_computing_on_graphics_processing_units) applications
- [FPUs](https://en.wikipedia.org/wiki/Floating-point_unit) - Floating point operations
- [AES-NI](https://en.wikipedia.org/wiki/AES_instruction_set) - AES encryption in [x86](https://en.wikipedia.org/wiki/X86)
- [AI accelerators](https://en.wikipedia.org/wiki/AI_accelerator) - Artificial intelligence and machine learning applications
- [O(1) deadlock detection](https://doi.org/10.1109/TPDS.2009.38) - Detecting deadlocks, mainly in parallel, real-time, embedded systems

## Some Newer Additions

A significant change in modern the hardware landscape, the [M1 chip](https://en.wikipedia.org/wiki/Apple_M1#Other_features) and later
iterations, have added a number of specialised hardware components, such as:

- Media engine - Hardware-accelerated encoding and decoding of H.264, HEVC, ProRes, and ProRes RAW (in M1 Ultra)
- Neural Engine - Neural network training and use
- Image processor - Quickly processing image data in parallel

## Into the future

I believe it is likely that the number of specialised components will increase. Some possible additions to computer systems may
include [DNA computing](https://en.wikipedia.org/wiki/DNA_computing) applications, true random number generators, and perhaps one day, [quantum computing](https://en.wikipedia.org/wiki/Quantum_computing).

# Computation Comparisons

Changes such as these make comparing computers harder and harder, since the specific task and the way it is computed will depend
even more on what specialised components it has, and so it becomes like comparing apples and oranges. Benchmarking software will
need to decide how to take this into account, and how to weight each of these different kinds of computation tasks.
