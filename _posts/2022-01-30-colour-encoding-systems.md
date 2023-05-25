---
layout: post
title: Colour Encoding Systems
use_math: true
tags: programming design
icon_alt: The tips of many coloured pencils that are stacked on top of each other
---
Here is everything you need to know about encoding colour as a programmer.

## Primary Colours

The primary colours of light are red, green, and blue (RGB). Yes, you read that correctly.

You most likely believe that the primary colours are red, yellow, and blue (RYB), and this is true if what you mean is that they are the primary colours of a particular subset of colours (i.e. the colours made by mixing red, yellow, and blue), but it is not true if you mean **all** colours. RYB exists because of artistic tradition and that the colours that can be created with them are often better looking.

You may have even heard that the primary colours are cyan, magenta, and yellow (CMY), and these are true primary colours in that you can get every other colour by mixing them, but they are subtractive primary colours, meaning that they only apply when mixing inks or dyes that absorb certain colours. This is why printers use CMY (well, printers really use CMYK, where K is black, but this is because black is a common printing colour, and the alternative is to run over all black areas with cyan, magenta, and yellow until it goes black).

What we are interested in are additive primary colours, which are what you would need if you wanted to shine lights in the same spot on a wall to get the different colours. These are the colours that are emitted by pixels, these are colours used when specifying colours in code, and they are the colours that stimulate our eyes' colour-sensing cells (cones).

## Hex Codes

Hex codes are the most common way to encode colours on the web, and they are often used by non-programmers in programs like Photoshop.

The first requirement to understand hex codes is to understand hexadecimal. This is a number system like the number system you know with different characters from 0 to 9 before recycling them, except that hexadecimal use 16 characters before recycling them (0, 1, ..., 8, 9, A, B, ..., E, F). This means that A -> 10, F -> 16, and 10 -> 17.

Hex codes are written with a "#" followed by three two-digit numbers in hexadecimal representing the amounts of red, green, and blue respectively. Let's break that down.

<span class="colorCode">&#35;<span style="color: red">RR</span><span style="color: green">GG</span><span style="color: blue">BB</span></span> (I have coloured the three sections for clarity)

Say we want the reddest red possible, in that case we want to shine red out of the pixels as much as possible, and we want to shine as little blue and green as possible. We would do this by writing the largest two-digit hexadecimal number "FF" in the first two digits, and completely turn of the green and blue by writing "00" in those places. This gives <span class="colorCode">#<span style="color: red">FF</span><span style="color: green">00</span><span style="color: blue">00</span></span>, which looks like <span class="colorSquare" style="background-color: red"></span>.

What if we want a darker red? In that case we keep green and blue as they are, and we turn down the amount of red to, say, "91", this gives <span class="colorCode">#<span style="color: red">91</span><span style="color: green">00</span><span style="color: blue">00</span></span> which looks like <span class="colorSquare" style="background-color: #910000"></span>.

Now let's mix in red and green to get a yellow. <span class="colorCode">#<span style="color: red">DD</span><span style="color: green">DD</span><span style="color: blue">00</span></span> which looks like <span class="colorSquare" style="background-color: #DDDD00"></span>.

Black and white work similarly. Since shining all three primary colours as much as possible gets us white, <span class="colorCode">#<span style="color: red">FF</span><span style="color: green">FF</span><span style="color: blue">FF</span></span> looks like <span class="colorSquare" style="background-color: white"></span>, and if we turn off all three colours, we get <span class="colorCode">#<span style="color: red">00</span><span style="color: green">00</span><span style="color: blue">00</span></span> which looks like <span class="colorSquare" style="background-color: black"></span>. To get any grey, we simply shine red, blue, and green equally, for example <span class="colorCode">#<span style="color: red">B1</span><span style="color: green">B1</span><span style="color: blue">B1</span></span> looks like <span class="colorSquare" style="background-color: #B1B1B1B1"></span>.

Using hex codes, we are limited to $$16^6 = 16,777,216$$ colours, which is enough for many purposes.

A modern variation of hex code adds two extra digits on the right to encode for opacity. The lower the number, the more transparent. So <span class="colorCode">#<span style="color: red">FF</span><span style="color: green">00</span><span style="color: blue">00</span>80</span> looks like <span class="colorSquare" style="background-color: #FF000080"></span> (a half transparent red).

There is also a shorthand hex code called a hex triplet. They are written like "<span class="colorCode">#<span style="color: red">R</span><span style="color: green">G</span><span style="color: blue">B</span></span>". They are very similar to full hex codes, but where each digit represents the same digit doubled in a full hex code. For example <span class="colorCode">#<span style="color: red">F</span><span style="color: green">6</span><span style="color: blue">0</span></span> is the same as <span class="colorCode">#<span style="color: red">FF</span><span style="color: green">66</span><span style="color: blue">00</span></span>, and <span class="colorCode">#<span style="color: red">FF</span><span style="color: green">00</span><span style="color: blue">66</span>DD</span> is the same as <span class="colorCode">#<span style="color: red">F</span><span style="color: green">0</span><span style="color: blue">6</span>D</span> (which is partly transparent).

## RGB and RGBA

Different syntax is used depending on the application, but it is common in front-end software application to encode colours as a function/method call with three arguments.

<span class="colorCode">rgb(<span style="color: red">red</span>, <span style="color: green">green</span>, <span style="color: blue">blue</span>)</span>

The values in each argument numbers are out of 255 (which is the same as two hexadecimal digits in a hex code).

There is also an extended variety, rgba, which includes opacity.

<span class="colorCode">rgba(<span style="color: red">red</span>, <span style="color: green">green</span>, <span style="color: blue">blue</span>, opacity)</span>

The opacity argument, unlike red, green, and blue, is a number between 0 and 1, where one is completely opaque, and 0 is completely transparent.

## Hue, Saturation, and Lightness (HSL)

HSL represents colours in a similar syntax to rgb (above), but it uses hue, saturation, and lightness rather than the primary colours.

- **H**ue: The angle on the colour wheel (whether the colour is a red, yellow, cyan, etc.), 0 is red, 120 is green, 240 is blue, and 360 is back to red.
- **S**aturation: The vividness of the colour. 1 is most saturated, and 0 is completely grey.
- **L**ightness: The amount of white or black that is mixed with the colour. 0.5 is mixed with neither white nor black, 1 is completely white, and 0 is completely black.

Therefore, <span class="colorCode">hsl(260, 0.5, 0.7)</span> looks like <span class="colorSquare" style="background-color: hsl(260, 50%, 70%)"></span> (magenta, muted, light).

## Colour Names

Some applications will have colours systems where certain colours are given keywords.

For example, in CSS there are keywords for regular colours such as <span class="colorCode" style="color: red">red</span> and <span class="colorCode" style="color: cyan">cyan</span>, but also more unusual shades such as <span class="colorCode" style="color: tomato">tomato</span> and <span class="colorCode" style="color: dodgerBlue">dodgerBlue</span>.

The keywords available will depend on the environment you are coding in.

## Semantic Colour

Some applications will have colour systems where there are keywords which represent the colour's purpose, rather than the colour itself. The colour itself will be chosen by some other system.

Let's say you were making an app with a white background, and you want to have some text that does not call as much attention as the primary text. The usual way to do this would be to change the colour of the secondary text to be a light grey. The problem with this is that when the user switches their device to dark mode, the background goes dark grey, the black primary text is nearly invisible, and the light grey secondary text becomes the centre of attention.

Instead, the solution is to specify the primary text as <span class="colorCode">primary-text-color</span>, and the secondary text as <span class="colorCode">secondary-text-color</span>. Then, when the user changes to dark mode, the primary and secondary text colours change automatically according to what the OS (or whichever other system) determines should be the dark mode version of the primary and secondary text colours.
