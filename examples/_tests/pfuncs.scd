SynthDef(\org, { |out, freq=440, sustain=1, amp=0.1, gate=1, pan|
	var snd, harm;
	harm = Array.fill(5, { |i| (1+i) + rrand(0.0001,0.001) });
	snd = SinOsc.ar(freq*harm, mul:1).sum.distort;
	snd = Limiter.ar(snd,0.1);
	snd = RLPF.ar(snd * 10, freq * 20, 0.1);
	snd = snd * EnvGen.ar(Env.adsr(0.001, 0.01, sustain, 0.1), gate, amp, doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd)
}).memStore;


Pdef(\m,
	Pbind(
		\instrument, \org,
		\scale, Scale.minor,
		\octave, 4,
		\degree, Pstutter(Pxrand([2,2,2,2,2,4,8],inf), Pfunc{
			var temp = rrand(0,8);
			var out = temp;
			switch(temp,
				3, { out = [0,3,5] },
				5, { out = [0,2,5] },
				6, { out = [0,3,4] },
				8, { out = [1,4,6] }
			);			
			out
		}),
		\legato, 0.9,
		\amp, 0.1,
		\dur, Pstutter(Prand([2,4,8,16],inf), Prand([1,2,4,8,16,32]/32,inf));
	)
).play;