SynthDef(\bass_distorted,{ |out, freq=440, sustain=1, gate=1, amp=0.1|
	var snd, env, fenv, harm;
	harm = [1,1.1,2,2.2,3.5,4.1,5.51];
	snd = Saw.ar(freq*harm,mul:0.1).sum.distort * 5;
	env = EnvGen.kr(Env.adsr(0.001,0.2,0.9,0.25), gate, 2, doneAction:2);
	fenv = EnvGen.kr(Env.adsr(0.01,0.3,0.25,0.1),gate,freq*4,freq);
	snd = RLPF.ar(snd, fenv, 0.01).softclip * env * amp;
	OffsetOut.ar(out, (snd!2));
}).memStore;

SynthDef(\bass_filtered,{ |out, freq=440, sustain=1, gate=1, amp=0.1|
	var snd, env, fenv, harm;
	harm = [1, 2.0, 2.01];
	snd = FreeVerb.ar(Saw.ar(freq*harm,mul:0.1).sum);
	snd = snd + SinOsc.ar(freq, mul:0.5);
	env = EnvGen.kr(Env.adsr(0.001,0.8,0.7,0.25), gate, 2, doneAction:2);
	fenv = EnvGen.kr(Env.adsr(1.0,0.8,0.75,0.8),gate,freq*35,freq/2);
	snd = RLPF.ar(snd, fenv, 0.2).softclip * env * amp * 5;
	
	OffsetOut.ar(out, (snd!2));
}).memStore;

SynthDef(\buffer, { |buffer, amp=1, pan=0, rate=1|
	var snd = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate, doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(0, snd * amp);
}).memStore;


/*
------NEEDS A KICK AND SNARE SAMPLE!!!

b = Buffer.read(s, Document.current.path.dirname.dirname ++ "/_samples/Kit04_Kick.wav");
c = Buffer.read(s, Document.current.path.dirname.dirname ++ "/_samples/DS_Snare02.wav" );
// b.play

Document.current.path.dirname.dirname

*/

Pdef(\bass,
	PmonoArtic(\bass_distorted,		// if using Pbind one could use both synths!
		\scale, Scale.diminished2,
		\octave, 2,
		\degree, Pseq(
			[0,7,0,7] ++
			Pseq([
				Prand([0,7]),
				Prand([0,5,8,7])
			], 5 + 8) ++
			[7,0],
			inf
		),
		\legato, Pwhite(0.9,1.1,inf),
		\amp, 0.15,
		\dur, 0.2
	)
).play;

Pdef(\kick,
	Pbind(
		\instrument, \buffer,
		\buffer, b,
		\freq,
			Prand([
				Pseq([1,\,\,\,1,\,1,\]),
				Pseq([1,\,\,\,1,\,\,\]),
				Pseq([1,\,\,\,1,1,1,1]),
				Pseq([1,\,\,\,\,\,\,\]),
			],inf),
		\rate, 1,
		\amp, 1,
		\dur, 0.2
		
	)
).play;


Pdef(\snare,
	Pbind(
		\instrument, \buffer,
		\buffer, c,
		\freq,
			Prand([
				Pseq([\,\,\,\,1,\,\,\]),
				Pseq([\,\,\,\,\,\,\,\]),
				Pseq([\,\,\,\,1,\,\,1]),
			],inf),
		\rate, 1,
		\amp, 1,
		\dur, 0.2
		
	)
).play;









