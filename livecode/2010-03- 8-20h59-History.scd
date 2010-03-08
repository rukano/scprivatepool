///////////////////////////////////////////////////
// History, as it was on Mon Mar  8 20:59:55 2010.
///////////////////////////////////////////////////

// - 0:0:0 -  
"init".xx

// - 0:0:1.83 -  
p = ProxySpace.push(s);

// - 0:0:10.88 -  
p.fadeTime = 0.25;

// - 0:0:11.81 -  
s.latency = nil;

// - 0:0:51.73 -  
~out.play;

// - 0:5:36.4 -  
p.makeTempoClock

// - 0:5:44.73 -  
~out = { SinOsc.ar(60)!2 * Decay.ar(Impulse.ar(~ tempo.kr), 0.01, 0.1) }

// - 0:5:46.14 -  
~out.play;

// - 0:5:58.9 -  
~out = { SinOsc.ar(60)!2 * Decay2.ar(Impulse.ar(~tempo.kr), 0.01, 0.1) }

// - 0:6:8.3 -  
~out = { SinOsc.ar(60)!2 * Decay2.ar(Impulse.ar(~tempo.kr), 0.001, 0.1) }

// - 0:6:26.33 -  
TempoClock.default.tempo = 2

// - 0:6:29 -  
TempoClock.default.tempo = 2

// - 0:6:32.96 -  
TempoClock.default.tempo = 1.1

// - 0:6:37.39 -  
~tempo = 1.1

// - 0:6:42.69 -  
~tempo = 1

// - 0:6:44.57 -  
TempoClock.default.tempo = 1

// - 0:6:49.8 -  
~out = { SinOsc.ar(60)!2 * Decay2.ar(Impulse.ar(~tempo.kr), 0.001, 0.01) }

// - 0:6:53.9 -  
~out = { SinOsc.ar(60)!2 * Decay2.ar(Impulse.ar(~tempo.kr), 0.001, 0.05) }

// - 0:7:14.94 -  
~out = { SinOsc.ar(60)!2 * Decay2.ar(Impulse.ar(~tempo.kr), 0.001, 0.05, \amp.kr(0.5)) }

// - 0:7:27.31 -  
"pt#out".xx

// - 0:8:6.12 -  
(
NPdef(~out, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:8:10.72 -  
~out = { SinOsc.ar(60)!2 * Decay2.ar(Trig.ar(\t_trig.kr, 0.01), 0.001, 0.05, \amp.kr(0.5)) }

// - 0:8:17.55 -  
~out = { SinOsc.ar(60)!2 * Decay2.ar(Trig.ar(\t_trig.kr, 0.01), 0.001, 0.0005, \amp.kr(0.5)) }

// - 0:8:59.09 -  
~out = { SinOsc.ar(60)!2 * EnvGen.ar(Env.perc(0.001, 0.1), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:9:4.33 -  
~out = { SinOsc.ar(60)!2 * EnvGen.ar(Env.perc(0.001, 0.25), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:9:57.22 -  
(
NPdef(~out, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([
			Pn(1, 6),
			Pn(1/3, 3)
		], inf)
	)
).play
);

// - 0:10:37.89 -  
~kick.play;

// - 0:10:38.72 -  
~kick = { SinOsc.ar(60)!2 * EnvGen.ar(Env.perc(0.001, 0.25), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:10:44.27 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([
			Pn(1, 6),
			Pn(1/3, 3)
		], inf)
	)
).play
);

// - 0:10:48.52 -  
~out.stop

// - 0:10:50.93 -  
~out.clear

// - 0:11:1.19 -  
Pdef(\out).stop

// - 0:11:4.84 -  
Pdef(\out).clear

// - 0:11:45.82 -  
~hh.play

// - 0:13:0.7 -  
~hh = { RHPF.ar(WhiteNoise.ar * EnvGen.ar(Env.perc(0,0.01), \t_trig.kr), 1000, 0.01, 4) }

// - 0:13:9.83 -  
"pt#hh".xx

// - 0:13:26.02 -  
~hh = { RHPF.ar(WhiteNoise.ar * EnvGen.ar(Env.perc(0,0.01), \t_trig.kr), 1000, 0.01, 4) * \amp.kr(0.1) }

// - 0:13:31.17 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:13:39.78 -  
~hh = { RHPF.ar(WhiteNoise.ar * EnvGen.ar(Env.perc(0,0.01), \t_trig.kr), 1000, 0.01) * \amp.kr(0.1) }

// - 0:13:47.8 -  
~hh = { RHPF.ar(WhiteNoise.ar * EnvGen.ar(Env.perc(0,0.01), \t_trig.kr)!2, 1000, 0.01) * \amp.kr(0.1) }

// - 0:13:56.75 -  
~hh = { RHPF.ar(WhiteNoise.ar * EnvGen.ar(Env.perc(0,0.01), \t_trig.kr)!2, 5000, 0.01) * \amp.kr(0.1) }

// - 0:14:27.46 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Pseq([\, 1], inf),
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:14:35.73 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([
			Pn(1, 6),
			Pn(1/3, 3)
		], inf)
	)
).play(quant:4)
);

// - 0:14:43.77 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Pseq([\, 1], inf),
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([1], inf)
	)
).play(quant:4)
);

// - 0:14:54.28 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Pseq([\, 1], inf),
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([1]/2, inf)
	)
).play(quant:4)
);

// - 0:15:3.94 -  
~hh = { RHPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.01), \t_trig.kr)!2, 5000, 0.01) * \amp.kr(0.1) }

// - 0:15:11.58 -  
~hh = { RHPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.021), \t_trig.kr)!2, 5000, 0.01) * \amp.kr(0.1) }

// - 0:15:16.18 -  
~hh = { RHPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.051), \t_trig.kr)!2, 5000, 0.01) * \amp.kr(0.1) }

// - 0:15:27.98 -  
~hh = { RHPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.051), \t_trig.kr)!2, 5000, 0.1) * \amp.kr(0.1) }

// - 0:15:31.35 -  
~hh = { RHPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.01), \t_trig.kr)!2, 5000, 0.1) * \amp.kr(0.1) }

// - 0:15:48.33 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Pseq([\, 1], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1]/2, inf)
	)
).play(quant:4)
);

// - 0:17:45.39 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1], 2),
			Pseq([1], 4),
			Pseq([\], 8),
		], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1]/16, inf)
	)
).play(quant:4)
);

// - 0:18:3.37 -  
~hh = { HPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.01), \t_trig.kr)!2, 5000) * \amp.kr(0.1) }

// - 0:18:9.86 -  
~hh = { HPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.005), \t_trig.kr)!2, 5000) * \amp.kr(0.1) }

// - 0:18:48.8 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Pwrand([
			Pseq([\, 1], 2),
			Pseq([1], 4),
			Pseq([\], 8),
		], [0.5,0.3,0.2], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1]/16, inf)
	)
).play(quant:4)
);

// - 0:19:15.39 -  
~hh[0] = { HPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.005), \t_trig.kr)!2, 5000) * \amp.kr(0.1) }

// - 0:19:29.78 -  
"comb#hh#20".xx

// - 0:19:36.02 -  
~hh[20] = \filter -> { |in| CombC.ar(in, 5, 0.1, 0.5) }

// - 0:19:40.62 -  
~hh[20] = \filter -> { |in| CombC.ar(in, 5, 0.05, 0.5) }

// - 0:19:47.58 -  
~hh[20] = \filter -> { |in| CombC.ar(in, 5, 0.025, 0.5) }

// - 0:19:56.9 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, 0.025, 0.5) }

// - 0:20:2.74 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, 0.025, 0.25) }

// - 0:20:9.53 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, 0.01, 0.25) }

// - 0:20:32.29 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, 0.01, 0.05) }

// - 0:21:10.09 -  
LFNoise2.kr.signalRange

// - 0:21:29.39 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, 0.01, LFNoise2.kr(4, 0.1, 0.1)) }

// - 0:21:37.42 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, 0.01, LFNoise2.kr(1, 0.1, 0.1)) }

// - 0:22:0.98 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, LFNoise2.kr(1, 0.05, 0.1), LFNoise2.kr(1, 0.1, 0.1)) }

// - 0:22:5.54 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, LFNoise2.kr(1, 0.05, 0.01), LFNoise2.kr(1, 0.1, 0.1)) }

// - 0:22:15.12 -  
~hh.stop

// - 0:22:29.98 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, LFNoise2.kr(1, 0.01, 0.01), LFNoise2.kr(1, 0.1, 0.1)) }

// - 0:22:35.64 -  
~hh.play

// - 0:22:39.52 -  
~hh.stop

// - 0:22:52.39 -  
~hh.clear

// - 0:23:0.8 -  
~hh.play

// - 0:23:4.18 -  
~hh[0] = { HPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.005), \t_trig.kr)!2, 5000) * \amp.kr(0.1) }

// - 0:23:21.25 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, LFNoise2.kr(1).range(0.005, 0.1), LFNoise2.kr(1, 0.1, 0.1)) }

// - 0:23:39.78 -  
"filter#hh#10".xx

// - 0:23:56.74 -  
~hh[10] = \filter -> { |in| RLPF.ar(in, 5000, 0.1) }

// - 0:24:4.05 -  
~hh[10] = \filter -> { |in| RLPF.ar(in, 3000, 0.1) }

// - 0:24:28.26 -  
~hh[10] = \filter -> { |in| RLPF.ar(in, 3000 * LFNoise2.kr(4).range(0.5, 2), 0.1) }

// - 0:24:39.61 -  
~hh[10] = \filter -> { |in| RLPF.ar(in, 3000 * LFNoise2.kr(4).range(0.85, 1.3), 0.1) }

// - 0:24:46.78 -  
~hh[0] = { HPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.005), \t_trig.kr)!2, 4000) * \amp.kr(0.1) }

// - 0:24:50.68 -  
~hh[0] = { HPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.005), \t_trig.kr)!2, 1000) * \amp.kr(0.1) }

// - 0:24:55.18 -  
~hh[0] = { HPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.005), \t_trig.kr)!2, 2000) * \amp.kr(0.1) }

// - 0:24:59.83 -  
~hh[0] = { HPF.ar(PinkNoise.ar * EnvGen.ar(Env.perc(0,0.005), \t_trig.kr)!2, 4000) * \amp.kr(0.1) }

// - 0:25:28.35 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],	2),
			Pseq([1],		4),
			Pseq([\],		8),
			Pseq([1],		16),
		], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1]/16, inf)
	)
).play(quant:4)
);

// - 0:26:21.5 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],	2),
			Pseq([1],		4),
			Pseq([\],		8),
			Pseq([1],		16),
			Pseq([1,1,1,\,\,1,1,1,\,\,\,1,\,\,1,1]),
		], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1]/16, inf)
	)
).play(quant:4)
);

// - 0:26:28.33 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],	2),
			Pseq([1],		4),
			Pseq([\],		8),
			Pseq([1],		16),
			Pseq([1,1,1,\,\,1,1,1,\,\,\,1,\,\,1,1], 4),
		], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1]/16, inf)
	)
).play(quant:4)
);

// - 0:26:36.5 -  
~hh[10] = \filter -> { |in| RLPF.ar(in, 3000 * LFNoise2.kr(4).range(0.85, 1.3), 0.05) }

// - 0:26:43.57 -  
~hh[10] = \filter -> { |in| RLPF.ar(in, 1000 * LFNoise2.kr(4).range(0.85, 1.3), 0.05) }

// - 0:26:49.84 -  
~hh[10] = \filter -> { |in| RLPF.ar(in, 2000 * LFNoise2.kr(4).range(0.85, 1.3), 0.05) }

// - 0:27:4.18 -  
"reverb#hh#50".xx

// - 0:27:5.89 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.75, 0.75, 0.99) }

// - 0:27:13.34 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.33, 0.33, 0.99) }

// - 0:28:50.32 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([
			Pn(1, 6),
			Prand([
				Pn(1/3, 3),
				Pn(1/3, 6),
				Pseq([4,3,5,4]/8)
			])
		], inf)
	)
).play(quant:4)
);

// - 0:29:41.67 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([
			Pn(1, 4),
			Prand([
				Pn(1/3, 6),
				Pseq([4,3,5,4]/8)
			])
		], inf)
	)
).play(quant:4)
);

// - 0:29:51.69 -  
~bass.play

// - 0:30:17.48 -  
~bass = { LFTri.ar(\freq.kr(40)) * \amp.kr(0.1) }

// - 0:30:21.86 -  
~bass = { LFTri.ar(\freq.kr(40))!2 * \amp.kr(0.1) }

// - 0:30:33.35 -  
~bass = { LFTri.ar(\freq.kr(40))!2 * \amp.kr(0.1) * SinOsc.kr(~tempo.kr)}

// - 0:30:39.99 -  
~bass = { LFTri.ar(\freq.kr(40))!2 * \amp.kr(0.1) * SinOsc.kr(~tempo.kr /2)}

// - 0:30:51.35 -  
~bass = { LFTri.ar(\freq.kr(40))!2 * \amp.kr(0.1) * SinOsc.kr(~tempo.kr / 3)}

// - 0:31:3.75 -  
"ptf#bass".xx

// - 0:31:23.95 -  
(
NPdef(~bass,
	Pbind(
		\freq, Pseq([40,50], inf), 
//		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:31:26.14 -  
~bass = { LFTri.ar(\freq.kr(40))!2 * \amp.kr(0.1) }

// - 0:31:46.54 -  
(
NPdef(~bass,
	Pbind(
		\freq, Pseq([40,50], inf), 
//		\t_trig, 1, 
		\amp, Pwhite(0.01, 0.25, inf),
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:31:53.86 -  
~bass = { SinOsc.ar(\freq.kr(40))!2 * \amp.kr(0.1) }

// - 0:32:8.13 -  
(
NPdef(~bass,
	Pbind(
		\freq, Pseq([60,75], inf), 
//		\t_trig, 1, 
		\amp, Pwhite(0.01, 0.25, inf),
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:32:16.19 -  
(
NPdef(~bass,
	Pbind(
		\freq, Pseq([60,75,62], inf), 
//		\t_trig, 1, 
		\amp, Pwhite(0.01, 0.25, inf),
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:32:20.89 -  
(
NPdef(~bass,
	Pbind(
		\freq, Pseq([60,75,62], inf), 
//		\t_trig, 1, 
		\amp, Pwhite(0.01, 0.1, inf),
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:32:38.81 -  
(
NPdef(~bass,
	Pbind(
		\freq, Prand([60, 75, 62, 68, 71], inf), 
//		\t_trig, 1, 
		\amp, Pwhite(0.01, 0.1, inf),
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:32:46.73 -  
(
NPdef(~bass,
	Pbind(
		\freq, Prand([60, 75, 62, 68, 71], inf), 
//		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:32:52.54 -  
(
NPdef(~bass,
	Pbind(
		\freq, Prand([60, 75, 62, 68, 71], inf), 
//		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:32:59.38 -  
(
NPdef(~bass,
	Pbind(
		\freq, Prand([60, 75, 62, 68, 71], inf), 
//		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/2, inf)
	)
).play
);

// - 0:33:31.18 -  
(
NPdef(~bass,
	Pbind(
		\freq, Prand([60, 75, 62, 68, 71], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/2, inf)
	)
).play
);

// - 0:34:3.45 -  
Env.perc(0.1,0.2,1,8).plot

// - 0:34:20.46 -  
~bass = { SinOsc.ar(\freq.kr(40))!2 * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2,1,8), \t_trig.kr)}

// - 0:34:47.58 -  
(
NPdef(~bass,
	Pbind(
		\midinote, Prand([40,41,43,44,46], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/2, inf)
	)
).play
);

// - 0:34:57.72 -  
(
NPdef(~bass,
	Pbind(
		\midinote, Prand([40,41,43,44,46] - 8, inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/2, inf)
	)
).play
);

// - 0:35:7.02 -  
(
NPdef(~bass,
	Pbind(
		\midinote, Prand([40,41,43,44,46] - 4, inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/2, inf)
	)
).play
);

// - 0:35:16.53 -  
(
NPdef(~bass,
	Pbind(
		\midinote, Prand([40,41,43,44,46], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/2, inf)
	)
).play
);

// - 0:35:28.42 -  
(
NPdef(~bass,
	Pbind(
		\midinote, Prand([30,35,40,41,43,44,46], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/2, inf)
	)
).play
);

// - 0:35:40.16 -  
(
NPdef(~bass,
	Pbind(
		\midinote, Prand([30,35,40,41,43,44,46], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:35:51.46 -  
~bass = { SinOsc.ar(\freq.kr(40))!2 * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2,1,40), \t_trig.kr)}

// - 0:36:1.28 -  
~bass = { SinOsc.ar(\freq.kr(40))!2 * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2,1,-10), \t_trig.kr)}

// - 0:36:6.13 -  
~bass = { SinOsc.ar(\freq.kr(40))!2 * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2,1,10), \t_trig.kr)}

// - 0:36:57.32 -  
(
NPdef(~bass,
	Pbind(
		\octave, 2,
		\scale, Scale.chromatic,
		\degree, Prand([0,1,4,5,8], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:37:1.96 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Prand([0,1,4,5,8], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:37:21.51 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],	2),
			Pseq([1],		4),
			Pseq([\],		8),
			Pseq([1],		16),
			Pseq([1,1,1,\,\,1,1,1,\,\,\,1,\,\,1,1], 4),
		], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1]/8, inf)
	)
).play(quant:4)
);

// - 0:37:29.45 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Prand([0,1,4,5,8], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:37:34.66 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],	2),
			Pseq([1],		4),
			Pseq([\],		8),
			Pseq([1],		16),
			Pseq([1,1,1,\,\,1,1,1,\,\,\,1,\,\,1,1], 4),
		], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1]/2, inf)
	)
).play(quant:4)
);

// - 0:37:48.52 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:38:18.29 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf), 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:39:4.91 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.25], inf), 
		\dur, Pseq([1]/2, inf)
	)
).play(quant:4)
);

// - 0:39:13.32 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.25], inf), 
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:39:22.42 -  
~kick = { SinOsc.ar(80)!2 * EnvGen.ar(Env.perc(0.001, 0.25), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:39:27.02 -  
~kick = { SinOsc.ar(80)!2 * EnvGen.ar(Env.perc(0.001, 0.1), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:39:32 -  
~kick = { SinOsc.ar(80)!2 * EnvGen.ar(Env.perc(0.001, 0.01), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:39:37.16 -  
~kick = { SinOsc.ar(20)!2 * EnvGen.ar(Env.perc(0.001, 0.01), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:39:41.37 -  
~kick = { SinOsc.ar(20)!2 * EnvGen.ar(Env.perc(0.01, 0.01), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:39:46.63 -  
~kick = { SinOsc.ar(60)!2 * EnvGen.ar(Env.perc(0.01, 0.01), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:39:51.48 -  
~kick = { SinOsc.ar(60)!2 * EnvGen.ar(Env.perc(0.025, 0.01), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:39:55.28 -  
~kick = { SinOsc.ar(60)!2 * EnvGen.ar(Env.perc(0.025, 0.001), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:40:1.9 -  
~kick = { SinOsc.ar(60)!2 * EnvGen.ar(Env.perc(0.01, 0.1), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:40:5.03 -  
~kick = { SinOsc.ar(60)!2 * EnvGen.ar(Env.perc(0.01, 0.5), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:40:10.14 -  
~kick = { SinOsc.ar(80)!2 * EnvGen.ar(Env.perc(0.01, 0.5), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:40:23.41 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],	2),
			Pseq([1],		4),
			Pseq([\],		8),
			Pseq([1],		16),
			Pseq([1,1,1,\,\,1,1,1,\,\,\,1,\,\,1,1], 4),
		], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1], inf)
	)
).play(quant:4)
);

// - 0:40:31.41 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) + 12, 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:40:42.73 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) + [0, 12], 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:40:51.33 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) + 24, 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:41:8.25 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) -12, 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:41:13.96 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) - 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:41:19.22 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) + 3, 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:41:28.21 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) + 5, 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:41:37.44 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) + 1, 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:41:41.78 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.1, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:41:49.18 -  
~kick = { SinOsc.ar(55)!2 * EnvGen.ar(Env.perc(0.01, 0.5), \t_trig.kr) *  \amp.kr(0.5) }

// - 0:41:53.73 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([0.25], inf), 
		\dur, Pseq([1]/8, inf)
	)
).play(quant:4)
);

// - 0:42:12.41 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\freq, Prand([1, \], inf),
		\amp, Pseq([0.25], inf), 
		\dur, Pseq([1]/8, inf)
	)
).play(quant:4)
);

// - 0:42:31.87 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\freq, Pwrand([1, \], [0.3, 0.7], inf),
		\amp, Pseq([0.25], inf), 
		\dur, Pseq([1]/8, inf)
	)
).play(quant:4)
);

// - 0:42:51.37 -  
~bass = { SinOsc.ar(\freq.kr(40) * [1,1.5]) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2,1,10), \t_trig.kr)}

// - 0:43:12.48 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.5,2,3,4])) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2,1,10), \t_trig.kr)}

// - 0:43:21.92 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.5,2,3,4], mul:0.1)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2,1,10), \t_trig.kr)}

// - 0:43:28.31 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.05, 0.5, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:43:32.71 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.1, 0.5, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:43:50.66 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.5,2.33,3.25,4.75], mul:0.1)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2,1,10), \t_trig.kr)}

// - 0:44:5.39 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pseq([0,1,4,5,8,\,11,0,4,2,\].scramble, inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.1, 0.5, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:44:25.57 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],	2),
			Pseq([1],		4),
			Pseq([\],		8),
			Pseq([1],		16),
			Pseq([1,1,1,\,\,1,1,1,\,\,\,1,\,\,1,1], 4),
		], inf),
		\amp, Pseq([0.1,0.5, 1], inf), 
		\dur, Pseq([1]/32, inf)
	)
).play(quant:4)
);

// - 0:44:32.73 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.33, 0.33, 0.99) * 0.1}

// - 0:44:46.17 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],	2),
			Pseq([1],		4),
			Pseq([\],		8),
			Pseq([1],		16),
			Pseq([1,1,1,\,\,1,1,1,\,\,\,1,\,\,1,1], 4),
		], inf),
		\amp, Pseq((0.1,0.2 .. 1), inf), 
		\dur, Pseq([1]/32, inf)
	)
).play(quant:4)
);

// - 0:44:51.85 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],	2),
			Pseq([1],		4),
			Pseq([\],		8),
			Pseq([1],		16),
			Pseq([1,1,1,\,\,1,1,1,\,\,\,1,\,\,1,1], 4),
		], inf),
		\amp, Prand((0.1,0.2 .. 1), inf), 
		\dur, Pseq([1]/32, inf)
	)
).play(quant:4)
);

// - 0:44:58.5 -  
~hh[10] = \filter -> { |in| RLPF.ar(in, 1000 * LFNoise2.kr(4).range(0.85, 1.3), 0.05) }

// - 0:45:5.81 -  
~hh[10] = \filter -> { |in| RLPF.ar(in, 1000 * LFNoise2.kr(4).range(0.5, 1.5), 0.05) }

// - 0:45:11.9 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.33, 0.33, 0.99) * 0.2}

// - 0:45:16.66 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.33, 0.33, 0.99) * 0.35}

// - 0:45:54.39 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],		2),
			Pseq([\, \, \, 1],	8),
			Pseq([1],			4),
		], inf),
		\amp, Prand((0.1,0.2 .. 1), inf), 
		\dur, Pseq([1]/32, inf)
	)
).play(quant:4)
);

// - 0:46:6.54 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, LFNoise2.kr(1).range(0.001, 0.1), LFNoise2.kr(1, 0.1, 0.1)) }

// - 0:46:9.26 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, LFNoise2.kr(1).range(0.001, 0.01), LFNoise2.kr(1, 0.1, 0.1)) }

// - 0:46:15.18 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.33, 0.33, 0.99) * 0.5}

// - 0:46:34.89 -  
~hh[20] = \filter -> { |in| in + CombC.ar(in, 5, LFNoise2.kr(1).range(0.001, 0.01), LFNoise2.kr(1, 0.5, 0.5)) }

// - 0:46:43.74 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.33, 0.33, 0.99) }

// - 0:47:17.51 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],		8),
			Pseq([\, \, \, 1],	8),
			Pseq([1],			8),
		], inf),
		\amp, Prand((0.1,0.2 .. 1), inf), 
		\dur, Pseq([1]/32, inf)
	)
).play(quant:4)
);

// - 0:47:37.46 -  
(
NPdef(~hh, 
	Pbind(
		\t_trig, 1,
		\freq, Prand([
			Pseq([\, 1],		8),
			Pseq([\, \, \, 1],	8),
			Pseq([\, 1, \, 1],	8),
			Pseq([1, \, \, 1],	8),
			Pseq([1],			8),
		], inf),
		\amp, Prand((0.1,0.2 .. 1), inf), 
		\dur, Pseq([1]/32, inf)
	)
).play(quant:4)
);

// - 0:47:47.7 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.33, 0.8, 0.99) }

// - 0:47:56.17 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.33, 1, 0.99) }

// - 0:48:0.31 -  
~hh[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.5, 1, 0.99) }

// - 0:48:24.9 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.1, 0.5, inf),
		\dur, Pseq([1]/4, inf)
	)
).play(quant:4)
);

// - 0:48:42.44 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.1, 0.5, inf),
		\dur, Prand([1,2,2,1,4,2]/8, inf)
	)
).play(quant:4)
);

// - 0:48:53.74 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.1, 0.5, inf),
		\dur, Prand([1,2,2,1,2]/8, inf)
	)
).play(quant:4)
);

// - 0:49:8.85 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.1, 0.5, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/16, inf)
	)
).play(quant:4)
);

// - 0:49:15.39 -  
(
NPdef(~bass,
	Pbind(
		\octave, 3,
		\scale, Scale.chromatic,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.1, 0.5, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:49:31.01 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.5,2.33,3.25,4.75], mul:0.1)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2,1,-10), \t_trig.kr)}

// - 0:49:57.8 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.5,1.75,2,2.33,3.25,4.75], mul:0.1)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2, 1, -10), \t_trig.kr)}

// - 0:50:4.33 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.25,1.5,1.75,2,2.33,3.25,4.75], mul:0.1)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2, 1, -10), \t_trig.kr)}

// - 0:50:7.76 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.25,1.5,1.75,2,2.33,3.25,4.75,8], mul:0.1)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.001,0.2, 1, -10), \t_trig.kr)}

// - 0:50:28.01 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([2,3,4], inf),
		\scale, Scale.chromatic,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.1, 0.5, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:50:42.98 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([2,3,4], inf),
		\scale, Scale.chromatic,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1, 
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:50:50.27 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.25,1.5,1.75,2,2.33,3.25,4.75,8], mul:0.1)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.01,0.2, 1, -10), \t_trig.kr)}

// - 0:51:4.81 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.25,1.5,1.75,2,2.33,3.25,4.75,8], mul:0.1)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.01, \sustain.kr(0.2), 1, -10), \t_trig.kr)}

// - 0:51:21.37 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([2,3,4], inf),
		\scale, Scale.chromatic,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1,
		\sustain, 0.1,
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:51:34.05 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([2,3,4], inf),
		\scale, Scale.chromatic,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1,
		\sustain, Pwhite(0.1, 0.4, inf),
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:51:43.17 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.25,1.5,1.75,2,2.33], mul:0.1)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.01, \sustain.kr(0.2), 1, -10), \t_trig.kr)}

// - 0:51:49.6 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.25,1.5,1.75,2,2.33], mul:0.5)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.01, \sustain.kr(0.2), 1, -10), \t_trig.kr)}

// - 0:51:53.17 -  
~bass = { Splay.ar(SinOsc.ar(\freq.kr(40) * [1,1.25,1.5,1.75,2,2.33], mul:0.25)) * \amp.kr(0.1) * EnvGen.ar(Env.perc(0.01, \sustain.kr(0.2), 1, -10), \t_trig.kr)}

// - 0:52:8.49 -  
Scale.phrygian

// - 0:52:9.61 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([2,3,4], inf),
		\scale, Scale.phrygian,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1,
		\sustain, Pwhite(0.1, 0.4, inf),
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:52:19.62 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([3,4], inf),
		\scale, Scale.phrygian,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0, 
		\t_trig, 1,
		\sustain, Pwhite(0.1, 0.4, inf),
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:53:2.06 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([3,4], inf),
		\scale, Scale.phrygian,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0,
		\ctranpose, Pstutter(16, Prand([0,2,7], inf)),
		\t_trig, 1,
		\sustain, Pwhite(0.1, 0.4, inf),
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:53:29.37 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([3,4], inf),
		\scale, Scale.phrygian,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0,
		\root, Pstutter(16, Prand([0,2,7], inf)),
		\t_trig, 1,
		\sustain, Pwhite(0.1, 0.4, inf),
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:53:42.73 -  
"comb#bass#10".xx

// - 0:53:44.47 -  
~bass[10] = \filter -> { |in| CombC.ar(in, 5, 0.33, 2) }

// - 0:53:51.88 -  
~bass[10] = \filter -> { |in| CombC.ar(in, 5, 0.133, 1) }

// - 0:54:1.38 -  
~bass[10] = \filter -> { |in| CombC.ar(in, 5, 1/6, 1) }

// - 0:54:7.18 -  
~bass[10] = \filter -> { |in| CombC.ar(in, 5, 1/6, 0.1) }

// - 0:54:12.51 -  
~bass[10] = \filter -> { |in| CombC.ar(in, 5, 1/12, 0.1) }

// - 0:54:18.23 -  
~bass[10] = \filter -> { |in| CombC.ar(in, 5, 1/12, 0.25) }

// - 0:54:27.02 -  
~bass[10] = \filter -> { |in| CombN.ar(in, 5, 1/12, 0.25) }

// - 0:54:43.52 -  
~hh[50] = \filter -> { |in| (in * 2) + FreeVerb2.ar(in[0], in[1], 0.5, 1, 0.99) }

// - 0:54:59.34 -  
~hh[50] = \filter -> { |in| (in * 2) + (FreeVerb2.ar(in[0], in[1], 0.5, 1, 0.99) * 1.25) }

// - 0:55:10.37 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([3,4], inf),
		\scale, Scale.phrygian,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0,
		\root, Pstutter(16, Prand([0,2,7], inf)),
		\t_trig, 1,
		\sustain, Pwhite(0.1, 0.4, inf),
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:55:20.39 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([3,4,7], inf),
		\scale, Scale.phrygian,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0,
		\root, Pstutter(16, Prand([0,2,7], inf)),
		\t_trig, 1,
		\sustain, Pwhite(0.1, 0.4, inf),
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:55:27.77 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([3,4], inf),
		\scale, Scale.phrygian,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + 0,
		\root, Pstutter(16, Prand([0,2,7], inf)),
		\t_trig, 1,
		\sustain, Pwhite(0.1, 0.4, inf),
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:55:45.57 -  
(
NPdef(~bass,
	Pbind(
		\octave, Prand([3,4], inf),
		\scale, Scale.phrygian,
		\degree, Pshuf([0,1,4,5,8,\,11,0,4,2,\,1,1,0,5,6,6,5], inf) + Prand([0, 12], inf),
		\root, Pstutter(16, Prand([0,2,7], inf)),
		\t_trig, 1,
		\sustain, Pwhite(0.1, 0.4, inf),
		\amp, Pwhite(0.5, 1.0, inf),
		\dur, Pshuf([1,2,2,1,2,1,1,2,2,1]/8, inf)
	)
).play(quant:4)
);

// - 0:55:53.01 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\freq, Pwrand([1, \], [0.3, 0.7], inf),
		\amp, Pseq([0.25], inf), 
		\dur, Pseq([1]/16, inf)
	)
).play(quant:4)
);

// - 0:56:5.38 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\freq, Pwrand([1, \], [0.3, 0.7], inf),
		\amp, Pseq([0.25], inf), 
		\dur, Pseq([1]/8, inf)
	)
).play(quant:4)
);

// - 0:56:11.65 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\freq, Pwrand([1, \], [0.7, 0.3], inf),
		\amp, Pseq([0.25], inf), 
		\dur, Pseq([1]/8, inf)
	)
).play(quant:4)
);

// - 0:56:16.79 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\freq, Pwrand([1, \], [0.7, 0.3], inf),
		\amp, Pseq([1], inf), 
		\dur, Pseq([1]/8, inf)
	)
).play(quant:4)
);

// - 0:56:32.35 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\freq, Pwrand([1, \], [0.7, 0.3], inf),
		\amp, Pseq([0.5], inf), 
		\dur, Pseq([1]/8, inf)
	)
).play(quant:4)
);

// - 0:56:45.49 -  
TempoClock.default.tempo = 0.5

// - 0:56:51.62 -  
TempoClock.default.tempo = 0.25

// - 0:56:54.84 -  
TempoClock.default.tempo = 0.125

