(
SynthDef(\rec, { |buf|
	var in = SoundIn.ar(0);
	var snd = RecordBuf.ar(in, buf, loop:0, doneAction:2);
}).memStore;
)

(
var num = 4;
var abc = "abcdefghijklnmopqrstuvwxyz";
var win = Window("sampler", Rect(200,200,200,(num*25))).front;
win.addFlowLayout((0@0), (0@0));
b ?? b = ();

abc[..num].do{ |char|
	b[char.asSymbol] = Buffer.alloc(s, s.sampleRate * 2);

	Button(win, (100@25))
		.states_([["record: " ++ char, Color.red, Color.black]])
		.action_({
			Synth(\rec, [\buf, b[char.asSymbol]]);
			("record buffer: " + char).postln;
		});
	Button(win, (100@25))
		.states_([["play: " ++ char, Color.green, Color.black]])
		.action_({
			b[char.asSymbol].play;
			("play buffer: " + char).postln;
		});

	// next line
	win.view.decorator.nextLine;
};

)