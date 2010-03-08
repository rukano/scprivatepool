///////////////////////////////////////////////////
// History, as it was on Tue Mar  9 00:12:28 2010.
///////////////////////////////////////////////////

// - 0:0:0 -  
"init".xx

// - 0:0:1.45 -  
p = ProxySpace.push(s);

// - 0:0:2.89 -  
p.fadeTime = 0.1;

// - 0:0:3.29 -  
s.latency = nil;

// - 0:0:9.21 -  
~buf.play

// - 0:0:21.35 -  
b = ()

// - 0:0:46.78 -  
"~/scwork/samples".standardizePath

// - 0:1:33.66 -  
"~/scwork/samples/*".standardizePath.pathMatch

// - 0:2:7.15 -  
(
"~/scwork/samples/*".standardizePath.pathMatch.do{ |sample|
	sample.basename.postln
}
);

// - 0:3:4.45 -  
(
"~/scwork/samples/*".standardizePath.pathMatch.do{ |sample|
	sample.basename.splitext.postln
}
);

// - 0:3:36.17 -  
(
"~/scwork/samples/*".standardizePath.pathMatch.do{ |sample|
	b[sample.basename.splitext[0]] = Buffer.read(s, sample);
}
);

// - 0:3:38.84 -  
b

// - 0:3:55.7 -  
b.kick

// - 0:3:57.77 -  
b.kick1

// - 0:3:59.61 -  
b.kick2

// - 0:4:3.04 -  
b

// - 0:4:13.83 -  
b[\kick3]

// - 0:4:18.03 -  
b["kick3"]

// - 0:4:27.77 -  
b

// - 0:4:44.72 -  
b.dopostln

// - 0:5:2.54 -  
b.at("sample1")

// - 0:5:9.13 -  
b.atKey("sample1")

// - 0:5:20.57 -  
b = ()

// - 0:5:26.43 -  
(
"~/scwork/samples/*".standardizePath.pathMatch.do{ |sample|
	b[sample.basename.splitext[0].asSymbol] = Buffer.read(s, sample);
}
);

// - 0:5:33.17 -  
b.sample1

// - 0:5:46.53 -  
b.sample1.plot

// - 0:5:50.81 -  
~buf.play

// - 0:6:19.38 -  
~buf = { PlayBuf.ar(1, b.sample1)!2 * \amp.kr(0.1) }

// - 0:6:28.82 -  
~buf = { PlayBuf.ar(1, b.sample1, loop:1)!2 * \amp.kr(0.1) }

// - 0:6:36.81 -  
~buf = { PlayBuf.ar(1, b.sample1, loop:1)!2 * \amp.kr(0.5) }

// - 0:6:53.86 -  
~buf = { PlayBuf.ar(1, b.sample1, trigger:Dust.kr(4),loop:1)!2 * \amp.kr(0.5) }

// - 0:7:26.2 -  
~buf = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer)* 0.5, trigger:Dust.kr(4),loop:1)!2 * \amp.kr(0.5) }

// - 0:7:37.43 -  
~buf = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer)* 0.5, trigger:Impulse.kr(4),loop:1)!2 * \amp.kr(0.5) }

// - 0:8:10.98 -  
~buf = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer)* 0.5, Impulse.kr(4), BufFrames.kr(buffer) * 0.5, loop:1)!2 * \amp.kr(0.5) }

// - 0:8:34.98 -  
~buf = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer)* 0.5, Impulse.kr(4), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:8:55.4 -  
~buf = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * [1,0.5], Impulse.kr(4), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:9:12.97 -  
"ptf#buf".xx

// - 0:9:34.03 -  
~buf = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * [1,0.5] * \ratio.kr(1), Impulse.kr(4), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1) * \amp.kr(0.5) }

// - 0:9:44.51 -  
~buf = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), Impulse.kr(4), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:10:4.58 -  
~buf = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:10:7.67 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pseq([1], inf), 
		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:10:13.37 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pseq([1], inf), 
		\t_trig, 1, 
		\amp, Pseq([0.1], inf), 
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:10:32.19 -  
TempoClock.default.tempo = 1.2

// - 0:10:39.41 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pseq([1], inf), 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:11:4.09 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pseq([0,1,4].midiratio, inf), 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:11:12.36 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pseq([0,1,4,5].midiratio, inf), 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:11:18.14 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pseq([0,1,4,5,1].midiratio, inf), 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:11:37.8 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pseq([0,1,4,5,4,5,11].midiratio, inf), 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:11:42.96 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pshuf([0,1,4,5,4,5,11].midiratio, inf), 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1]/4, inf)
	)
).play
);

// - 0:12:7.38 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pshuf([0,1,4,5,4,5,11].midiratio, inf), 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([3.5,0.5,1,1,2,4,3.75,0.25]/4, inf)
	)
).play
);

// - 0:12:22.86 -  
~buf = { var buffer = b.sample2; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:12:29.05 -  
~buf = { var buffer = b.sample3; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:12:32.02 -  
~buf = { var buffer = b.sample4; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:12:34.95 -  
~buf = { var buffer = b.sample5; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:12:37.89 -  
~buf = { var buffer = b.sample6; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:12:41.21 -  
~buf = { var buffer = b.sample7; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:12:44.13 -  
~buf = { var buffer = b.sample8; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:12:50.92 -  
~buf = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:13:25.49 -  
b.kick1

// - 0:13:28.3 -  
b.kick

// - 0:13:30.95 -  
b.kick.plot

// - 0:13:53.44 -  
~kick = { var buffer = b.kick; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), 0, loop:0)!2 * \amp.kr(0.5) }

// - 0:13:56.92 -  
~kick.play

// - 0:14:4.94 -  
"pt#kick".xx

// - 0:14:12.47 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1], inf)
	)
).play
);

// - 0:14:37.24 -  
(
NPdef(~buf,
	Pbind(
		\ratio, Pshuf([0,1,4,5,4,5,11].midiratio, inf), 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([3.5,0.5,1,1,2,4,3.75,0.25]/4, inf)
	)
).play(quant:4)
);

// - 0:14:44.98 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([3.5,0.5,1,1,2,4,3.75,0.25], inf)
	)
).play(quant:4)
);

// - 0:15:1.82 -  
(
NPdef(~kick, 
	Pbind(
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([3.5,0.5,1,1,2,4,3.75,0.25]/2, inf)
	)
).play(quant:4)
);

// - 0:15:21.69 -  
(
NPdef(~kick, 
	Pbind(
		\ratio, 0.5,
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([3.5,0.5,1,1,2,4,3.75,0.25]/2, inf)
	)
).play(quant:4)
);

// - 0:15:38.64 -  
~kick = { var buffer = b.kick; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * 0.1, loop:0)!2 * \amp.kr(0.5) }

// - 0:15:42.41 -  
~kick = { var buffer = b.kick; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * 0.01, loop:0)!2 * \amp.kr(0.5) }

// - 0:15:45.08 -  
~kick = { var buffer = b.kick; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * 0.05, loop:0)!2 * \amp.kr(0.5) }

// - 0:15:55.61 -  
(
NPdef(~kick, 
	Pbind(
		\ratio, 0.5,
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1,1,1,1,1,1,1,1,2]/2, inf)
	)
).play(quant:4)
);

// - 0:16:6.59 -  
(
NPdef(~kick, 
	Pbind(
		\ratio, 0.5,
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1,1,1,1,1,1,1,1,2], inf)
	)
).play(quant:4)
);

// - 0:16:20.65 -  
(
NPdef(~kick, 
	Pbind(
		\ratio, Pwhite(0.3, 0.75, inf),
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1,1,1,1,1,1,1,1,2], inf)
	)
).play(quant:4)
);

// - 0:16:32.57 -  
(
NPdef(~kick, 
	Pbind(
		\ratio, Pwhite(0.45, 0.55, inf),
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1,1,1,1,1,1,1,1,2], inf)
	)
).play(quant:4)
);

// - 0:16:37.3 -  
~kick = { var buffer = b.kick; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * 0.1, loop:0)!2 * \amp.kr(0.5) }

// - 0:16:57.38 -  
"comb#buf#20".xx

// - 0:16:57.79 -  
~buf[20] = \filter -> { |in| CombC.ar(in, 5, 0.33, 2) }

// - 0:17:2.38 -  
~buf[0] = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1), \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:17:9.59 -  
~buf[20] = \filter -> { |in| CombC.ar(in, 5, 0.125, 0.5) }

// - 0:17:22.17 -  
~buf[20] = \filter -> { |in| CombC.ar(in, 5, 0.133, 0.5) }

// - 0:17:35.09 -  
q = ()

// - 0:18:19.54 -  
q.melody = PatternProxy(Pshuf([0,1,4,5,4,5,11].midiratio, inf));

// - 0:18:28.27 -  
(
NPdef(~buf,
	Pbind(
		\ratio, q.melody, 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([3.5,0.5,1,1,2,4,3.75,0.25]/4, inf)
	)
).play(quant:4)
);

// - 0:18:46.65 -  
q.melody = PatternProxy(Pseq([0,1,0,4,5].midiratio, inf));

// - 0:19:38.27 -  
q.rhythm = PatternProxy(Pseq([1]/4, inf))

// - 0:19:45.98 -  
(
NPdef(~buf,
	Pbind(
		\ratio, q.melody, 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, q.rhythm
	)
).play(quant:4)
);

// - 0:20:7.5 -  
q.rhythm.source_(Pseq([1]/8, inf))

// - 0:20:10.65 -  
q.rhythm.source_(Pseq([1]/4, inf))

// - 0:20:22.55 -  
q.rhythm.source_(Pseq([3,2,2,3,4,2,3,1,1]/4, inf))

// - 0:20:34.8 -  
(
NPdef(~kick, 
	Pbind(
		\ratio, Pwhite(0.45, 0.55, inf),
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1,1,1,1,1,1,1,1,2]/2, inf)
	)
).play(quant:4)
);

// - 0:20:45.97 -  
(
NPdef(~kick, 
	Pbind(
		\ratio, Pwhite(0.25, 0.55, inf),
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1,1,1,1,1,1,1,1,2]/2, inf)
	)
).play(quant:4)
);

// - 0:21:17.25 -  
q.melody.source_(Pseq([0,11,10].midiratio, inf))

// - 0:21:38.78 -  
q.melody.source_(Pseq([0,11,10].midiratio, inf) - Prand([0,12], inf))

// - 0:22:0.19 -  
q.melody.source_(Pseq([0,11,10].midiratio, inf) - Prand([0,0.5], inf))

// - 0:22:30.12 -  
q.melody.source_(Pseq([0,11,10].midiratio, inf) + Prand([0, 0.5, 0.75, -0.5, -0.75], inf))

// - 0:22:40.44 -  
q.melody.source_(Pseq([0,11,10].midiratio, inf) + Prand([0, 0.5, 0.75, -0.5], inf))

// - 0:22:46.52 -  
q.melody.source_(Pseq([0,11,10].midiratio, inf) + Prand([0, 0.5, 0.25, -0.5], inf))

// - 0:22:56.25 -  
q.rhythm.source_(Pseq([1]/2, inf))

// - 0:23:47.37 -  
q.melody.source_(Pseq([0,11,10].midiratio, inf) + Prand([0, -0.5], inf))

// - 0:24:9.57 -  
q.melody = PatternProxy(Pseq([0,1,0,4,5,-3].midiratio, inf));

// - 0:24:22.86 -  
q.melody.source_(Pseq([0,11,10, -3].midiratio, inf) + Prand([0, -0.5], inf))

// - 0:24:27.57 -  
(
NPdef(~buf,
	Pbind(
		\ratio, q.melody, 
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, q.rhythm
	)
).play(quant:4)
);

// - 0:25:43.39 -  
q.melody.source_(Pseq([0,1,11,10,].midiratio, inf) + Prand([0, -0.5], inf))

// - 0:26:0.89 -  
(
NPdef(~kick, 
	Pbind(
		\ratio, Pwhite(0.25, 0.55, inf),
		\t_trig, 1, 
		\amp, Pseq([1], inf), 
		\dur, Pseq([1], inf)
	)
).play(quant:4)
);

// - 0:26:43.23 -  
~buf[20] = \filter -> { |in| in + (SinOsc.ar(40) ring4: in) }

// - 0:27:4.21 -  
TempoClock.default.tempo = 1

// - 0:27:8.69 -  
TempoClock.default.tempo = 1.05

// - 0:27:26.11 -  
~kick = { var buffer = b.kick; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,1.5], \t_trig.kr(1), BufFrames.kr(buffer) * 0.1, loop:0)!2 * \amp.kr(0.5) }

// - 0:27:31.41 -  
~kick = { var buffer = b.kick; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,1.5], \t_trig.kr(1), BufFrames.kr(buffer) * 0.1, loop:0) * \amp.kr(0.5) }

// - 0:27:46.77 -  
~buf[0] = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,2], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1)!2 * \amp.kr(0.5) }

// - 0:27:50.29 -  
~buf[0] = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,2], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1) * \amp.kr(0.5) }

// - 0:27:56.36 -  
~buf[0] = { var buffer = b.sample1; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,2], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1).sum!2 * \amp.kr(0.5) }

// - 0:28:37.48 -  
~buf[0] = { var buffer = b.sample2; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,2], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1).sum!2 * \amp.kr(0.5) }

// - 0:28:45.87 -  
~buf[0] = { var buffer = b.sample2; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [2,3], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1).sum!2 * \amp.kr(0.5) }

// - 0:28:53.14 -  
~buf[0] = { var buffer = b.sample2; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,3], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1).sum!2 * \amp.kr(0.5) }

// - 0:28:56.4 -  
~buf[0] = { var buffer = b.sample2; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,2], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1).sum!2 * \amp.kr(0.5) }

// - 0:29:2.59 -  
~buf[0] = { var buffer = b.sample2; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,2], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1).sum!2 * \amp.kr(0.5) }

// - 0:29:11.16 -  
~buf[0] = { var buffer = b.sample2; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1).lag(0.01) * [1,2], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1).sum!2 * \amp.kr(0.5) }

// - 0:29:16.06 -  
~buf[0] = { var buffer = b.sample2; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1).lag(0.1) * [1,2], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.3, 0.5), loop:1).sum!2 * \amp.kr(0.5) }

// - 0:29:43.36 -  
~buf[20] = \filter -> { |in| in + (SinOsc.ar(LFNoise2.kr(4).range(20,80)) ring4: in) }

// - 0:29:53.28 -  
~buf[20] = \filter -> { |in| in + (SinOsc.ar(LFNoise2.kr(4).range(20,80)) ring1: in) }

// - 0:29:57.14 -  
~buf[20] = \filter -> { |in| in + (SinOsc.ar(LFNoise2.kr(4).range(20,80)) ring2: in) }

// - 0:30:0.88 -  
~buf[20] = \filter -> { |in| in + (SinOsc.ar(LFNoise2.kr(4).range(20,80)) ring3: in) }

// - 0:30:3.46 -  
~buf[20] = \filter -> { |in| in + (SinOsc.ar(LFNoise2.kr(4).range(20,80)) ring4: in) }

// - 0:30:12.54 -  
~buf[20] = \filter -> { |in| in - (SinOsc.ar(LFNoise2.kr(4).range(20,80)) ring4: in) }

// - 0:30:20.05 -  
~buf[20] = \filter -> { |in| in + (SinOsc.ar(LFNoise2.kr(4).range(20,80)) ring4: in) }

// - 0:30:30.85 -  
~piano.play

// - 0:31:5.53 -  
q.melody.source_(Pseq([0,3,11,10,].midiratio, inf) + Prand([0, -0.5], inf))

// - 0:31:25.58 -  
q.melody.source_(Pseq([0,3,12,10,].midiratio, inf) + Prand([0, -0.5], inf))

// - 0:32:1.13 -  
q.melody.source_(Pseq([0,3,12,10,].midiratio, inf))

// - 0:32:10.46 -  
q.melody.source_(Pseq([0,3,12,10,4].midiratio, inf))

// - 0:32:15.11 -  
q.melody.source_(Pseq([0,3,12,10,5].midiratio, inf))

// - 0:32:25.47 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1].midiratio, inf))

// - 0:32:38.1 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4].midiratio, inf))

// - 0:32:47.18 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4,-7].midiratio, inf))

// - 0:32:55.68 -  
~kick = { var buffer = b.kick; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,1.5], \t_trig.kr(1), BufFrames.kr(buffer) * 0.5, loop:0) * \amp.kr(0.5) }

// - 0:33:1.24 -  
~kick = { var buffer = b.kick; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1) * [1,1.5], \t_trig.kr(1), BufFrames.kr(buffer) * 0, loop:0) * \amp.kr(0.5) }

// - 0:33:14.54 -  
~buf[0] = { var buffer = b.sample2; PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * \ratio.kr(1).lag(0.1) * [1,2], \t_trig.kr(1), BufFrames.kr(buffer) * LFNoise2.kr(4, 0.5, 0.5), loop:1).sum!2 * \amp.kr(0.5) }

// - 0:33:55.13 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4,-7].midiratio, inf) + 3)

// - 0:33:58.62 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4,-7].midiratio, inf) )

// - 0:34:5.73 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4,-7].midiratio, inf) + 0.5)

// - 0:34:8.68 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4,-7].midiratio, inf) + 0)

// - 0:34:16.39 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4,-7].midiratio, inf) - 0.25)

// - 0:34:24.01 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4,-7].midiratio.scramble, inf) - 0.25)

// - 0:34:28.04 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4,-7].midiratio.scramble, inf) )

// - 0:34:37.39 -  
q.melody.source_(Pseq([0,3,12,10,5,3,1,-4,-7].midiratio.scramble, inf) )

// - 0:34:47.95 -  
p.end(10)

