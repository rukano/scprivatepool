var num = 10;   // number of buffers
var secs = 2;   // duration of the buffer in seconds

var abc = "abcdefghijklnmopqrstuvwxyz";
var win = Window("sampler", Rect(200,200,200,(num*25))).front;
win.addFlowLayout((0@0), (0@0));

// store everything in 'b' to have it globally
// call the buffer later like: b.a, b.b, b.c ...
// or b[\a], b[\b], b[\c] ...

b ?? b = ();

abc[..num].do{ |char|
	b[char.asSymbol] = Buffer.alloc(s, s.sampleRate * secs);

	// record buttons (red)
	Button(win, (100@25))
		.states_([["record: " ++ char, Color.red, Color.black]])
		.action_({
			Synth(\rec, [\buf, b[char.asSymbol]]);
			("record buffer: " + char).postln;
		});
	
	// player buttons (green)
	Button(win, (100@25))
		.states_([["play: " ++ char, Color.green, Color.black]])
		.action_({
			b[char.asSymbol].play;
			("play buffer: " + char).postln;
		});

	// next line
	win.view.decorator.nextLine;
};

// basic synth def, no fancy args...
SynthDef(\rec, { |buf|
	var in = SoundIn.ar(0);
	var snd = RecordBuf.ar(in, buf, loop:0, doneAction:2);
}).add;