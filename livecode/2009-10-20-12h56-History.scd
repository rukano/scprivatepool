///////////////////////////////////////////////////
// History, as it was on Tue Oct 20 12:56:52 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:37.41 -  
~trig = { TDuty.kr(Dseq([1,2], inf)) }

// - 0:0:40.38 -  
~sound.play

// - 0:0:42.35 -  
~sound[0] = { Saw.ar(Demand.kr(~trig, 0, Dseq([100,80,50,120], inf))) * 0.1!2 };

// - 0:0:54.65 -  
~sound[10] = \filter -> {|in| LPF.ar(in, 1500)}

// - 0:1:4.58 -  
~sound.fadeTime = 1

// - 0:1:16.39 -  
~seq[0] = { Duty.kr(Dseq([1,2,0.5,0.75,4]/2, inf), 0, Dseq([100,80,50,120,175,244], inf)) }

// - 0:1:19.17 -  
~seq.fadeTime = 1

// - 0:1:36.06 -  
~seq[0] = { Demand.kr(~trig, 0, Dseq([100,80,50,120,175,244], inf)) }

// - 0:1:38.14 -  
~seq.fadeTime = 1

// - 0:1:39.02 -  
~sound.fadeTime = 1

// - 0:1:42.86 -  
~sound[0] = { Saw.ar(~seq) * 0.1!2 };

// - 0:1:57.19 -  
~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,3,1,1]/2, inf)) }

// - 0:2:10.88 -  
~sound[10] = \filter -> {|in| LPF.ar(in, 2000)}

// - 0:2:16.38 -  
~sound[10] = \filter -> {|in| LPF.ar(in, 5000)}

// - 0:2:20.83 -  
~sound[10] = \filter -> {|in| LPF.ar(in, 200)}

// - 0:2:26.08 -  
~bass.play

// - 0:2:26.39 -  
~bass = { SinOsc.ar(~seq) * 0.1 }

// - 0:2:32.83 -  
~sound[10] = \filter -> {|in| LPF.ar(in, 2000)}

// - 0:3:26.23 -  
(
Tdef(\randomizer, {
	loop{
		~seq[0] = { Demand.kr(~trig, 0, Dseq([100,80,50,120,175,244], inf)) };
		5.wait
	}
}).play
);

// - 0:4:8.83 -  
(
Tdef(\randomizer, {
	loop{
		~seq = { Demand.kr(~trig, 0, Dseq([100,80,50,120,175,244].shuffle, inf)) };
		~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,3,1,1]/2.5, inf)) };
		5.wait
	}
}).play
);

// - 0:4:30.96 -  
(
Tdef(\randomizer, {
	loop{
		~seq = { Demand.kr(~trig, 0, Dseq([100,80,50,120,175,244].scramble, inf)) };
		~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,3,1,1]/2.5, inf)) };
		5.wait
	}
}).play
);

// - 0:4:39.98 -  
(
Tdef(\randomizer, {
	loop{
		~seq = { Demand.kr(~trig, 0, Dseq([100,80,50,120,175,244].mirror2, inf)) };
		~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,3,1,1]/2.5, inf)) };
		5.wait
	}
}).play
);

// - 0:5:2.5 -  
(
Tdef(\randomizer, {
	loop{
		~seq = { Demand.kr(~trig, 0, Dseq([100,80,50,120,175,244].mirror2, inf)) };
		~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,3,1,1]/2.5, inf)) };
		~sound[10] = \filter -> {|in| LPF.ar(in, rrand(2000,5000))};
		5.wait
	}
}).play
);

// - 0:6:43.01 -  
~beat = { RLPF.ar(WhiteNoise.ar(), 120, 0.1) * 2 * EnvGen.ar(Env.perc(0.0001,0.1), ~trig) }

// - 0:6:47.9 -  
~beat.play

// - 0:6:54.44 -  
~beat.stop

// - 0:6:57.02 -  
~beat.clear

// - 0:7:6.47 -  
~beat = { RLPF.ar(WhiteNoise.ar()!2, 120, 0.1) * EnvGen.ar(Env.perc(0.0001,0.1), ~trig) }

// - 0:7:9.62 -  
~beat.play

// - 0:7:23.72 -  
~beat.fadeTime = 1

// - 0:7:27.14 -  
~beat = { RLPF.ar(WhiteNoise.ar()!2, 120, 0.1) * EnvGen.ar(Env.perc(0.01,0.1), ~trig) }

// - 0:7:33.75 -  
~beat = { RLPF.ar(WhiteNoise.ar()!2, 120, 0.1) * EnvGen.ar(Env.perc(0.01,0.25), ~trig) }

// - 0:7:40.78 -  
~beat = { RLPF.ar(WhiteNoise.ar()!2, 120, 0.1) * EnvGen.ar(Env.perc(0.001,0.25), ~trig) }

// - 0:7:49.27 -  
~beat = { RLPF.ar(WhiteNoise.ar()!2, 120, 0.1) * 0.5 * EnvGen.ar(Env.perc(0.001,0.25), ~trig) }

// - 0:8:3.35 -  
~beat = { RLPF.ar(WhiteNoise.ar()!2, 220, 0.25) * 0.5 * EnvGen.ar(Env.perc(0.001,0.25), ~trig) }

// - 0:8:14.45 -  
~beat = { RLPF.ar(WhiteNoise.ar()!2, 80, 0.5) * 0.5 * EnvGen.ar(Env.perc(0.001,0.25), ~trig) }

// - 0:8:19.24 -  
~beat = { RLPF.ar(WhiteNoise.ar()!2, 80, 0.5) * 2 * EnvGen.ar(Env.perc(0.001,0.25), ~trig) }

// - 0:8:51.54 -  
(
Tdef(\randomizer, {
	loop{
		~seq = { Demand.kr(~trig, 0, Dseq([100,80,50,120,175,244].mirror2, inf)) };
		~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,3,1,1,4,2,1,1,1,2,1,3,4,1,3,2]/2.5, inf)) };
		~sound[10] = \filter -> {|in| RLPF.ar(in, rrand(2000,5000), 0.1)};
		5.wait
	}
}).play
);

// - 0:9:19.86 -  
(
Tdef(\randomizer, {
	loop{
		~seq = { Demand.kr(~trig, 0, Dseq([66,100,80,50,120,175,244,333,231,123,145].mirror2, inf)) };
		~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,3,1,1,4,2,1,1,1,2,1,3,4,1,3,2]/2.5, inf)) };
		~sound[10] = \filter -> {|in| RLPF.ar(in, rrand(2000,5000), 0.1)};
		5.wait
	}
}).play
);

// - 0:9:32.89 -  
(
Tdef(\randomizer, {
	loop{
		~seq = { Demand.kr(~trig, 0, Dseq([66,100,80,50,120,175,244,333,231,123,145].mirror2, inf)) };
		~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,3,1,1,4,2,1,1,1,2,1,3,4,1,3,2]/2.5, inf)) };
		~sound[10] = \filter -> {|in| RLPF.ar(in, rrand(200,5000), 0.1)};
		5.wait
	}
}).play
);

// - 0:9:49.67 -  
~beat = { RLPF.ar(WhiteNoise.ar()!2, 80, 0.5) * 2 * EnvGen.ar(Env.perc(0.0001,0.25), ~trig) }

// - 0:10:12.86 -  
(
Tdef(\randomizer, {
	loop{
		~seq = { Demand.kr(~trig, 0, Dseq([66,100,80,50,120,175,244,333,231,123,145].mirror2, inf)) };
		~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,3,1,1,4,2,1,1,1,2,1,3,4,1,3,2]/2.5, inf)) };
		~sound[10] = \filter -> {|in| RLPF.ar(in, rrand(200,5000), 0.25)};
		5.wait
	}
}).play
);

// - 0:10:33.42 -  
Tdef(\randomizer).stop

// - 0:10:41.91 -  
p.clear(30)

