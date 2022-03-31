---
title: AnonKey
layout: default
scripts:
- anonKey.js
- punycode.js
---
<input type="text" id="participantNameInput" placeholder="Participant name" autofocus autocomplete="off" oninput="generateKey()">
<p>AnonKey: <span id="output">1ve3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855375</span></p>
<input type="text" id="copyBox">
<span onclick="copyKey()" id="copyAnonKey">Copy</span>

## What is this?
An AnonKey is a string of text that represents a participant in your research. You type in the name of the research participant into the text-box above,
and you get the AnonKey that you store in your database instead of their name.

The purpose of this is to protect participants' privacy. If your data is stolen or leaked, nobody would be able to determine who the participants were
using the AnonKey. But, if a participant withdraws their consent from the study, you can ask them their name, generate the AnonKey again, and look for a match
in your database to delete it.

## A Small Warning
If you spell the participant's name incorrectly when you save their data into your database, your AnonKey will not match their real name. If you then need to
delete their data later on, you will not be able to match your saved AnonKey with the new one you generate using the correct spelling of their name.

Some variation is allowed (differences in spaces, diacritics, and capitalisation), but it's much easier to just type in their name correctly the first time.

## Details for Nerds
The name is preprocessed by removing spaces, removing diacritics, substituting text in a non-latin script for punycode, removing non-printable US-ASCII characters,
and then converting all characters to lowercase (in that order).

The base of the AnonKey is a SHA-256 hash of the preprocessed name, displayed in hexadecimal. It has a prefixed version number that stops at "v", and it is
suffixed by a three-digit checksum based on the sum of the US-ASCII values of every character before the third last digit, modulo 1000.

[View the source code](https://github.com/Coedice/website/blob/main/assets/scripts/anonKey.coffee).