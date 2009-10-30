(
// load synths
SynthDef(\grain_recorder, { |in, buf|
	var input = SoundIn.ar(in) * EnvGen.ar(Env.linen(0,BufDur.kr(buf),0), doneAction:2);
	RecordBuf.ar(input, buf);
}).memStore;

// env with .kr ? or .ar ?
SynthDef(\grain_player, { |out, rate, pan, buf, pos, amp, dur|
	var snd = PlayBuf.ar(1,	buf,	rate*BufRateScale.kr(buf),1,pos,doneAction:2);
	snd = snd * EnvGen.ar(Env.sine(dur), doneAction:2);
	snd = Pan2.ar(snd, pan, amp);
	OffsetOut.ar(out,snd);
}).memStore;
)

// create buffer
b = Buffer.alloc(s, s.sampleRate * 2);

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
m = 0.5;
Tdef(\grains, {
	inf.do{ |i|

		var grain_ton = ([0,7,12,16,19].midiratio * m).wchoose([100,50,50,50,50].normalizeSum);
		var grain_dur = 0.2;
		
		Synth.grain(\grain_player, [
			\rate, grain_ton,
			\buf, b,
			\pos, 0,
			\amp, 0.1,
			\dur, grain_dur,
			\pan, 0
		]);
		(200.reciprocal).wait;
	}
}).play
)
