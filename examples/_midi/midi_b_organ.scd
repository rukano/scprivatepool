// a pseudo organ and an organ with a slight vibrato, now usind gate to control the envelope when a key is released

// clean responders... just in case
NoteOnResponder.removeAll;
NoteOffResponder.removeAll;

// load the synth
// remember: we need a gate as argument
///////////////////////////////////////
//////////////// ORGAN ////////////////
SynthDef(\organ, { |freq, amp, gate=1|	// gate should be 1 per default !
	var snd = SinOsc.ar(freq).dup;
		// we'll use a AttackSustainRelease env
	snd = snd * EnvGen.kr(Env.asr(0.01, 1, 0.1), gate, doneAction:2);
	OffsetOut.ar(0, snd * amp);
}).memStore;

SynthDef(\viborgan, { |freq, amp, gate=1|	// gate should be 1 per default !
	var snd = SinOsc.ar(freq + SinOsc.kr(4, mul:freq/50)).dup;
		// we'll use a AttackSustainRelease env
	snd = snd * EnvGen.kr(Env.asr(0.01, 1, 0.1), gate, doneAction:2);
	OffsetOut.ar(0, snd * amp);
}).memStore;

// test
a = Synth(\organ, [\freq, 400, \amp, 0.1]);
a.set(\gate, 0);
///////////////////////////////////////
///////////////////////////////////////

// now we need an array or a dictionary to keep track of the active notes
// so we can send a gate=0 msg from the NoteOff
// Array
x = Array.newClear(128);	// 128 max notes simultaneous

// or...
x = nil.dup(128);

// or...
x = nil!128;

// or as dictionary...
x = Dictionary.new;

// or:
x = ();

// anyway, now we can keep track of the running synths and free them
NoteOnResponder({ |src, chan, note, vel|
	// carefull with the amp... 
//	x[note] = Synth(\viborgan, [\freq, note.midicps, \amp, vel/127/5]);
	x[note] = Synth(\organ, [\freq, note.midicps, \amp, vel/127/5]);
});

NoteOffResponder({ |src, chan, note, vel|
	x[note].set(\gate, 0);
});




