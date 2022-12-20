---
title: AnonKey
layout: default
use_math: true
scripts:
- anonkey.js
- punycode.js
---
<div id="anonKeyFields">
    <input type="text" id="participantNameInput" placeholder="Participant name" autofocus autocomplete="off" oninput="generateKey();">
    <input type="number" min="0" id="participantNumberInput" placeholder="Participant number" autocomplete="off" oninput="generateKey();">
</div>
<p>AnonKey: <span id="output"></span></p>
<input type="text" id="copyBox">
<span onclick="copyKey()" id="copyAnonKey">Copy</span>

## What is this?
An AnonKey is a string of text that represents a participant in your research. You type in the name of the research participant into the text-box above,
along with their unique participant number, and you get the AnonKey that you store in your database instead of their name.

The purpose of this is to protect participants' privacy. If your data is stolen or leaked, nobody would be able to determine who the participants were
using the AnonKey. But, if a participant withdraws their consent from the study, you can ask them for their name and participant number (which you
provided when they agreed to join the study), generate the AnonKey again, and look for a match in your database to delete it.

By requiring the name in addition to the participant number to delete their data, we can be more sure that the person making the request is correct that
the number they are providing is their participant number, and also prevents us from acting on fraudulent deletion requests, since they would not know
what name corresponds to each participant number.

## A Small Warning
If you spell the participant's name incorrectly when you save their data into your database, your AnonKey will not match their real name. If you then need to
delete their data later on, you will not be able to match your saved AnonKey with the new one you generate using the correct spelling of their name.

Some variation is allowed (differences in spaces, diacritics, and capitalisation), but it's much easier to just type in their name correctly the first time.

## Details for Nerds
The prefix of the AnonKey is the version number that stops at "v", and then the hexadecimal encoded participant number that stops at "n" (this ensures AnonKeys never clash for different
individuals, whether or not their names are identical).


The name is preprocessed by removing spaces, diacritics, substituting text in a non-Latin script for [punycode](https://en.wikipedia.org/wiki/Punycode), removing non-printable US-ASCII characters,
and then converting all characters to lowercase (in that order).

The base of the AnonKey is the SHA-256 hash of the preprocessed name (salted with the participant number), encoded in hexadecimal.

The AnonKey is suffixed by a three-digit hexadecimal checksum calculated as the sum of the US-ASCII values of every character before the third last character, modulo $$16^3$$.

[View the source code](https://github.com/Coedice/website/blob/main/assets/scripts/anonkey.coffee).

### EBNF
~~~ python
AnonKey = prefix, base, checksum;
prefix = version, participant number;
version = hex number, "v";
hex number = (hex char - "0", {hex char}) | "0";
hex char = digit | "a" | "b" | "c" | "d" | "e" | "f";
participant number = hex number, "n";
base = 64 * hex char;
checksum = 3 * hex char;
~~~

### Regex
~~~ python
(([1-9a-f][0-9a-f]*)|0)v(([1-9a-f][0-9a-f]*)|0)n[0-9a-f]{67}
~~~