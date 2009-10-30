(
// load synths
SynthDef(\grain_recorder, { |in, buf|

	// recrds audio input with a given envelope
	// it saves some cpu playing back without using an env to play
	var input = SoundIn.ar(in) * EnvGen.ar(Env.sine(BufDur.kr(buf)), doneAction:2);
	RecordBuf.ar(input, buf);
}).memStore;

SynthDef(\grain_player, { |out, rate, pan, buf, pos, amp|

	// not safe without envelope (when using low rates)!!!
	// but saves some cpu without env
	var snd = Pan2.ar(PlayBuf.ar(1,	buf,	rate*BufRateScale.kr(buf),1,pos,doneAction:2), pan, amp);
	OffsetOut.ar(out,snd);
}).memStore;
)

// create buffer
b = Buffer.alloc(s, s.sampleRate * 0.1);

// fill buffer!
Synth(\grain_recorder, [\in, 0, \buf, b]);

/*
 // optional buffer funcs
 b.normalize
 b.plot
 b.play
*/

(
// grainificator!
Tdef(\grains, {
	inf.do{ |i|
		var freq = 0.1 + sin(i/100);
		Synth.grain(\grain_player, [\rate, freq + rrand(0.5,0.75), \buf, b, \pos, 0, \amp, rrand(0.05,0.1), \pan, rrand(-1.0,0.0)]);
		Synth.grain(\grain_player, [\rate, (freq*2) + rrand(0.9,1.1), \buf, b, \pos, 0, \amp, rrand(0.05,0.1), \pan, rrand(-0.5,0.5)]);
		Synth.grain(\grain_player, [\rate, (freq/2) + rrand(1.25,1.5), \buf, b, \pos, 0, \amp, rrand(0.05,0.1), \pan, rrand(0.0,1.0)]);
		(50.reciprocal).wait;
	}
}).play
)
