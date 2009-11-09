// now let's try some midi notes from a keyboard

n = NoteOnResponder({	|src, chan, note, vel|	// different arguments than CC
	// i like this C style formatted printing
	postf("midinote: % --- velocity: %\n", note, vel);
});

// remove it
n.remove;

// or remove ALL
NoteOnResponder.removeAll;

// now let's try to trigger a synth...
// load the synths from the synths file, or run next code:

////////////////////////////////////////
///////////// easy beep ////////////////
SynthDef(\beep, { |freq, amp|
	var snd = SinOsc.ar(freq).dup;
	snd = snd * EnvGen.kr(Env.perc, doneAction:2);
	OffsetOut.ar(0, snd*amp)
}).memStore;
////////////////////////////////////////
////////////////////////////////////////

n = NoteOnResponder({	|src, chan, note, vel|
	Synth(\beep, [\freq, note.midicps, \amp, vel/127]);
});
n.remove;

// you could also make something like:
n = NoteOnResponder({	|src, chan, note, vel|
	Synth(\beep, [\freq, note.midicps, \amp, vel/127/3]);
	Synth(\beep, [\freq, (note+12).midicps, \amp, vel/127/3]);
	Synth(\beep, [\freq, (note-12).midicps, \amp, vel/127/3]);
	// of course with other synths...
});
n.remove;

// velocity scaleing
n = NoteOnResponder({	|src, chan, note, vel|
	// try commenting out one of the lines, to hear the scaling of the velocity
//	Synth(\beep, [\freq, note.midicps, \amp, vel.linlin(0,127, 0.0001, 0.1)]);
	Synth(\beep, [\freq, note.midicps, \amp, vel.linexp(0,127, 0.0001, 0.1)]);
});
n.remove;

// now let's use the note off
// octave higher when releasing a key
NoteOnResponder({	|src, chan, note, vel|
	Synth(\beep, [\freq, note.midicps, \amp, vel/127]);
});
NoteOffResponder({	|src, chan, note, vel|
	Synth(\beep, [\freq, (note+12).midicps, \amp, vel/127]);
});

NoteOnResponder.removeAll;
NoteOffResponder.removeAll;

