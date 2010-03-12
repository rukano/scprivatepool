///////////////////////////////////////////////////
// History, as it was on Fri Mar 12 21:32:17 2010.
///////////////////////////////////////////////////

// EDIT: the initial Synth Def...

(
SynthDef(\player, { |out, buffer, amp=1, pan=0, sustain=0.1, rate=1, t_trig=1, start=0, loop=0|
	var snd = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate, t_trig, BufFrames.kr(buffer) * start, loop);
	snd = snd * EnvGen.ar(Env.linen(0,sustain,0), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
}).add;
);


// - 0:0:0 -  
p = ProxySpace.push(s);

// - 0:0:0.51 -  
p.fadeTime = 0.1;

// - 0:0:0.99 -  
s.latency = nil;

// - 0:0:2.55 -  
a = ();

// - 0:0:4.37 -  
(
"~/dev/__git/scwork/samples/*".pathMatch.do { |samplepath|
	var key = samplepath.basename.split($.)[0].asSymbol;
	a[key] = Buffer.read(s, samplepath)
}
);

// - 0:0:6.12 -  
a.keys.dopostln

// - 0:0:6.87 -  
a.choose

// - 0:0:9.6 -  
~sampler[0] = Pbind(\instrument, \player, \buffer, Prand([a.epiano1, a.epiano2], inf), \start, Pwhite(0.0, 0.1, inf), \legato, 1.5, \dur, 0.5)

// - 0:0:11.31 -  
~sampler.play

// - 0:0:20.11 -  
~sampler[0] = Pbind(\instrument, \player, \buffer, Prand([a.epiano1, a.epiano2], inf), \start, Pwhite(0.0, 0.25, inf), \legato, 1.5, \dur, 0.5)

// - 0:0:46.7 -  
~sampler[0] = Pbind(\instrument, \player, \buffer, Prand([a.epiano1, a.epiano2], inf), \start, Pwhite(0.0, 0.25, inf), \legato, 1.5, \amp, Pwhite(0.1,0.25, inf), \dur, 0.5)

// - 0:0:58.54 -  
~sampler[0] = Pbind(\instrument, \player, \buffer, Prand([a.epiano1, a.epiano2], inf), \start, Pwhite(0.0, 0.25, inf), \legato, 1.5, \amp, Pwhite(0.1,0.5), \dur, 0.5)

// - 0:1:15.9 -  
~sampler[0] = Pbind(\instrument, \player, \buffer, Prand([a.epiano1, a.epiano2], inf), \start, Pwhite(0.0, 0.25, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:1:25.93 -  
~sampler[0] = Pbind(\instrument, \player, \buffer, Prand([a.epiano1, a.epiano2], inf), \start, Pwhite(0.0, 0.1, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:1:50.28 -  
~sampler[0] = Pbind(\instrument, \player, \buffer, Prand([a.epiano1, a.epiano2], inf), \rate, Prand([1,2], inf), \start, Pwhite(0.0, 0.1, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:2:10.89 -  
"filter#sampler#10".xx

// - 0:2:18.4 -  
~sampler[10] = \filter -> { |in| RLPF.ar(in, \ffreq.kr(800), 0.1) }

// - 0:3:6.31 -  
~lfnoise = { LFNoise2.kr(4).range(200,1200) }

// - 0:3:16.7 -  
~sampler.map(\ffreq, ~lfnoise)

// - 0:3:20.62 -  
~lfnoise = { LFNoise2.kr(1).range(200,1200) }

// - 0:3:39.11 -  
"comb#sampler#20".xx

// - 0:3:49.07 -  
~sampler[20] = \filter -> { |in| CombC.ar(in, 10, 1, 8) }

// - 0:4:6.28 -  
~sampler[0] = Pbind(\instrument, \player, \buffer, Prand([a.epiano1, a.epiano2], inf), \rate, Prand([1,2,4]/2, inf), \start, Pwhite(0.0, 0.1, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:4:22.54 -  
~sampler[0] = Pbind(\instrument, \player, \buffer, Prand([a.epiano1, a.epiano2], inf), \rate, Prand([1,2,4]/2, inf), \start, Pwhite(0.1, 0.2, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:4:58.23 -  
(
SynthDef(\player, { |out, buffer, amp=1, pan=0, sustain=0.1, rate=1, t_trig=1, start=0, loop=0|
	var snd = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate, t_trig, BufFrames.kr(buffer) * start, loop);
	snd = snd * EnvGen.ar(Env.linen(0,sustain,0), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
}).add;
);

// - 0:5:19.94 -  
~sampler[0] = Pbind(\instrument, \player, \loop, 1, \buffer, Prand([a.epiano1, a.epiano2], inf), \rate, Prand([1,2,4]/2, inf) * Prand([1,-1], inf), \start, Pwhite(0.1, 0.2, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:5:44.67 -  
~sampler[20] = \filter -> { |in| CombC.ar(in, 10, 1, 4) }

// - 0:5:44.97 -  
~sampler[21] = \filter -> { |in| CombC.ar(in, 10, 0.25, 4) }

// - 0:5:53.01 -  
~sampler[21] = \filter -> { |in| CombC.ar(in, 10, 0.5, 4) }

// - 0:5:58.34 -  
p.fadeTime = 1;

// - 0:6:30.3 -  
a.keys.dopostln

// - 0:7:1.54 -  
~kick[0] = Pbind(\instrument, \player, \loop, 1, \buffer, a.kick, \sustain, 0.1, \amp, Prand([0.5], inf), \dur, 0.5)

// - 0:7:7.99 -  
~kick.play

// - 0:7:18.86 -  
~kick[0] = Pbind(\instrument, \player, \loop, 1, \buffer, a.kick, \sustain, 0.1, \amp, Prand([0.5], inf), \dur, 1)

// - 0:7:28.6 -  
~kick[0] = Pbind(\instrument, \player, \loop, 1, \buffer, a.kick, \rate, 0.7, \sustain, 0.1, \amp, Prand([0.5], inf), \dur, 1)

// - 0:7:43.07 -  
~kick[0] = Pbind(\instrument, \player, \loop, 1, \buffer, a.kick, \rate, 0.7, \sustain, 0.1, \amp, Prand([0.5,1.0], inf), \dur, 1)

// - 0:7:50.66 -  
~kick[0] = Pbind(\instrument, \player, \loop, 1, \buffer, a.kick2, \rate, 0.7, \sustain, 0.1, \amp, Prand([0.5,1.0], inf), \dur, 1)

// - 0:8:5.68 -  
"filter#kick#10".xx

// - 0:8:12.12 -  
~kick[10] = \filter -> { |in| RLPF.ar(in, \ffreq.kr(220), 0.1) }

// - 0:8:16.59 -  
~kick[10] = \filter -> { |in| RLPF.ar(in, \ffreq.kr(220), 0.5) }

// - 0:8:23.37 -  
~kick[10] = \filter -> { |in| LPF.ar(in, \ffreq.kr(220)) }

// - 0:9:8.58 -  
~kick[0] = Pbind(\instrument, \player, \loop, 1, \buffer, a.kick2, \rate, 0.7, \sustain, 0.1, \amp, Prand([0.5,1.0], inf), \dur, Pseq([1,1,1,1,1,2,1]/2, inf))

// - 0:9:26.68 -  
~kick[0] = Pbind(\instrument, \player, \loop, 1, \buffer, a.kick2, \rate, 0.7, \sustain, 0.1, \amp, Prand([0.5,1.0], inf), \dur, Pseq([2,2,2,2,1,2,1]/2, inf))

// - 0:9:42.3 -  
~lfnoise = { LFNoise2.kr(1).range(200,2200) }

// - 0:10:2.21 -  
~sampler[0] = Pbind(\instrument, \player, \loop, 1, \pan, Pwhite(-1.0, 1.0), \buffer, Prand([a.epiano1, a.epiano2], inf), \rate, Prand([1,2,4]/2, inf) * Prand([1,-1], inf), \start, Pwhite(0.1, 0.2, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:10:20.3 -  
~sampler[0] = Pbind(\instrument, \player, \loop, 1, \pan, Pwhite(-1.0, 1.0), \buffer, Prand([a.epiano1, a.epiano2], inf), \rate, Prand([1,2,4]/2, inf) * Prand([1,-1], inf), \start, Pwhite(0.1, 0.2, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:10:40.24 -  
"np#ping".xx

// - 0:10:43.9 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 4,
	\degree, Pseq([0], inf),
	\amp, Pseq([0.1], inf), 
	\dur, Pseq([1], inf)
)
)

// - 0:10:47.42 -  
~ping.play

// - 0:11:3.61 -  
(
SynthDef(\ping, { |out, freq=440, sustain=1, amp=0.1, gate=1|
	var snd = SinOsc.ar(freq);
	snd = snd * EnvGen.ar(Env.adsr(0.01, 0.1, sustain, 0.1), gate, doneAction:2);
	OffsetOut.ar(out, snd!2 * amp)
}).add;
);

// - 0:11:22.86 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -2,
	\octave, 4,
	\degree, Pseq([0], inf),
	\amp, Pseq([0.1], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:11:27.26 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -5,
	\octave, 4,
	\degree, Pseq([0], inf),
	\amp, Pseq([0.1], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:11:45.65 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -5,
	\octave, 4,
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:12:2.06 -  
~sampler[0] = Pbind(\instrument, \player, \loop, 1, \pan, Pwhite(-1.0, 1.0), \buffer, Prand([a.epiano1, a.epiano2], inf), \rate, Prand([1,2,4]/3, inf) * Prand([1,-1], inf), \start, Pwhite(0.1, 0.2, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:12:7.26 -  
~sampler[0] = Pbind(\instrument, \player, \loop, 1, \pan, Pwhite(-1.0, 1.0), \buffer, Prand([a.epiano1, a.epiano2], inf), \rate, Prand([1,2,4]/4, inf) * Prand([1,-1], inf), \start, Pwhite(0.1, 0.2, inf), \legato, 1.5, \amp, Prand([0.1,0.5], inf), \dur, 0.5)

// - 0:12:17.13 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -5,
	\octave, 3,
	
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:12:24.14 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -5,
	\octave, 5,
	
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:12:38.56 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -5,
	\octave, 5,
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:12:47.39 -  
~ping.clock

// - 0:13:6.1 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -5,
	\octave, [5,6],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:13:14.41 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -5,
	\octave, [5,6],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.25, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:13:52.4 -  
(
SynthDef(\ping, { |out, freq=440, sustain=1, amp=0.1, gate=1|
	var snd = Splay.ar(SinOsc.ar(freq * [1,2.5,3.33,4.25], mul:0.25));
	snd = snd * EnvGen.ar(Env.adsr(0.01, 0.1, sustain, 0.1), gate, doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);

// - 0:14:3.72 -  
(
SynthDef(\ping, { |out, freq=440, sustain=1, amp=0.1, gate=1|
	var snd = Splay.ar(SinOsc.ar(freq * [1,2,3,4], mul:0.25));
	snd = snd * EnvGen.ar(Env.adsr(0.01, 0.1, sustain, 0.1), gate, doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);

// - 0:14:16.33 -  
~sampler[0] = Pbind(\instrument, \player, \loop, 1, \pan, Pwhite(-1.0, 1.0), \buffer, Prand([a.epiano1, a.epiano2], inf), \rate, Prand([1,2,4]/4, inf) * Prand([1,-1], inf), \start, Pwhite(0.1, 0.2, inf), \legato, 1.5, \amp, Prand([0.1,0.25], inf), \dur, 0.5)

// - 0:15:18.16 -  
~sampler[21] = \filter -> { |in| CombC.ar(in, 10, 0.25, 2) }

// - 0:15:19.68 -  
~sampler[20] = \filter -> { |in| CombC.ar(in, 10, 1, 2) }

// - 0:15:29.66 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -5,
	\octave, [4,5,6],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.25, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:15:35.46 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, -5,
	\octave, [4,5,6],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:15:52.16 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, 2,
	\octave, [4,5,6],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:16:6.36 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, Prand([-5, 2], inf),
	\octave, [4,5,6],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:16:18.56 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, Pwrand([-5, 2], [0.9, 0.1], inf),
	\octave, [4,5,6],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:16:26.91 -  
p.makeTempoClock

// - 0:16:33.02 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, Pwrand([-5, 2], [0.9, 0.1], inf),
	\octave, [4,5,6],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:16:35.14 -  
(
~sampler[0] = Pbind(
	\instrument, \player,
	\loop, 1,
	\pan, Pwhite(-1.0, 1.0),
	\buffer, Prand([a.epiano1, a.epiano2], inf),
	\rate, Prand([1,2,4]/4, inf) * Prand([1,-1], inf),
	\start, Pwhite(0.1, 0.2, inf),
	\legato, 1.5,
	\amp, Prand([0.1,0.25], inf),
	\dur, 0.5
)
);

// - 0:17:29.04 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, Pwrand([-5, 2], [0.9, 0.1], inf),
	\octave, [4,5,6],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0,4,3,4,7], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:17:40.24 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\ctranspose, Pwrand([-5, 2], [0.9, 0.1], inf),
	\octave, [4,5],
	\legato, Pwhite(0.1,1.1),
	\degree, Pseq([0,4,3,4,7], inf),
	\amp, Pwhite(0.01,0.5, inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:18:1.2 -  
"comp#ping#50".xx

// - 0:18:1.63 -  
~ping[50] = \filter -> { |in| Compander.ar(in, in, 0.25, 0.5, 0.5, 0.01, 0.1) }

// - 0:18:12.39 -  
~ping[50] = \filter -> { |in| Compander.ar(in, in, 0.25, 0.5, 0.5, 0.01, 0.1) * 0.5 }

// - 0:18:20.58 -  
StageLimiter.activate

// - 0:18:43.41 -  
"reverb#ping#60".xx

// - 0:18:44.85 -  
~ping[60] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.75, 0.75, 0.99) }

// - 0:18:53.23 -  
~ping[60] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 1, 1, 0.99) }

// - 0:19:11.61 -  
"ring#ping#51".xx

// - 0:19:15.23 -  
~ping[51] = \filter -> { |in| in ring1: SinOsc.ar(120) }

// - 0:19:28.17 -  
ProxyMixer(p)

// - 0:20:11.57 -  
p.end(5)

