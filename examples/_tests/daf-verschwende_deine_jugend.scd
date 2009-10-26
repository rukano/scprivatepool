/* VERSCHWENDE DEINE JUGEND */
/* main bass */

SynthDef(\daf_bass,{ |out, freq=440, sustain=1, gate=1, amp=0.1|
	var snd, env, fenv, harm;
	
	// TODO: filter envelope
	// TODO: look @ DAF synths: oscs / envs

	harm = [1,1.01,2,2.02,3.5,4.01,5.501];
	harm = harm ++ (harm*2);
	snd = SinOsc.ar(freq*harm).sum.distort.squared * 5;
	env = EnvGen.kr(Env.adsr(0.001,0.2,0.9,0.25), gate, amp, doneAction:2);
	snd = snd * env;
	OffsetOut.ar(out, (snd!2));
}).memStore;

Pdef(\daf_bass,
	PmonoArtic(\daf_bass,
		\scale, Scale.minor,
		\octave, 3,
		\root, 2,
		\ctranspose,Pseq([
			Pn(0,  8 * 4),
			Pn(-5, 8 * 4)
		], inf),
		\degree, Pseq([7,7s,1,8,1,1,7,1]-1,inf),
		\dur, 0.18
	)
).play;