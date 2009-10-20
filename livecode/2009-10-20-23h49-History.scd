///////////////////////////////////////////////////
// History, as it was on Tue Oct 20 23:49:49 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:1.94 -  
~trig1 = { Trig.kr(\t_in.kr, 0.1) };

// - 0:0:4.21 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq([150,120],inf)) };

// - 0:0:5.55 -  
~ton1.play

// - 0:0:10.04 -  
~ton1[0] = { SinOsc.ar(~seq1!2) * 0.1 }

// - 0:0:13.88 -  
(
Tdef(\rhythm_one, {
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		1.wait;
	}
}).play
);

// - 0:0:23.11 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq([150,120,133,154,166],inf)) };

// - 0:0:33.37 -  
~seq.fadeTime = 1

// - 0:1:2 -  
(
Tdef(\rhythm_one, {
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		([1,1.5,2,3,4].choose/2).wait;
	}
}).play
);

// - 0:1:25.57 -  
~ton1[0] = { SinOsc.ar(~seq1!2) * 0.1 * EnvGen.kr(Env.perc, ~trig1)}

// - 0:1:40.79 -  
~ton1[0] = { SinOsc.ar(~seq1!2) * 0.1 * EnvGen.kr(Env.perc(0.01,0.5), ~trig1)}

// - 0:2:11.24 -  
~ton1[0] = { Splay.ar(SinOsc.ar(~seq1*[1,1.5,2,4])) * 0.1 * EnvGen.kr(Env.perc(0.01,0.5), ~trig1)}

// - 0:3:35.48 -  
(
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1]/3;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		seq.wrapAt(i).wait;
	}
}).play
);

// - 0:4:38.21 -  
~ton1.fadeTime = 2

// - 0:4:38.95 -  
~ton1[0] = { Splay.ar(Saw.ar(~seq1*[1,1.5,2,4])) * 0.1 * EnvGen.kr(Env.perc(0.01,0.5), ~trig1)}

// - 0:4:51.05 -  
~ton1[0] = { Splay.ar(SinOsc.ar(~seq1*[1,1.5,2,4])) * 0.1 * EnvGen.kr(Env.perc(0.01,0.5), ~trig1)}

// - 0:5:26.12 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4])) * 0.1 * EnvGen.kr(Env.perc(0.01,0.5), ~trig1)}

// - 0:5:32.37 -  
~ton1[0] = { Splay.ar(SinOsc.ar(~seq1*[1,1.5,2,4])) * 0.1 * EnvGen.kr(Env.perc(0.01,0.5), ~trig1)}

// - 0:5:38.17 -  
~ton1[0] = { Splay.ar(SinOsc.ar(~seq1*[1,1.5,2,4])) * 0.1 * EnvGen.kr(Env.perc(0.01,0.5), ~trig1)}

// - 0:6:4.54 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4]) * 0.1)}

// - 0:6:7.74 -  
~ton1[0] = { Splay.ar(SinOsc.ar(~seq1*[1,1.5,2,4])) * 0.1 * EnvGen.kr(Env.perc(0.01,0.5), ~trig1)}

// - 0:6:16.07 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4]) * 0.01)}

// - 0:6:29.18 -  
~ton1[0] = { Splay.ar(SinOsc.ar(~seq1*[1,1.5,2,4])) * 0.2 * EnvGen.kr(Env.perc(0.01,0.5), ~trig1)}

// - 0:6:43.45 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq([150,120,133,154,166].mirror2,inf)) };

// - 0:6:46.43 -  
~seq.fadeTime = 1

// - 0:6:49.94 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq([150,120,133,154,166].mirror2,inf)) };

// - 0:6:52.36 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq([150,120,133,154,166].mirror2,inf)) };

// - 0:6:54.43 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq([150,120,133,154,166].mirror2,inf)) };

// - 0:6:56.83 -  
~seq.fadeTime = 1

// - 0:6:58.68 -  
~seq1.fadeTime = 1

// - 0:6:59.68 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq([150,120,133,154,166].mirror2,inf)) };

// - 0:7:2.31 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq([150,120,133,154,166].mirror2,inf)) };

// - 0:7:26.18 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4]) * 0.01 * EnvGen.kr(Env.sine, ~trig1))}

// - 0:7:35.71 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4]) * 0.01 * EnvGen.kr(Env.sine(0.1), ~trig1))}

// - 0:7:40.8 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4]) * 0.05 * EnvGen.kr(Env.sine(0.1), ~trig1))}

// - 0:7:56.08 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4]) * 0.05 * EnvGen.kr(Env.perc(0.5,0.01), ~trig1))}

// - 0:8:5.08 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4]) * 0.025 * EnvGen.kr(Env.perc(0.5,0.01), ~trig1))}

// - 0:9:16.75 -  
~ton1[10] = \filter -> { |in| in + Splay.ar(DelayN.ar(in,5,[0,0.1,0.3,0.67,1,1.2,2.3])) }

// - 0:9:38.01 -  
(
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1]/3.5;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		seq.wrapAt(i).wait;
	}
}).play
);

// - 0:9:49.14 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4]) * 0.025 * EnvGen.kr(Env.perc(0.001,0.01), ~trig1))}

// - 0:9:56.11 -  
~ton1[1] = \filter -> { |in| in + Splay.ar(Saw.ar(~seq1*[1,1.5,2,4]) * 0.025 * EnvGen.kr(Env.perc(0.001,0.1), ~trig1))}

// - 0:10:13.94 -  
~bass.play

// - 0:11:31.94 -  
~bass = { (SinOsc.ar(80!2) + RLPF.ar(WhiteNoise.ar, 120, 0.1) * 0.5) * EnvGen.kr(Env.perc(0, 0.01), Impulse.kr(1)) }

// - 0:11:45.55 -  
~bass = { (SinOsc.ar(80!2) + RLPF.ar(WhiteNoise.ar, 120, 0.1) * 0.5) * EnvGen.kr(Env.perc(0, 0.01), ~trig1) }

// - 0:11:51.26 -  
~bass = { (SinOsc.ar(80!2) + RLPF.ar(WhiteNoise.ar, 120, 0.1) * 0.5) * EnvGen.kr(Env.perc(0, 0.05), ~trig1) }

// - 0:11:57.65 -  
~bass = { (SinOsc.ar(80!2) + RLPF.ar(WhiteNoise.ar, 80, 0.1) * 0.5) * EnvGen.kr(Env.perc(0, 0.05), ~trig1) }

// - 0:12:6.07 -  
~bass = { (SinOsc.ar(80!2) + RLPF.ar(WhiteNoise.ar, 80, 0.1) * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.05), ~trig1) }

// - 0:13:30.35 -  
~bass = { (SinOsc.ar(80!2) + RLPF.ar(WhiteNoise.ar, 80, 0.1) * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.05), \t_trig.kr) }

// - 0:13:47.82 -  
(
var ratio = 3.5;
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		seq.wrapAt(i).wait;
	}
}).play;

Tdef(\bass_drum, {
	inf.do{
		~bass.set(\t_trig, 1);
		1/ratio.wait;
	}
}).play;
);

// - 0:14:11.95 -  
(
var ratio = 1;
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		seq.wrapAt(i).wait;
	}
}).play;

Tdef(\bass_drum, {
	inf.do{
		~bass.set(\t_trig, 1);
		1/ratio.wait;
	}
}).play;
);

// - 0:14:30.62 -  
(
var ratio = 4;
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		seq.wrapAt(i).wait;
	}
}).play;

Tdef(\bass_drum, {
	inf.do{
		~bass.set(\t_trig, 1);
		(1/ratio).wait;
	}
}).play;
);

// - 0:14:39.02 -  
var ratio = 3.5;

// - 0:14:42.27 -  
(
var ratio = 3.5;
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		seq.wrapAt(i).wait;
	}
}).play;

Tdef(\bass_drum, {
	inf.do{
		~bass.set(\t_trig, 1);
		(1/ratio).wait;
	}
}).play;
);

// - 0:15:37.09 -  
(
var ratio = 3.5;
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2]/ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:15:59.16 -  
[1,1,2].dup(10)

// - 0:16:12.63 -  
[1,1,2].repeat

// - 0:16:36.71 -  
(
var ratio = 3.5;
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2,1,1,2,1,1,2,1,1,1,1]  / ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:16:48.64 -  
~ton1[10] = \filter -> { |in| in + Splay.ar(DelayN.ar(in,5,[0,0.1,0.3,0.67,1,1.2,2.3,3.5,4])) }

// - 0:17:22.04 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq([150,120,133,154,166,176,184,199,231,123,128,145,176,230,567,123,124,127,129].mirror2,inf)) };

// - 0:17:46.81 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,567,123,124,127,129]-50).mirror2,inf)) };

// - 0:17:55.06 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,267,123,124,127,129]-50).mirror2,inf)) };

// - 0:18:13.8 -  
~bass = { (SinOsc.ar(80!2) + RLPF.ar(WhiteNoise.ar, 80, 0.1) * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.01), \t_trig.kr) }

// - 0:18:26.97 -  
~bass = { (SinOsc.ar(180!2) + RLPF.ar(WhiteNoise.ar, 180, 0.1) * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.01), \t_trig.kr) }

// - 0:18:39.55 -  
~bass = { (SinOsc.ar(60!2) + RLPF.ar(WhiteNoise.ar, 120, 0.01) * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.01), \t_trig.kr) }

// - 0:19:14.38 -  
~reverb.play

// - 0:19:42.91 -  
~reverb[0] = { ~ton1 + ~bass }

// - 0:20:35.45 -  
~reverb[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.8, 0.8, 1) }

// - 0:20:42.59 -  
~reverb[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.2, 0.8, 1) }

// - 0:21:14.08 -  
~reverb[0] = { (~ton1 + ~bass) * SinOsc.kr(44, mul: 0.5) }

// - 0:21:20.91 -  
~reverb[0] = { (~ton1 + ~bass) * SinOsc.kr(44) }

// - 0:21:28.68 -  
~reverb[0] = { (~ton1 + ~bass) * 2 * SinOsc.kr(44) }

// - 0:21:37.74 -  
~reverb[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.2, 0.8, 1) * 0.4}

// - 0:22:0.61 -  
~reverb[0] = { (~ton1 + ~bass) * 2 * SinOsc.kr(80) }

// - 0:22:13.37 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,267,123,124,127,129]-1).mirror2,inf)) };

// - 0:22:21.37 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,267,123,124,127,129]+100).mirror2,inf)) };

// - 0:22:28.01 -  
~bass = { (SinOsc.ar(60!2) + RLPF.ar(WhiteNoise.ar, 120, 0.01) * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.1), \t_trig.kr) }

// - 0:22:37.49 -  
~bass = { (SinOsc.ar(120!2) + RLPF.ar(WhiteNoise.ar, 120, 0.01) * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.1), \t_trig.kr) }

// - 0:22:55.35 -  
~reverb[0] = { (~ton1.ar + ~bass.ar) * 2 * SinOsc.kr(80) }

// - 0:22:58.95 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,267,123,124,127,129]+50).mirror2,inf)) };

// - 0:23:6.69 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,267,123,124,127,129]-50).mirror2,inf)) };

// - 0:23:13.37 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,267,123,124,127,129]-100).mirror2,inf)) };

// - 0:23:21.12 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,267,123,124,127,129]-0).mirror2,inf)) };

// - 0:23:27.12 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,267,123,124,127,129]-50).mirror2,inf)) };

// - 0:23:30.73 -  
~seq1 = { Demand.kr(~trig1, 0, Dseq(([150,120,133,154,166,176,184,199,231,123,128,145,176,230,267,123,124,127,129]-80).mirror2,inf)) };

// - 0:23:35.88 -  
~reverb[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.4, 0.8, 1) * 0.4}

// - 0:23:43.09 -  
~reverb[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.7, 0.8, 1) * 0.4}

// - 0:24:2.65 -  
(
var ratio = 3.5;
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2,1,1,2,1,1,2,1,1,1,1,4,4,4,2,2,1,1,1,4,1,4,1,2,2,2,1,2,1,1,1,2,1,2,1,1,1,2,1,2,1,2]  / ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:24:31.24 -  
(
var ratio = 3.5;
Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1,5,6,1,2,1,4,1,3,2,3,4,2,2,1,1,2,1,2,2,4,2,7,6,2,7,1,2,2,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2,1,1,2,1,1,2,1,1,1,1,4,4,4,2,2,1,1,1,4,1,4,1,2,2,2,1,2,1,1,1,2,1,2,1,1,1,2,1,2,1,2]  / ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:24:41.13 -  
~reverb[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.4, 0.8, 1) * 0.4}

// - 0:24:46.11 -  
~reverb[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.4, 0.8, 1) * 0.1}

// - 0:24:55.81 -  
~bass = { (SinOsc.ar(120!2) + RLPF.ar(WhiteNoise.ar, 120, 0.01) * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.01), \t_trig.kr) }

// - 0:25:2.94 -  
~bass = { (SinOsc.ar(120!2) + RLPF.ar(WhiteNoise.ar, 120, 0.01) * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.01), \t_trig.kr) * 0.1 }

// - 0:25:15.91 -  
~texture.play

// - 0:26:24.69 -  
~texture = { Klang.ar(`(5000,5500..8000), 0.01, 0) }

// - 0:26:30.46 -  
~texture.stop

// - 0:26:54.89 -  
~texture = { Klang.ar(`[(5000,5500..8000), 0.01, 0]) }

// - 0:26:57.84 -  
~texture = { Klang.ar(`[(5000,5500..8000), 0.01, 0]) }

// - 0:26:58.77 -  
~texture.play

// - 0:27:6.8 -  
~texture.stop

// - 0:27:11.53 -  
~texture.fadeTime = 10

// - 0:27:13.43 -  
~texture = { Klang.ar(`[(5000,5500..8000), 0.01, 0]) }

// - 0:27:16.14 -  
~texture.play

// - 0:27:18.64 -  
~texture = { Klang.ar(`[(5000,5500..8000), 0.01, 0]) }

// - 0:27:29.48 -  
~texture = { Klang.ar(`[(200,456..2000), 0.01, 0]) }

// - 0:27:45.53 -  
~texture = { Pan2.ar(Klang.ar(`[(200,456..2000), 0.01, 0]), 0) }

// - 0:28:26.44 -  
~texture = { Pan2.ar(Klang.ar(`[(200,456..2000), 0.01, 0]), 0) * SinOsc.kr(0.1, 0, 0.5, 0.5) }

// - 0:29:10.28 -  
~texture = { Pan2.ar(Klang.ar(`[Array.rand(20, 200, 2000), 0.01, 0]), 0) * SinOsc.kr(0.1, 0, 0.5, 0.5) }

// - 0:29:21.05 -  
~texture = { Pan2.ar(Klang.ar(`[Array.rand(20, 200, 10000), 0.01, 0]), 0) * SinOsc.kr(0.1, 0, 0.5, 0.5) }

// - 0:29:34.94 -  
~texture = { Pan2.ar(Klang.ar(`[Array.rand(20, 200, 10000), 0.01, 0]), 0) * SinOsc.kr(0.1, 0, 0.5, 0.5) * 0.1}

// - 0:30:38.69 -  
(
var ratio = 3.5;

Tdef(\text, {
	inf.do{
		~texture = { Pan2.ar(Klang.ar(`[Array.rand(20, 200, 10000), 0.01, 0]), 0) * EnvGen.kr(Env.sine)};
		4.wait;
	};
}).play;


Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1,5,6,1,2,1,4,1,3,2,3,4,2,2,1,1,2,1,2,2,4,2,7,6,2,7,1,2,2,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2,1,1,2,1,1,2,1,1,1,1,4,4,4,2,2,1,1,1,4,1,4,1,2,2,2,1,2,1,1,1,2,1,2,1,1,1,2,1,2,1,2]  / ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:31:12.51 -  
(
var ratio = 3.5;

Tdef(\text, {
	inf.do{
		~texture = { Pan2.ar(Klang.ar(`[Array.rand(20, 200, 10000), 0.01, 0]), 0) * EnvGen.kr(Env.sine(5), 1)};
		4.wait;
	};
}).play;


Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1,5,6,1,2,1,4,1,3,2,3,4,2,2,1,1,2,1,2,2,4,2,7,6,2,7,1,2,2,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2,1,1,2,1,1,2,1,1,1,1,4,4,4,2,2,1,1,1,4,1,4,1,2,2,2,1,2,1,1,1,2,1,2,1,1,1,2,1,2,1,2]  / ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:31:15.81 -  
		~texture = { Pan2.ar(Klang.ar(`[Array.rand(20, 200, 10000), 0.01, 0]), 0) * EnvGen.kr(Env.sine(5), 1)};

// - 0:32:39.44 -  
(
var ratio = 3.5;

Tdef(\text, {
	var seq = [4,8,4,8,12,4,8];
	inf.do{ |i|
		~texture = { Pan2.ar(Klang.ar(`[Array.rand(20, 200, 10000), 0.01, 0]), 0) * EnvGen.kr(Env.sine(seq@@i), 1)};
		(seq@@1).wait;
	};
}).play;


Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1,5,6,1,2,1,4,1,3,2,3,4,2,2,1,1,2,1,2,2,4,2,7,6,2,7,1,2,2,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2,1,1,2,1,1,2,1,1,1,1,4,4,4,2,2,1,1,1,4,1,4,1,2,2,2,1,2,1,1,1,2,1,2,1,1,1,2,1,2,1,2]  / ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:32:52.98 -  
(
var ratio = 3.5;

Tdef(\text, {
	var seq = [4,8,4,8,12,4,8];
	inf.do{ |i|
		~texture = { Pan2.ar(Klang.ar(`[Array.rand(20, 80, 8000), 0.01, 0]), 0) * EnvGen.kr(Env.sine(seq@@i), 1)};
		(seq@@1).wait;
	};
}).play;


Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1,5,6,1,2,1,4,1,3,2,3,4,2,2,1,1,2,1,2,2,4,2,7,6,2,7,1,2,2,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2,1,1,2,1,1,2,1,1,1,1,4,4,4,2,2,1,1,1,4,1,4,1,2,2,2,1,2,1,1,1,2,1,2,1,1,1,2,1,2,1,2]  / ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:33:12.33 -  
(
var ratio = 3.5;

Tdef(\text, {
	var seq = [4,8,4,8,12,4,8];
	inf.do{ |i|
		~texture = { Pan2.ar(Klang.ar(`[Array.rand(20, 80, 8000), 0.01, 0]), 0) * EnvGen.kr(Env.perc(seq@@i,0.001), 1)};
		(seq@@1).wait;
	};
}).play;


Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1,5,6,1,2,1,4,1,3,2,3,4,2,2,1,1,2,1,2,2,4,2,7,6,2,7,1,2,2,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2,1,1,2,1,1,2,1,1,1,1,4,4,4,2,2,1,1,1,4,1,4,1,2,2,2,1,2,1,1,1,2,1,2,1,1,1,2,1,2,1,2]  / ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:33:31.48 -  
(
var ratio = 3.5;

Tdef(\text, {
	var seq = [4,8,4,8,12,4,8];
	inf.do{ |i|
		~texture[0] = { Pan2.ar(Klang.ar(`[Array.rand(20, 80, 8000), 0.01, 0]), 0) * EnvGen.kr(Env.perc(seq@@i,0.001), 1)};
		(seq@@1).wait;
	};
}).play;


Tdef(\rhythm_one, {
	var seq = [1,2,1,4,1,2,1,1,2,1,2,3,1,1,2,1,1,3,1,2,1,1,4,1,3,1,2,1,1,1,5,6,1,2,1,4,1,3,2,3,4,2,2,1,1,2,1,2,2,4,2,7,6,2,7,1,2,2,1,1]/ratio;
	inf.do{ |i|
		~trig1.set(\t_in, 1);
		(seq@@i).wait;
	}
}).play;

Tdef(\bass_drum, {
	var seq = [1,1,2,1,1,2,1,1,2,1,1,1,1,4,4,4,2,2,1,1,1,4,1,4,1,2,2,2,1,2,1,1,1,2,1,2,1,1,1,2,1,2,1,2]  / ratio;
	inf.do{ |i|
		~bass.set(\t_trig, 1);
		(seq@@i).wait;
	}
}).play;
);

// - 0:34:11.17 -  
~teture[10] = \filter -> { |in| in + DelayN.ar(in, 5, [0,1,2,3,4])};

// - 0:34:16.76 -  
~texture[10] = \filter -> { |in| in + DelayN.ar(in, 5, [0,1,2,3,4])};

// - 0:34:33.58 -  
~texture[10] = \filter -> { |in| in + Splay.ar(DelayN.ar(in, 5, [0,1,2,3,4]))};

// - 0:35:25.68 -  
~texture[20] = \filter -> { |in| CombN.ar(in, 5, 1, 0.01) };

// - 0:35:38.85 -  
~texture[20] = \filter -> { |in| CombN.ar(in, 5, 1, 0.001) };

// - 0:35:44.12 -  
~texture[20] = \filter -> { |in| CombN.ar(in, 5, 2, 0.001) };

// - 0:35:51.79 -  
~texture[20] = \filter -> { |in| CombN.ar(in, 5, 2, 0.1) };

// - 0:35:57.05 -  
~texture[20] = \filter -> { |in| CombC.ar(in, 5, 2, 0.1) };

// - 0:36:26.63 -  
~texture[10] = \filter -> { |in| in + Splay.ar(DelayN.ar(in, 5, [0,1,2,3,4]))};

// - 0:36:35.75 -  
~texture.fadeTime = 2

// - 0:36:37.16 -  
~texture[10] = \filter -> { |in| in + Splay.ar(DelayN.ar(in, 5, [0,1,2,3,4]))};

// - 0:36:37.37 -  
~texture[20] = \filter -> { |in| CombC.ar(in, 5, 2, 0.1) };

// - 0:37:9.27 -  
~bass = { (SinOsc.ar(120!2) + RLPF.ar(WhiteNoise.ar, 120, 0.01).softclip.distort * 0.5)!2 * EnvGen.kr(Env.perc(0, 0.01), \t_trig.kr) * 0.1 }

// - 0:37:16.21 -  
~bass = { (SinOsc.ar(120!2) + RLPF.ar(WhiteNoise.ar, 120, 0.01).softclip.distort * 1)!2 * EnvGen.kr(Env.perc(0, 0.01), \t_trig.kr) * 0.1 }

// - 0:37:19.66 -  
~bass = { (SinOsc.ar(120!2) + RLPF.ar(WhiteNoise.ar, 120, 0.01).softclip.distort * 1)!2 * EnvGen.kr(Env.perc(0, 0.001), \t_trig.kr) * 0.1 }

// - 0:37:30.26 -  
~bass = { (SinOsc.ar(1200!2) + RLPF.ar(WhiteNoise.ar, 8000, 0.01).softclip.distort * 1)!2 * EnvGen.kr(Env.perc(0, 0.001), \t_trig.kr) * 0.1 }

// - 0:37:47.4 -  
~reverb[0] = { (~ton1.ar + ~bass.ar + ~texture.ar) * 2 * SinOsc.kr(80) }

// - 0:38:6.85 -  
TdefAllGui

// - 0:38:8.88 -  
TdefAllGui.new

// - 0:38:12.56 -  
Tdef('bass_drum').pause;

// - 0:38:15.42 -  
Tdef('rhythm_one').pause;

// - 0:38:20.44 -  
Tdef('bass_drum').resume;

// - 0:38:26.29 -  
Tdef('rhythm_one').resume;

// - 0:38:28.43 -  
Tdef('text').pause;

// - 0:38:30.98 -  
Tdef('text').play;

// - 0:38:52.01 -  
ProxyMixer(p)

// - 0:39:8.92 -  
p.clear(30)

// - 0:39:24.37 -  
// end

