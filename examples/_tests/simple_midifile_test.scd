// just a midi file track player...
// WARNING: you'll need the wslib from the Quarks

//___________SYNTH
SynthDef(\sound, { |freq|
	var snd = Blip.ar(freq.midicps, 2);
	snd = snd * EnvGen.kr(Env.perc, doneAction:2);
	OffsetOut.ar(0, snd.dup * 0.1)
}).memStore;

//___________MIDI
(
m = SimpleMIDIFile.read("~/Desktop/midifile.mid");
m.timeMode = \seconds;
v = 0;							// track number (try differents)
n = m.noteOnEvents(v).size;			// how many notes
t = m.noteOnEvents(v).collect(_[1]);	// absolute times
e = m.noteOnEvents(v).collect(_[4]);	// notes
t = t - t[0];						// starting time = 0
t = t.differentiate;				// relativize time
);

//___________PLAYER
(
(
Tdef(\player, {
	var last;
	n.do{ |i|
		Synth(\sound, [\freq, e[i]]);
		(t[i]).wait;
	}
}).play
)
);