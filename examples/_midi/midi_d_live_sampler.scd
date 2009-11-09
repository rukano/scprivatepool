// a sampler + sample recorder

// clean responders... just in case
NoteOnResponder.removeAll;
NoteOffResponder.removeAll;

// load the synth
/////////////////////////////////////////
//////////// SAMPLER/////////////////////
(
// mono buffer (clear)
b = Buffer.alloc(s, s.sampleRate * 2);	// 2 seconds

// mono player
SynthDef(\sampler, { |rate, amp=0.1, buf|
	var snd;
	snd = PlayBuf.ar(1, buf, BufRateScale.kr(buf) * rate, doneAction:2).dup;
	OffsetOut.ar(0, snd * amp)
}).memStore;

// mono recorder
SynthDef(\recorder, { |rate, amp=0.1, buf, loop=0|
	var snd;
	snd = RecordBuf.ar(SoundIn.ar(0), buf, loop:loop, doneAction:2);
}).memStore;
);
// test
Synth(\recorder, [\buf, b]);
Synth(\sampler, [\buf, b, \rate, 1, \amp, 1]);
/////////////////////////////////////////
/////////////////////////////////////////

// play the buffer on different rates
n = NoteOnResponder({ |src, chan, note, vel|
	// scale the freq to the rate as you wish
	Synth(\sampler, [\buf, b, \amp, vel/127, \rate, (note/127) * 4]);
});

n.remove;


// make a record buf button
(
w = Window("record", Rect(0, 0, 400,	400)).front;
Button(w, 400@400)
	.states_([["RECORD", Color.white, Color.red]])
	.font_(Font("Monaco", 60))
	.action_({
		// play looped if you want to have a fun time
		// or in case you dont want to push the button every time to record
		Synth(\recorder, [\buf, b]);
	});
);

// better mapping midi ratio -> rate (tempered samples)
g = 60;	// use C3 as base freq
n = NoteOnResponder({ |src, chan, note, vel|
	// scale the freq to the rate as you wish
	Synth(\sampler, [\buf, b, \amp, vel/127, \rate, (note-g).midiratio]);
});


// TODO: Timed record, not only 2 seconds