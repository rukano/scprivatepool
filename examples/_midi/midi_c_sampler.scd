// a sampler

// clean responders... just in case
NoteOnResponder.removeAll;
NoteOffResponder.removeAll;

// load the synth
/////////////////////////////////////////
//////////// SAMPLER/////////////////////
(
// mono buffer
b = Buffer.read(s, "sounds/a11wlk01.wav");

// mono player
SynthDef(\sampler, { |rate, amp=0.1, buf|
	var snd;
	snd = PlayBuf.ar(1, buf, BufRateScale.kr(buf) * rate, doneAction:2).dup;
	OffsetOut.ar(0, snd * amp)
}).memStore;
);
// test
b.play;
Synth(\sampler, [\buf, b, \rate, 1])
/////////////////////////////////////////
/////////////////////////////////////////

// just trigger the buffer
n = NoteOnResponder({ |src, chan, note, vel|
	Synth(\sampler, [\buf, b, \amp, vel/127, \rate, 1]);
});
n.remove;

// control the rate with the note number
n = NoteOnResponder({ |src, chan, note, vel|
	// scale the freq to the rate as you wish
	Synth(\sampler, [\buf, b, \amp, vel/127, \rate, note.linlin(0,127, 0.5, 2)]);
});
n.remove;


// limit the sampler to 1 octaves
n = NoteOnResponder({ |src, chan, note, vel|
	Synth(\sampler, [\buf, b, \amp, vel/127, \rate, note.linlin(60, 72, 1, 2)]);
}, nil, nil, (60..72), nil);
n.remove;

// TODO: Multiple samples | Multiple Mappings