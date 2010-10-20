///////////////////////////////////////////////////
// History, as it was on Wed Oct 20 21:19:44 2010.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s);

// - 0:0:2.03 -  
p.fadeTime = 0.25;

// - 0:0:2.87 -  
s.latency = 0.265;

// - 0:0:5.09 -  
p.makeTempoClock;

// - 0:0:6.75 -  
ProxyMixer(p, 6)

// - 0:0:20.05 -  
~out.play

// - 0:0:57.26 -  
~out = { GVerb.ar(Dust2.ar(4), 240, 12) }

// - 0:1:7.06 -  
p.fadeTime = 1;

// - 0:1:19.11 -  
~out = { GVerb.ar(Dust2.ar(1), 240, 12) * 0.8}

// - 0:1:41.98 -  
~out = { GVerb.ar(Decay2.ar(Dust2.ar(1), 0.001, 0.01), 240, 12) * 0.8 }

// - 0:2:20.68 -  
"gverb#out#10".xx

// - 0:2:23.3 -  
~out[10] = \filter -> { |in| GVerb.ar(in, 120, 8) }

// - 0:2:24.23 -  
~out[0] = { Decay2.ar(Dust2.ar(1), 0.001, 0.01) }

// - 0:2:35.7 -  
~out[0] = { Decay2.ar(Dust2.ar([1,2]), 0.001, 0.01) }

// - 0:2:46.16 -  
~out[10] = \filter -> { |in| GVerb.ar(in, 120, 16) }

// - 0:2:54.94 -  
~out[11] = \filter -> { |in| GVerb.ar(in, 120, 16) }

// - 0:2:59.43 -  
~out[0] = { Decay2.ar(Dust2.ar([1.5,2]), 0.001, 0.01) }

// - 0:3:10.6 -  
~out.fadeTime = 4

// - 0:3:15.73 -  
~out[0] = { Decay2.ar(Dust2.ar([1.5,2]), 0.01, 0.01) }

// - 0:3:24.83 -  
~out[0] = { Decay2.ar(Dust2.ar([1.5,2]), 0.002, 0.01) }

// - 0:3:34.35 -  
~out[11] = \filter -> { |in| GVerb.ar(in, 220, 16) }

// - 0:3:35.91 -  
~out[10] = \filter -> { |in| GVerb.ar(in, 220, 16) }

// - 0:3:55.95 -  
"fb#out#20".xx

// - 0:4:1.74 -  
~out[20] = \filter -> { |in| in + FbC({ |fb| in + fb * 0.85 }, 4, 4) }

// - 0:4:37.25 -  
~out[20] = \filter -> { |in| in + FbC({ |fb| BPF.ar(in + fb, 1200, 3.2).distort * 1.15 }, 4, 2) }

// - 0:5:3.88 -  
~out[0] = { Decay2.ar(Dust2.ar([1.5,2] /2 ), 0.002, 0.01) }

// - 0:5:12.8 -  
~out[0] = { Decay2.ar(Dust2.ar([1.5,2] / 2 ), 0.002, 0.05) }

// - 0:5:25.14 -  
~out[20] = \filter -> { |in| in + FbC({ |fb| BPF.ar(in + fb, 800, 3.2).distort * 1.15 }, 4, 2) }

// - 0:5:37.14 -  
~bass.play

// - 0:5:52.9 -  
~bass[0] = { RLPF.ar(~out.ar, 80, 0.1) }

// - 0:6:8.89 -  
~bass[0] = { RLPF.ar(~out.ar, 120, 0.1) }

// - 0:6:14.68 -  
~bass[0] = { RLPF.ar(~out.ar, 80, 0.1) }

// - 0:6:21.89 -  
~bass[0] = { RLPF.ar(~out.ar, \freq.kr(120), 0.1) }

// - 0:6:27.97 -  
"set#bass".xx

// - 0:6:53.93 -  
(
~bass[1]= \set -> Pbind(
	\freq, Pseq([80, 120], inf),
	\dur, Pseq([4], inf)
);
);

// - 0:7:17.91 -  
(
~bass[1]= \set -> Pbind(
	\freq, Pseq([80, 120, 97], inf),
	\dur, Pseq([4], inf)
);
);

// - 0:7:23.02 -  
~bass[0] = { RLPF.ar(~out.ar, \freq.kr(120), 0.075) }

// - 0:7:40.98 -  
~text.play

// - 0:8:14.57 -  
~text = { FBSineC.ar(8000, 0.1) * 0.1 }

// - 0:8:23.48 -  
~text = { FBSineC.ar(8000 * [1, 1.1], 0.1) * 0.1 }

// - 0:8:28.92 -  
~text = { FBSineC.ar(8000 * [1, 1.1], 0.2) * 0.1 }

// - 0:8:54.68 -  
~text = { FBSineC.ar(8000 * [1, 1.1], LFNoise0.kr(1).range(0.1, 0.5)) * 0.1 }

// - 0:9:16.65 -  
"gverb#text#10".xx

// - 0:9:21.82 -  
~text[10] = \filter -> { |in| GVerb.ar(in, 12, 4) }

// - 0:9:31.14 -  
~text[0] = { FBSineC.ar(18000 * [1, 1.1], LFNoise0.kr(1).range(0.1, 0.5)) * 0.1 }

// - 0:9:41.72 -  
~text[0] = { FBSineC.ar(18000 * [1, 1.1], LFNoise0.kr(1).range(0.5, 1.1)) * 0.1 }

// - 0:9:49.33 -  
~text[0] = { FBSineC.ar(12000 * [1, 1.1], LFNoise0.kr(1).range(0.5, 1.1)) * 0.05 }

// - 0:9:56.81 -  
~text[0] = { FBSineC.ar(10000 * [1, 1.1], LFNoise0.kr(1).range(0.5, 1.1)) * 0.05 }

// - 0:10:0.9 -  
~text[0] = { FBSineC.ar(8000 * [1, 1.1], LFNoise0.kr(1).range(0.5, 1.1)) * 0.05 }

// - 0:10:10.47 -  
~text[0] = { FBSineC.ar(8000 * [1, 1.1], LFNoise0.kr(1).range(1.0, 2.0)) * 0.05 }

// - 0:10:19.21 -  
~text[0] = { FBSineC.ar(8000 * [1, 1.1], LFNoise0.kr(2).range(1.0, 2.0)) * 0.05 }

// - 0:10:30.07 -  
~megabass.play

// - 0:10:57.35 -  
~megabass = { LFPulse.ar(80)!2 * LFPar.ar(1).range(0, 0.1)}

// - 0:11:8.03 -  
~megabass = { LFPulse.ar(80)!2 * LFPar.ar(1).range(0, 0.2)}

// - 0:11:17.59 -  
~megabass = { LFTri.ar(80)!2 * LFPar.ar(1).range(0, 0.2)}

// - 0:11:20.07 -  
~text[0] = { FBSineC.ar(4000 * [1, 1.1], LFNoise0.kr(2).range(1.0, 2.0)) * 0.05 }

// - 0:11:27.23 -  
~megabass = { LFTri.ar(80)!2 * LFPar.ar(1).range(0, 0.5)}

// - 0:11:37.75 -  
~megabass = { LFTri.ar(80)!2 * LFPulse.ar(1).range(0, 0.5)}

// - 0:11:42.84 -  
~megabass = { LFTri.ar(80)!2 * LFPulse.ar(2).range(0, 0.5)}

// - 0:11:53.85 -  
~megabass = { LFTri.ar(40)!2 * LFPulse.ar(2).range(0, 0.5)}

// - 0:11:56.7 -  
~megabass = { LFTri.ar(40)!2 * LFPulse.ar(2).range(0, 1)}

// - 0:12:5.49 -  
~text[0] = { FBSineC.ar(2000 * [1, 1.1], LFNoise0.kr(2).range(1.0, 2.0)) * 0.05 }

// - 0:12:31.66 -  
~megabass = { LFTri.ar(40)!2 * LFPulse.ar(2).range(0, 2) }

// - 0:12:37.79 -  
~megabass = { LFTri.ar(40)!2 * LFPulse.ar(2).range(0, 4) }

// - 0:12:46.97 -  
~megabass = { LFTri.ar(40)!2 * LFPulse.ar(2).range(0, Line.kr()) }

// - 0:12:53.59 -  
~megabass = { LFTri.ar(40)!2 * LFPulse.ar(2).range(0, Line.kr(4, 0, 20)) }

// - 0:13:1.71 -  
~megabass = { LFTri.ar(80)!2 * LFPulse.ar(2).range(0, Line.kr(4, 0, 20)) }

// - 0:14:1.59 -  
~bass[0] = { RLPF.ar(~out.ar, \freq.kr(120), 0.075).max(0) }

// - 0:14:22.74 -  
"gverb#bass#20".xx

// - 0:14:25.24 -  
~bass[20] = \filter -> { |in| GVerb.ar(in, 120, 2) }

// - 0:14:33.39 -  
~bass[20] = \filter -> { |in| GVerb.ar(in, 300, 8) }

// - 0:14:37.82 -  
~bass[20] = \filter -> { |in| GVerb.ar(in, 300, 16) }

