/*
(
SynthDef(\player, { |buffer, amp=1, pan=0, rate=1, sustain, start|
	var snd = PlayBuf.ar(
		1,
		buffer,
		BufRateScale.kr(buffer) * rate,
		startPos: BufFrames.kr(buffer) * start
	);
	snd = snd * EnvGen.ar(Env.linen(0,sustain,0), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(0, snd * amp);
}).memStore;

SynthDef(\effect, { |out=0, gate=1|
	var env, in, snd;
	env = Linen.kr(gate, 0.05, 1, 0.4, 2);
	in = In.ar(out, 2) * SinOsc.ar(80);
	snd = RLPF.ar(in, LinExp.kr(LFNoise1.kr(0.3), -1, 1, 200, 8000), 0.1);
	snd = FreeVerb2.ar(snd[0], snd[1], 0.7, 0.7, 1);
	XOut.ar(out, env, snd * 0.8);
}).memStore;
)
*/

// a = "/Volumes/DATA/samples/napoleon_dynamite-scenes/*.aiff".pathMatch
// b = a.collect(Buffer.readChannel(s,_,channels:[0]))
// b.do(_.normalize)

Pdef(\napo,
	Pfx(
		Pbind(
			\instrument, \player,
			\buffer, Pfunc{ b.choose },
			\start, Pwhite(0.2, 0.8, inf),
			\rate, Prand([1,1.05], inf),
			\legato, 1.1,
			\amp, 1,
			\dur, 1
		),
		\effect
	)
).play