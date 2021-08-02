## General comments

* Worth rereading every Pbind to double check some stuff. For example, when panning, is the pan control synth triggered on multiples of the pan frequency to avoid the sound "jumping" to another speaker?

* Ideas for adding variety:  pwhite on amp, delay on everything, prand on delay parameters (both delay time and delay repeats), more "rarement" type pattern variations, having sounds fade in and out constantly using loopEnv.

* Worth listening a lot of times to the whole thing to make sure there are no weird clicks, clips, bad transitions if randomness screws us over, etc.

* Last part of both ritual and biosphere don't have real outros atm, need to make stuff fade out and / or make samples drop off one at a time.

* For now let's do the dumb easy thing and just use find and replace in a text editor to fix the paths from `C:/Users/jonathan/Desktop/scc` to `/Users/lewismurray/Desktop/whatever`.

* There are mostly two types of patterns.
    * Some patterns loop a long sample, fade in and out over 4 bars, and pan in circles, occasionally changing direction.
    * Some patterns trigger short samples occasionally using Prand and Pseq inside \dur. If the sample is very short we use Prand with a hard pan to one speaker rather than a continuous pan via the pan bus.

* In both of these types of patterns, the values for durations, fade ins, etc are often copy-pasted. Not sure it's worth changing that as we already have quite a bit of variety *inside* the copy-pasted values, so you can't tell they all use the same values. The only thing that it's worth keeping different everywhere is the pan frequency, so that sounds don't end up following each other around the speaker space.
