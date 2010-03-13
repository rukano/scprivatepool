///////////////////////////////////////////////////
// History, as it was on Sat Mar 13 15:42:28 2010.
///////////////////////////////////////////////////

// - 0:0:0 -  
"init".xx

// - 0:0:1.32 -  
(
p = ProxySpace.push(s);
p.fadeTime = 0.1;
s.latency = nil;
p.makeTempoClock;
);

// - 0:0:17.07 -  
"loadsamples".xx

// - 0:0:18.27 -  
(
a = ();
"~/dev/__git/scwork/samples/*".pathMatch.do { |samplepath|
	var key = samplepath.basename.split($.).first;
	key = key.split($_).last.asSymbol;
	a[key] ? a[key] = Buffer.read(s, samplepath)
}
);

// - 0:0:37.74 -  
"np#samp".xx

// - 0:1:0.58 -  
(
~samp[0]= Pbind(
	\instrument, \player,
	\buffer, a.internet,
	\amp, Pseq([0.5], inf), 
	\dur, Pseq([4], inf)
)
);

// - 0:1:4.02 -  
~samp.play

// - 0:1:12.12 -  
a

// - 0:1:17.61 -  
a.keys.dopostln

// - 0:1:31.81 -  
(
"~/dev/__git/scwork/temp/*".pathMatch.do { |samplepath|
	var key = samplepath.basename.split($.).first;
	key = key.split($_).last.asSymbol;
	a[key] ? a[key] = Buffer.read(s, samplepath)
}
);

// - 0:1:34.89 -  
(
~samp[0]= Pbind(
	\instrument, \player,
	\buffer, a.internet,
	\amp, Pseq([0.5], inf), 
	\dur, Pseq([4], inf)
)
);

// - 0:2:6.61 -  
(
SynthDef(\player, { |out, buffer, amp=1, pan=0, sustain=0.1, rate=1, t_trig=1, start=0, loop=0|
	var snd = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate, t_trig, BufFrames.kr(buffer) * start, loop);
	snd = snd * EnvGen.ar(Env.linen(0,sustain,0.2), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
}).add;
);

// - 0:2:22.33 -  
"eq#samp#10".xx

// - 0:2:24 -  
~samp[10] = \filter -> { |in| MidEQ.ar(in, 220, 0.5, 6) }

// - 0:4:54.94 -  
~samp[10] = \filter -> { |in| MidEQ.ar(in, 220, 0.5, -24) }

// - 0:4:59.98 -  
~samp[10] = \filter -> { |in| MidEQ.ar(in, 2200, 0.5, -24) }

// - 0:5:12.74 -  
~samp[10] = \filter -> { |in| MidEQ.ar(in, 8000, 1, -48) }

// - 0:5:50.36 -  
~samp[10] = \filter -> { |in| MidEQ.ar(in, [440, 8000], [0.1,1], [16,-48]) }

// - 0:5:58.1 -  
~samp[10] = \filter -> { |in| MidEQ.ar(in, [440, 8000], [0.5,1], [16,-48]) }

// - 0:6:7.07 -  
~samp[10] = \filter -> { |in| MidEQ.ar(in, [440, 8000], [0.5,1], [16,-48], 0.5) }

// - 0:6:31.56 -  
"filter#samp#11".xx

// - 0:6:34.54 -  
~samp[11] = \filter -> { |in| RLPF.ar(in, \ffreq.kr(220), 0.1) }

// - 0:6:57.5 -  
~ffreq = { MouseX.kr(220,8000) }

// - 0:7:7.74 -  
~samp.map(\ffreq, ~ ffreq)

// - 0:7:13.18 -  
~samp[11] = \filter -> { |in| RLPF.ar(in, \ffreq.kr(220), 0.5) }

// - 0:7:45.74 -  
~ffreq = { LFNoise2.kr(4,2000,5000) }

// - 0:7:55.14 -  
~samp[10] = \filter -> { |in| MidEQ.ar(in, [440, 880], [0.5,1], [16,-48], 0.5) }

// - 0:7:59.93 -  
~samp[10] = \filter -> { |in| MidEQ.ar(in, [440, 880], [0.5,1], [16,12], 0.5) }

// - 0:8:14.9 -  
"delay#samp#5".xx

// - 0:8:24.1 -  
~samp[5] = \filter -> { |in| DelayC.ar(in, 0.1, [0, 0.001]) }

// - 0:8:58.41 -  
~samp[5] = \filter -> { |in| DelayC.ar(in, 0.1, [0, LFNoise2.kr(1, 0.005, 0.01)]) }

// - 0:9:14.9 -  
~samp[5] = \filter -> { |in| DelayC.ar(in, 0.1, [0, LFNoise2.kr(1).range(0, 0.001)]) }

// - 0:9:23.24 -  
~samp[5] = \filter -> { |in| DelayC.ar(in, 0.1, [0, LFNoise2.kr(1).range(0, 0.01)]) }

// - 0:9:36.85 -  
"reverb#samp#50".xx

// - 0:9:38.8 -  
~samp[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.75, 0.75, 0.99) }

// - 0:10:8.85 -  
~samp[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.33, 0.33, 0.99) }

// - 0:10:15.06 -  
~samp[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.5, 1, 0.99) }

// - 0:10:18.5 -  
~samp[50] = \filterIn -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.5, 1, 0.99) }

// - 0:10:30.36 -  
~samp.set(\wet50, 0.5)

// - 0:10:36.17 -  
~samp.set(\wet50, 0.2)

// - 0:11:2.06 -  
a.keys.dopostln

// - 0:11:11.05 -  
(
~samp[0]= Pbind(
	\instrument, \player,
	\buffer, Pseq([a.internet, a.someone], inf),
	\amp, Pseq([0.5], inf), 
	\dur, Pseq([4], inf)
)
);

// - 0:11:22.45 -  
(
~samp[0]= Pbind(
	\instrument, \player,
	\buffer, Pseq([a.internet, a.someone], inf),
	\amp, Pseq([0.25], inf), 
	\dur, Pseq([4], inf)
)
);

// - 0:11:37.35 -  
(
~samp[0]= Pbind(
	\instrument, \player,
	\buffer, Pseq([a.internet, a.someone], inf),
	\legato, 1,
	\amp, Pseq([0.25], inf), 
	\dur, Pseq([4], inf)
)
);

// - 0:12:0.12 -  
(
SynthDef(\kick, { |out, sustain=1, amp=0.1, saw=1|
	var snd = SinOsc.ar(60)!2;
	snd = snd * EnvGen.ar(Env.perc(0.001, 0.05), doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);

// - 0:12:8.35 -  
"np#kick".xx

// - 0:12:17.93 -  
(
~kick[0]= Pbind(
	\instrument, \kick,
	\amp, Pseq([0.1], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:12:21.25 -  
~kick.play

// - 0:12:32.2 -  
(
~kick[0]= Pbind(
	\instrument, \kick,
	\amp, Pseq([0.5], inf), 
	\dur, Pseq([1]/2, inf)
)
);

// - 0:12:55.53 -  
(
~kick[0]= Pbind(
	\instrument, \kick,
	\amp, Pseq([1], inf), 
	\dur, Pseq([1]/2, inf)
)
);

// - 0:13:21.29 -  
(
s.boot;

	// add a few global filter functions to use - these are then available by name.
ProxyChain.add(
	\leakDC,  \filter -> { |in, leak=0.99| LeakDC.ar(in, leak) },
	\rollClip, \filter -> { |in, clip=0.99, pole=0.2|
		OnePole.ar(in.clip2(clip), pole ** 0.7);
	},
	\krush, \filter -> { |in, bits=16, downsamp=2| 
		var down;
		in = in.round(0.5 ** bits);
		down = Latch.ar(in, Impulse.ar(SampleRate.ir / downsamp.max(2))); 
			// below 1/2 downsamp, do xfade:
		blend(in, down, (downsamp - 1).clip(0, 1));
	},
	\ampFin, \filter -> { |in, limDrive=1, ampLimit=0.8, postAmp=1 | 
		Limiter.ar(in * limDrive, ampLimit) * postAmp;
	}
);
	// and specs for them fof gui control.
Spec.add(\leak, [0.5, 0.999, \exp]);
Spec.add(\clip, [0.0, 1, \amp]);
Spec.add(\pole, [0, 0.95, \lin]);

Spec.add(\bits, [16, 1]);
Spec.add(\downsamp, [1, 100, \exp]);

Spec.add(\limDrive, \ampx4);
Spec.add(\ampLimit, \amp);
Spec.add(\postAmp, \ampx4);
);

// - 0:13:26.77 -  
(
m = MasterFX.new(server: s, 
	numChannels: 8, 
	slotNames: [\leakDC, \krush, \rollClip, \ampFin], 
	busIndex: 0);
m.gui(nSliders: 12);
);

// - 0:15:30.63 -  
(
SynthDef(\ping, { |out, freq=440, sustain=1, amp=0.1, gate=1|
	var snd = Splay.ar(SinOsc.ar(freq * [1,2,3,4], mul:0.25));
	snd = snd * EnvGen.ar(Env.adsr(0.01, 0.1, sustain, 0.1), gate, doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);

// - 0:15:38.35 -  
"np#ping".xx

// - 0:15:56.62 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 4,
	\degree, Pseq([0], inf),
	\sustain, 0.05,
	\amp, Pseq([0.1], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:16:0.29 -  
~ping.play

// - 0:16:2.77 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 4,
	\degree, Pseq([0], inf),
	\sustain, 0.05,
	\amp, Pseq([0.1], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:16:8.32 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 4,
	\degree, Pseq([0], inf),
	\sustain, 0.05,
	\amp, Pseq([0.25], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:16:34.66 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, [3],
	\degree, Pseq([0], inf),
	\sustain, 0.05,
	\amp, Pseq([0.25], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:16:39.05 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 3,
	\degree, Pseq([0], inf),
	\sustain, 0.05,
	\amp, Pseq([0.25], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:16:48.59 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 3,
	\degree, Pseq([0,4], inf),
	\sustain, 0.05,
	\amp, Pseq([0.25], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:16:54.21 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 3,
	\degree, Pseq([0,4], inf),
	\sustain, 0.05,
	\amp, Pseq([0.5], inf), 
	\dur, Pseq([1], inf)
)
);

// - 0:17:26.23 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 3,
	\degree, Pseq([0,4,1,2], inf),
	\sustain, 0.05,
	\amp, Pseq([0.5], inf), 
	\dur, Pseq([2,2,4,2,2,1,1,4]/4, inf)
)
);

// - 0:17:56.21 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 3,
	\degree, Pseq([0,4,1,2], inf),
	\legato, Pwhite(0.1,0.8),
	\amp, Pseq([0.5], inf), 
	\dur, Pseq([2,2,4,2,2,1,1,4]/4, inf)
)
);

// - 0:18:42.7 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 3,
	\degree, Pseq([0,4,1,2,1,1,2], inf),
	\legato, Pwhite(0.1,0.8),
	\amp, Pseq([0.5], inf), 
	\dur, Pseq([2,2,4,2,2,1,1,4,1,1,2,2,1,2,1,1,2,1,4]/4, inf)
)
);

// - 0:18:53.93 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 3,
	\degree, Pseq([0,4,1,2,1,[1,7],2], inf),
	\legato, Pwhite(0.1,0.8),
	\amp, Pseq([0.5], inf), 
	\dur, Pseq([2,2,4,2,2,1,1,4,1,1,2,2,1,2,1,1,2,1,4]/4, inf)
)
);

// - 0:19:18.56 -  
(
SynthDef(\ping, { |out, freq=440, sustain=1, amp=0.1, gate=1|
	var snd = Splay.ar(SinOsc.ar(freq * [1,2,3,4], mul:0.25));
	snd = snd * EnvGen.ar(Env.adsr(0.01, 0.1, 0.1, 0.1), gate, doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);

// - 0:19:30.38 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 3,
	\degree, Pseq([0,4,1,2,1,[1,7],2], inf),
	\legato, Pwhite(0.1,0.8),
	\amp, Pseq([1], inf), 
	\dur, Pseq([2,2,4,2,2,1,1,4,1,1,2,2,1,2,1,1,2,1,4]/4, inf)
)
);

// - 0:19:41.61 -  
(
~ping[0]= Pbind(
	\instrument, \ping,
	\scale, Scale.minor,
	\octave, 3,
	\degree, Pseq([0,4,1,2,1,[1,7],2], inf),
	\legato, Pwhite(0.1,0.8),
	\amp, Pwhite(0.8,1.0, inf), 
	\dur, Pseq([2,2,4,2,2,1,1,4,1,1,2,2,1,2,1,1,2,1,4]/4, inf)
)
);

// - 0:19:54.19 -  
"comp#ping#1".xx

// - 0:19:54.98 -  
~ping[1] = \filter -> { |in| Compander.ar(in, in, 0.25, 0.5, 0.5, 0.01, 0.1) }

// - 0:20:11.35 -  
(
SynthDef(\ping, { |out, freq=440, sustain=1, amp=0.1, gate=1|
	var snd = Splay.ar(SinOsc.ar(freq * [1,2,3,4], mul:0.25));
	snd = snd * EnvGen.ar(Env.adsr(0.025, 0.1, 0.1, 0.1), gate, doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);

// - 0:20:17.64 -  
(
SynthDef(\ping, { |out, freq=440, sustain=1, amp=0.1, gate=1|
	var snd = Splay.ar(SinOsc.ar(freq * [1,2,3,4], mul:0.25));
	snd = snd * EnvGen.ar(Env.adsr(0.001, 0.1, 0.1, 0.1), gate, doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);

// - 0:20:22.93 -  
~ping[1] = \filter -> { |in| Compander.ar(in, in, 0.25, 0.5, 0.8, 0.01, 0.1) }

// - 0:20:26.5 -  
~ping[1] = \filter -> { |in| Compander.ar(in, in, 0.25, 0.1, 0.8, 0.01, 0.1) }

// - 0:20:37.37 -  
~ping[1] = \filter -> { |in| Compander.ar(in, in, 0.1, 0.1, 0.8, 0.01, 0.1) }

// - 0:21:0.33 -  
(
~samp[0]= Pbind(
	\instrument, \player,
	\buffer, Pseq([a.internet, a.someone], inf),
	\legato, 1,
	\amp, Pseq([0.25], inf), 
	\dur, Pseq([4,6,2], inf)
)
);

// - 0:21:22.21 -  
"ring#ping#10".xx

// - 0:21:45.99 -  
~ping[10] = \filter -> { |in| in ring1: SinOsc.ar(\freq.kr(400) * 2) }

// - 0:21:49.7 -  
~ping[10] = \filter -> { |in| in ring1: SinOsc.ar(\freq.kr(200) * 2) }

// - 0:21:57.87 -  
~ping[10] = \filter -> { |in| in ring1: SinOsc.ar(200) }

// - 0:22:21.28 -  
~ping[10] = \filter -> { |in| in ring1: SinOsc.ar((60-12).midicps) }

// - 0:22:34.99 -  
~ping[10] = \filter -> { |in| in ring1: SinOsc.ar((60-12).midicps, mul:0.5) }

// - 0:22:38.02 -  
~ping[10] = \filter -> { |in| in ring1: SinOsc.ar((60-12).midicps, mul:0.1) }

// - 0:23:4.27 -  
(
~kick[0]= Pbind(
	\instrument, \kick,
	\amp, Pseq([1,0,0,0,1,0,0,1,1,1,1,1], inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:23:30.03 -  
(
~kick[0]= Pbind(
	\instrument, \kick,
	\amp, Pseq([1,0,1,1,0,0,1,1,0,1,0,1,0,1,0,1,1,1,0,1,1], inf), 
	\dur, Pseq([1]/4, inf)
)
);

// - 0:24:45.56 -  
"np#piano".xx

// - 0:25:3.75 -  
a.epiano1

// - 0:25:37.73 -  
(
~piano[0]= Pbind(
	\instrument, \player,
	\buffer, a.epiano1,
	\sustain, Pwhite(0.1, 2.0),
	\amp, Pseq([0.1], inf), 
	\dur, Prand([2,4,1]/4, inf)
)
);

// - 0:25:42.1 -  
~piano.play

// - 0:26:4.81 -  
(
~piano[0]= Pbind(
	\instrument, \player,
	\rate, -3.midiratio,
	\buffer, a.epiano1,
	\sustain, Pwhite(0.1, 2.0),
	\amp, Pseq([0.1], inf), 
	\dur, Prand([2,4,1]/4, inf)
)
);

// - 0:26:13.43 -  
(
~piano[0]= Pbind(
	\instrument, \player,
	\rate, -7.midiratio,
	\buffer, a.epiano1,
	\sustain, Pwhite(0.1, 2.0),
	\amp, Pseq([0.1], inf), 
	\dur, Prand([2,4,1]/4, inf)
)
);

// - 0:26:20.45 -  
(
~piano[0]= Pbind(
	\instrument, \player,
	\rate, -7.midiratio,
	\buffer, a.epiano1,
	\sustain, Pwhite(0.1, 2.0),
	\amp, Pseq([0.5], inf), 
	\dur, Prand([2,4,1]/4, inf)
)
);

// - 0:26:25.95 -  
(
~piano[0]= Pbind(
	\instrument, \player,
	\rate, -7.midiratio,
	\buffer, a.epiano1,
	\sustain, Pwhite(0.1, 2.0),
	\amp, Pseq([0.25], inf), 
	\dur, Prand([2,4,1]/4, inf)
)
);

// - 0:26:41.88 -  
(
~piano[0]= Pbind(
	\instrument, \player,
	\rate, -7.midiratio,
	\buffer, a.epiano1,
	\start, Pwhite(0.0, 0.7),
	\sustain, Pwhite(0.1, 2.0),
	\amp, Pseq([0.25], inf), 
	\dur, Prand([2,4,1]/4, inf)
)
);

// - 0:26:56.93 -  
"reverb#piano#50".xx

// - 0:26:58.1 -  
~piano[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.75, 0.75, 0.99) }

// - 0:27:5.22 -  
"comp#piano#10".xx

// - 0:27:7.88 -  
~piano[10] = \filter -> { |in| Compander.ar(in, in, 0.25, 0.5, 0.5, 0.01, 0.1) }

// - 0:27:13.52 -  
~piano[10] = \filter -> { |in| Compander.ar(in, in, 0.25, 0.5, 0.5, 0.01, 0.1) * 0.1}

// - 0:27:17.02 -  
~piano[10] = \filter -> { |in| Compander.ar(in, in, 0.25, 0.5, 0.5, 0.01, 0.1) * 0.2}

// - 0:27:44.69 -  
(
~piano[0]= Pbind(
	\instrument, \player,
	\rate, Prand([-7,-8,-10].midiratio, inf),
	\buffer, a.epiano1,
	\start, Pwhite(0.0, 0.7),
	\sustain, Pwhite(0.1, 2.0),
	\amp, Pseq([0.25], inf), 
	\dur, Prand([2,4,1]/4, inf)
)
);

// - 0:29:5.69 -  
(
~piano[0]= Pbind(
	\instrument, \player,
	\rate, Prand(([-7,-8,-10]+12).midiratio, inf),
	\buffer, a.epiano1,
	\start, Pwhite(0.0, 0.7),
	\sustain, Pwhite(0.1, 2.0),
	\amp, Pseq([0.25], inf), 
	\dur, Prand([2,4,1]/4, inf)
)
);

// - 0:29:27.17 -  
~piano[50] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 0.1, 0.1, 0.99) }

// - 0:29:36.74 -  
"comb#piano#20".xx

// - 0:29:37.26 -  
~piano[20] = \filter -> { |in| CombC.ar(in, 5, 0.33, 2) }

// - 0:29:57.8 -  
p.end(20)

