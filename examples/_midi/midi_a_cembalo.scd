// we'll try a synth with 2 Saw generators (lightly detuned) and when the key is released we'll trigger anoise

// clean responders... just in case
NoteOnResponder.removeAll;
NoteOffResponder.removeAll;

// load the synths
/////////////////////////////////////////////////
////////////// CEMBALO //////////////////////////
(
// easy cembalo
SynthDef(\dampedcembalo, { |freq, amp=0.1|
	var snd = Saw.ar([freq, freq*(0.05.midiratio)]);
	snd = snd * EnvGen.ar(Env.perc(0.001, 0.5), doneAction:2);
	OffsetOut.ar(0, snd * amp)
}).memStore;

// easy noise
SynthDef(\keynoise, {
	var snd = WhiteNoise.ar().dup;
	snd = RHPF.ar(snd, Rand(200,2000), 0.2);
	snd = snd * EnvGen.ar(Env.perc(0.0001, 0.01), doneAction:2) ;
	OffsetOut.ar(0, snd * 0.25)
}).memStore;
);
/////////////////////////////////////////////////
/////////////////////////////////////////////////

NoteOnResponder({ |src, chan, note, vel|
	Synth(\keynoise);		// make a noise
	Synth(\dampedcembalo, [\freq, note.midicps, \amp, vel/127])
	// then the sound
});

NoteOffResponder({ |src, chan, note, vel|
	Synth(\keynoise);		// only noise
});


