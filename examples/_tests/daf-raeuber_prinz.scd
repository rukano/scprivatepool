/* DER RAEUBER UND DER RINZ */
/* main lines */

// TODO: make it better
SynthDef(\daf_octave_bass,{ |out, freq=440, sustain=1, gate=1, amp=0.1|
	var snd, env, harm;
	harm = [1,1.5001,2,2.001];
	snd = SinOsc.ar(freq*harm, mul:harm.size.reciprocal).sum;
	env = EnvGen.kr(Env.perc(0.01,sustain,1,-2),gate, amp, doneAction:2);
	snd = snd * env;
	OffsetOut.ar(out, snd!2);
}).memStore;

// TODO: look how a Casio synth _really_ works
SynthDef(\daf_casio_bell,{ |out, freq=440, sustain=1, gate=1, amp=0.1|
	var snd, env, harm;
	harm = [1,1.25,1.25,1.75];
	snd = FSinOsc.ar(freq*harm);
	env = EnvGen.kr(Env.perc,gate,amp,doneAction:2);
	snd = snd * env;
	OffsetOut.ar(out, snd!2);
}).memStore;

t = 0.275;

Pdef(\daf_octave_bass,
	Pbind(
		\instrument, \daf_octave_bass,
		\octave, 3,
		\ctranspose, -2,
		\degree, Pseq([1,8]-1,inf),
		\legato, 1.5,
		\amp, 0.5,
		\dur, t
	)
).play;

Pdef(\daf_casio_bell,
	Pbind(
		\instrument, \daf_casio_bell,
		\scale, Scale.minor,
		\octave, 9,
		\ctranspose, -2,
		\legato, 1.5,
		\degree, Pseq([
			Pseq([4s,4s,4,2,1]),	// main
			Pseq([4s,4,1,2]),		// var
			Pseq([4s,4s,4,2,1]),	// main
			Pseq([0,1]),			// ending
		]-1,inf),
		\dur, Pseq([
			Pn(t, 4), t*4,		// normal
			t*2, Pn(t, 2), t*4,	// 1. note longer
			Pn(t, 4), t*2,		// normal
			t, t*9				// last 2 notes
		], inf)
	)
).play;