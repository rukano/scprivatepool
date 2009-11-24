// just a midi file track player...
// WARNING: you'll need the wslib from the Quarks
Ê
//___________SYNTH
SynthDef(\sound, { |freq|
	var snd = Blip.ar(freq, 2);
	snd = snd * EnvGen.kr(Env.perc, doneAction:2);
	OffsetOut.ar(0, snd.dup * 0.1)
}).memStore;
Ê
//___________MIDI
(
m = SimpleMIDIFile.read("~/Desktop/midifile.mid");
m.timeMode = \seconds;
v = 0;							// track number (try differents)
n = m.noteOnEvents(v).size;			// how many notes
t = m.noteOnEvents(v).collect(_[1]);	// absolute not on times
o = m.noteOffEvents(v).collect(_[1]);	// absolute note off times
e = m.noteOnEvents(v).collect(_[4]);	// notes
d = (o - t);						// duration
// t = t.differentiate;				// relativize time
								// (no longer needed if you use durations)

);
Ê
//___________PLAYER
(
(
Tdef(\player, {
	var last;
	n.do{ |i|
		Synth(\sound, [\freq, e[i].midicps]);
		(d[i]).wait;
	}
}).play
)
);

//___________PATTERN
(
Pdef(\player,
	Pbind(
		\instrument, \sound,
		\midinote, Pseq(e, 2),
		\dur, Pseq(d, 2)
	)
).play
);


