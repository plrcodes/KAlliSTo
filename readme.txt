KAlliSTo plucked string plugin for Tuareg
=========================================
Version 1.1
January 2002

www.geocities.com/curbowbass/kallisto/ 
peter_leroux@hotmail.com

KAlliSTo is a plugin that makes guitar-like noises for use in Tuareg. It generates sound using a mathematical model of a guitar string (called the Karplus-Strong algorithm), instead of playing back a recording, the way a sampler like Bliss does. This approach is called physical modelling.

If you are familiar with the guitar, KAlliSTo should be fairly straightforward to use. KAlliSTo is tuned to standard tuning  and to enter a note, select the step in the sequencer, then choose the note you want. You can have notes hammering on (a right click on the fret is a hammeron), you can also mute notes using the dampen function- this is like palm muting on a real guitar. Changing between steel and nylon changes the model used to generate the sound. The steel option may sound a bit harsh on the lower notes- if this is the case, mute the individual notes slightly. Most things in KAlliSTo work the same way as they do in the internal units in Tu.


INSTALLATION:
Unzip all files into your plugin folder and run Tu (requires FAT version)
-Go to Sample Manager, click on External button and select Kallisto. If External button doesn't show up, check that your plugin folder is set correctly in Tu (under tools..system settings)

FEATURES:
-Monophonic physical modelling synth (Karplus Strong algorithm).
-Fretboard interface. (Enter notes here- left click is normal note, NEW right click is hammeron)
-16 step one bar sequencer.
-Hammeron to higher notes.
-Dampening- variable muting of string- global and note by note (right click in sequencer grid).
-Output as loop or stream.
-Source inclusion (allows you to return to plugin from Tu and edit sequence at any point).
-Transpose function.
-NEW Randomize everything function.
-NEW Randomize note order function.
-NEW Auto advance modes.
-NEW tempo matching- automatically match tempo to that of main Tu window (requires Tu2.0 or higher).

KNOWN ISSUES:
-There is no sound preview option. To hear what you've done, render, listen to it in the sample manager and then edit it to return to KAlliSTo and fix it. I will probably have a play feature in the next version.
-KAlliSTo can only have one string playing at a time- If you play a note, any note playing before it is silenced. If you want a full, multiple string sound, you will have to have six channels of KAlliSTo in Tu with one string to a channel. This is not something I see being fixed soon.
-Tuning for higher notes may not be entirely accurate. This should be easy to fix and hopefully will be in the next release. 
	
CREDITS:
-First off, thanks to Bram, for writing cool stuff like Tu and Hammerhead, for making it easy to write plugins for Tu, for 'lending' me some buttons for the interface and for answering all my questions about programming and audio generally (even the really stupid ones...)
-Thanks again to Bram for implementing tempo matching in Tu2 at my suggestion.
-Secondly, to everyone who downloaded the beta to play with, listened to the demo and uses the final version- all of your input has been valued.
-A big thankyou to the whole TU tribe for being so enthusiastic about my plugin- geocities have switched my webpage off a couple of tiems for exceeding bandwidth limits- which means a lot of you like my software. _cool_ :)
-The basic algorithm used is fully described by K.Karplus and A.Strong in "Digital Synthesis of Plucked string and Drum timbres", Computer Music Journal, vol 7 no 2, pp43-55, 1983
Some extensions to the algorithm and an exhaustive treatment of theory are available from Julius O. Smith's homepage: www-ccrma.stanford.edu/~jos/
For more information, visit my webpage for more links.

REVISION HISTORY

Version 1.1
-----------
January 2002
-Added note name hints on fretboard
-Added note display in sequencer
-Fixed nasty bug in Transpose function (caused an access violation when transposing across G/B string gap under certain circumstances)
-Added 'Clear pattern' function
-Added 'Randomize all' function
-Added 'Randomize order' function
-Moved individual dampen to popup menu (rightclick in note grid)
-Added rightclick hammeron feature on fretboard.
-In the Note Grid, hammeron notes are now shown as gray rather than black.
-Added Auto Advance editing modes.
-Optimized graphic component file sizes (reduces overall size by +-44k)
-Added Tempo syncing- matches tempo with main tempo in Tu2.0 and upwards.
-Fixed error in algorithm- hammeron notes can have dampening independant of preceding note.

Version 1
---------
First full release
5 December 2001
-Added Source inclusion
-Added Fretboard interface and inreased range to 3 octaves
-Added Transpose function
-Fixed Shuffle
-Fixed Algorithm- Nylon and Steel settings now have audibly different timbres.

BETA 0.8
--------
First beta release.
26 November 2001