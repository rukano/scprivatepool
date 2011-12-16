/* An approach to try to reproduce the 'famous' bassline of "Der Mussolini" by D.A.F. */

// very bad simulated analogue distorted bass synth
// too distorted compared to the original...

SynthDef(\daf_bass,{ |out, freq=440, sustain=1, gate=1, amp=0.1|
	var snd, env, fenv, harm;
	harm = [1,1.01,2,2.02,3.5,4.01,5.501];
	harm = harm ++ (harm*2);
	snd = SinOsc.ar(freq*harm).sum.distort * 2;
	snd = snd + SinOsc.ar(freq / [1, 2]).sum!2;
	env = EnvGen.kr(Env.adsr(0.001,0.2,0.9,0.25), gate, amp, doneAction:2);
	snd = snd * env;
	OffsetOut.ar(out, (snd!2));
}).add;

// approx 63 bpm
TempoClock.default.tempo = 63/60;

// approx bass pattern + modulation of Mussolini Track
Pdef(\daf_bass,
	Pbind(
		\instrument, \daf_bass,
		\scale, Scale.minor,
		\octave, [3], // try out [2,3] or [3,4] for octave bass leetness
		\ctranspose,Pseq([
			Pn(-1,16*4),
			Pn(1,16*2)
		], inf),
		// -1 for thinking in musical degrees...
		\degree, Pseq([1, 4, 1, 10, 1, 8, 1, 1, 8, 1, 8, 1, 8, 7, 1, 8]-1,inf),
		\legato, Pwhite(0.75, 0.8),
		\dur, 0.2
	)
).play;

// link: 