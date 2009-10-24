///////////////////////////////////////////////////
// History, as it was on Sat Oct 24 22:39:13 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s.boot)

// - 0:0:4.06 -  
~trig = { Trig1.kr(\t_trig.kr(1), 0.01) }

// - 0:0:10.8 -  
p.fadeTime = 1

// - 0:0:13.83 -  
~out.play

// - 0:0:14.24 -  
~out = ~snd

// - 0:0:19.78 -  
s.latency = nil

// - 0:0:26.63 -  
Tdef(\_, { inf.do{ ~trig.set(\t_trig, 1); (1/4).wait } }).play

// - 0:0:55.86 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,3,1,2,1,1,3,1,4,1,2,1,5,5,4,3,4,2,3,1]*75,inf))) * 0.1 }

// - 0:1:16.03 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,3,1,2,1,1,3,1,4,1,2,1,5,5,4,3,4,2,3,1]*75,inf))) * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:1:34.27 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,3,1,2,1,1,3,1,4,1,2,1,5,5,4,3,4,2,3,1]*75,inf)))!2 * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:1:50.83 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,3,1,4,1,2,1,5,5,4,3,4,2,3,1]*75,inf)))!2 * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:2:0.66 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,3,1,4,1,2,[1,2],5,5,4,3,4,2,3,1]*75,inf)))!2 * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:2:11.17 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,3,1,4,1,2,[1,2],5,5,4,[10,15],4,2,3,1]*75,inf)))!2 * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:2:45.27 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,4,1,2,[1,2],5,5,4,[10,15],4,2,3,1]*75,inf)))!2 * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:2:56.68 -  
~snd.fadeTime = 0

// - 0:3:4.34 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,15],4,2,3,1]*75,inf)))!2 * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:3:14.89 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,15],4,2,[1,4,7,9],1]*75,inf)))!2 * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:3:35.06 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,15],4,2,[1,4,7,9],1]*75,inf)))) * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:3:43.64 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,15],4,2,[1,4,7,9],1]*75,inf)))!2) * 0.1 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:3:48.1 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,15],4,2,[1,4,7,9],1]*75,inf)))!2) * 0.5 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:3:51.72 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,15],4,2,[1,4,7,9],1]*75,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:4:2.28 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*75,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.5),~trig) }

// - 0:4:12.87 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*75,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.1,0.5),~trig) }

// - 0:4:18.2 -  
~snd.fadeTime = 0.1

// - 0:4:23.96 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*75,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.2,0.5),~trig) }

// - 0:5:41.04 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.01); x * 10 * Decay2.ar(x, 0.01, 0.1, x)!2 }

// - 0:5:49.36 -  
~bass.play

// - 0:5:53.9 -  
~bass.stop

// - 0:6:6.11 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.01); x * Decay2.ar(x, 0.01, 0.1, x)!2 }

// - 0:6:10.39 -  
~bass.play

// - 0:6:13.73 -  
~bass.stop

// - 0:6:22.2 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.01); x * 0.1 * Decay2.ar(x, 0.01, 0.1, x)!2 }

// - 0:6:24.36 -  
~bass.play

// - 0:6:34.19 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.01); x * 0.1 * Decay2.ar(x, 0.01, 0.1, Impulse.kr(1))!2 }

// - 0:6:41.14 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.01); x * 0.1 * Decay2.ar(x, 0.01, 0.1, 0)!2 }

// - 0:6:47.65 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.01); x * 0.1 * Decay2.ar(x, 0.01, 0.1, ~trig)!2 }

// - 0:6:59.57 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.1, 0.1); x * 0.1 * Decay2.ar(x, 0.01, 0.1, ~trig)!2 }

// - 0:7:6.51 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.1, 0.1); x * Decay2.ar(x, 0.01, 0.1, ~trig)!2 }

// - 0:7:12.88 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.1, 0.1); Decay2.ar(x, 0.01, 0.1, ~trig)!2 }

// - 0:7:18.06 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.1, 0.1); Decay2.ar(x, 0.001, 0.1, ~trig)!2 }

// - 0:7:21.37 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.1, 0.1); Decay2.ar(x, 0.1, 0.1, ~trig)!2 }

// - 0:7:25.9 -  
~bass = { var x = RLPF.ar(PinkNoise.ar, 120, 0.1, 0.1); Decay2.ar(x, 0.01, 0.1, ~trig)!2 }

// - 0:7:40.86 -  
~bass = { var x = RLPF.ar(WhiteNoise.ar, 120, 0.1, 0.1); Decay2.ar(x, 0.01, 0.1, ~trig)!2 }

// - 0:7:47.89 -  
~bass = { var x = RLPF.ar(WhiteNoise.ar, 120, 0.1, 0.01); Decay2.ar(x, 0.01, 0.1, ~trig)!2 }

// - 0:7:54.84 -  
~bass = { var x = RLPF.ar(WhiteNoise.ar, 120, 0.1, 0.01); Decay2.ar(x, 0, 0.1, ~trig)!2 }

// - 0:8:9.28 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*85,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.2,0.5),~trig) }

// - 0:8:13.2 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*75,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.2,0.5),~trig) }

// - 0:8:52.65 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*TChoose.kr(~trig,[75,90,120]),inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.2,0.5),~trig) }

// - 0:9:16.85 -  
~bass = { var x = RLPF.ar(WhiteNoise.ar, 120, 0.1, 0.1); Decay2.ar(x, 0, 0.1, ~trig)!2 }

// - 0:9:43.13 -  
~bass = { RLPF.ar(WhiteNoise.ar, 120, 0.1, 0.1)!2 * EnvGen.kr(Env.perc, ~trig) }

// - 0:9:49.56 -  
~bass = { RLPF.ar(WhiteNoise.ar, 120, 0.1)!2 * EnvGen.kr(Env.perc, ~trig) }

// - 0:10:1.92 -  
~bass = { RLPF.ar(WhiteNoise.ar, 120, 0.1)!2 * EnvGen.kr(Env.perc(0,0.1), ~trig) }

// - 0:10:7.21 -  
~bass = { RLPF.ar(WhiteNoise.ar, 120, 0.1)!2 * EnvGen.kr(Env.perc(0,0.1,4), ~trig) }

// - 0:10:11.32 -  
~bass = { RLPF.ar(WhiteNoise.ar, 120, 0.1)!2 * EnvGen.kr(Env.perc(0,0.1,-4), ~trig) }

// - 0:10:22.17 -  
~bass = { RLPF.ar(WhiteNoise.ar, 120, 0.1)!2 * EnvGen.kr(Env.perc(0,0.1,1,-4), ~trig) }

// - 0:10:35.76 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*TChoose.kr(~trig,[40,65,75,90,120]),inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.2,0.5),~trig) }

// - 0:10:43.24 -  
~bass = { RLPF.ar(WhiteNoise.ar, 80, 0.1)!2 * EnvGen.kr(Env.perc(0,0.1,1,-4), ~trig) }

// - 0:11:2.53 -  
q = ()

// - 0:11:21.54 -  
q.rhy = [1,1,1,1,4,1,1,2,1,4,1,1,2,1,4,1,2,1,4,1,1,2,1,3,1]

// - 0:11:25.73 -  
q.rhy = [1,1,1,1,4,1,1,2,1,4,1,1,2,1,4,1,2,1,4,1,1,2,1,3,1] / 4

// - 0:11:43.32 -  
Tdef(\_, { inf.do{ |i| ~trig.set(\t_trig, 1); (q.rhy @@ i).wait } }).play

// - 0:12:7.05 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([[10,12],3,[17,15],3,[1,8],3,2,2,1,[8,5],4,2,3,1,[1,10],1,3]*75,inf))) * EnvGen.ar(Env.perc(0.01,0.2,1,-8),~trig) * 0.1 }

// - 0:12:10.7 -  
~snd = { SinOsc.ar(Demand.kr(~trig, 0, Dseq([[10,12],3,[17,15],3,[1,8],3,2,2,1,[8,5],4,2,3,1,[1,10],1,3]*75,inf))) * EnvGen.ar(Env.perc(0.01,0.5,1,-8),~trig) * 0.1 }

// - 0:12:27.56 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*TChoose.kr(~trig,(30,45..120)),inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.2,0.5),~trig) }

// - 0:12:50.86 -  
~snd = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*TChoose.kr(~trig,(30,45..120)),inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:13:23.12 -  
~bass = { RLPF.ar(WhiteNoise.ar, 80, 0.1)!2 * EnvGen.kr(Env.perc(0,0.1,1,-4), \t_trig.kr(1)) }

// - 0:13:44.36 -  
Tdef(\__, { inf.do{ |i| ~trig.set(\t_trig, 1); (q.rhy @@ i * 2).wait } }).play

// - 0:13:52.37 -  
Tdef(\_, { inf.do{ |i| ~trig.set(\t_trig, 1); (q.rhy @@ i).wait } }).play

// - 0:13:57.92 -  
Tdef(\__, { inf.do{ |i| ~bass.set(\t_trig, 1); (q.rhy @@ i * 2).wait } }).play

// - 0:14:22.87 -  
~btrig = { Trig1.kr(\t_trig.kr(1), 0.01) }

// - 0:14:30.12 -  
Tdef(\__, { inf.do{ |i| ~btrig.set(\t_trig, 1); (q.rhy @@ i * 2).wait } }).play

// - 0:14:37.64 -  
~bass = { RLPF.ar(WhiteNoise.ar, 80, 0.1)!2 * EnvGen.kr(Env.perc(0,0.1,1,-4), ~btrig) }

// - 0:15:14.27 -  
~bass = { RLPF.ar(WhiteNoise.ar, EnvGen.kr(Env([200,20], [0.5]), ~btrig), 0.1)!2 * EnvGen.kr(Env.perc(0,0.1,1,-4), ~btrig) }

// - 0:15:38.97 -  
~bass = { RLPF.ar(WhiteNoise.ar, EnvGen.kr(Env([200,20], [0.5]), ~btrig), 0.1)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) }

// - 0:15:47.1 -  
~bass = { RLPF.ar(WhiteNoise.ar, EnvGen.kr(Env([200,20], [0.5]), ~btrig), 0.1)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) }

// - 0:15:48.28 -  
~bass.play

// - 0:15:52.54 -  
~bass = { RLPF.ar(WhiteNoise.ar, EnvGen.kr(Env([400,20], [0.5]), ~btrig), 0.1)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) }

// - 0:16:0.63 -  
~bass = { RLPF.ar(WhiteNoise.ar, EnvGen.kr(Env([400,20], [0.5]), ~btrig), 0.1)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) }

// - 0:16:7.77 -  
Tdef(\__, { inf.do{ |i| ~btrig.set(\t_trig, 1); (q.rhy @@ i / 2).wait } }).play

// - 0:16:17.02 -  
~btrig = { Trig1.kr(\t_trig.kr(1), 0.01) }

// - 0:16:24.54 -  
~bass = { RLPF.ar(WhiteNoise.ar, EnvGen.kr(Env([400,40], [0.5]), ~btrig), 0.1)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) }

// - 0:16:48.86 -  
~snd[0] = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,1,[4,5],1,2,1,1,[4,8],1,[4,11],1,2,[1,2],5,5,4,[10,12],4,2,[1,4,7,9],1]*TChoose.kr(~trig,(30,45..120)),inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:17:39.99 -  
~snd[10] = \filter -> { |in| in + DelayN.ar(in, 2, [0.5, 1])};

// - 0:18:4.44 -  
~snd[10] = \filter -> { |in| in + Splay.ar(DelayN.ar(in, 2, [0.5, 1, 1.5, 2])) };

// - 0:18:54.76 -  
~snd[0] = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2]*TChoose.kr(~trig, [45,120]),inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:19:0.1 -  
~snd[0] = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,5]*TChoose.kr(~trig, [45,120]),inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:19:9.53 -  
~snd[0] = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,5]*TChoose.kr(~trig, [80,120,400]),inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:19:51.24 -  
~snd[0] = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,5,3,2,5,2,3,7,1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3]*TChoose.kr(~trig, [80,120,400]),inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:20:2.01 -  
~snd[0] = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,5,3,2,5,2,3,7,1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3]*200,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:20:20.88 -  
~bass = { RLPF.ar(WhiteNoise.ar, EnvGen.kr(Env([400,40], [0.5]), ~btrig), 0.1)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) * 4}

// - 0:20:41.13 -  
~bass = { RLPF.ar(WhiteNoise.ar, EnvGen.kr(Env([400,40], [0.5]), ~btrig), 0.1)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) * 4 }

// - 0:20:56.02 -  
~bass = { RLPF.ar(WhiteNoise.ar, EnvGen.kr(Env([400,40], [0.5]), ~btrig.kr), 0.1)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) * 4 }

// - 0:21:10.67 -  
~bass = { RLPF.ar(WhiteNoise.ar, 80, 0.1)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) * 4 }

// - 0:21:15.62 -  
~bass = { RLPF.ar(WhiteNoise.ar, 80, 0.01)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) * 4 }

// - 0:21:19.47 -  
~bass = { RLPF.ar(WhiteNoise.ar, 80, 0.01)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig) * 1 }

// - 0:21:25.78 -  
~bass = { RLPF.ar(WhiteNoise.ar, 80, 0.01)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig)  }

// - 0:21:29.38 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.01)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig)  }

// - 0:21:33.85 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.001)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig)  }

// - 0:21:49.51 -  
q.rhy = [1,1,1,1,4,1,1,2,1,4,1,1,2,1,4,1,2,1,4,1,1,2,1,3,1] / 5

// - 0:21:55.28 -  
q.rhy = [1,1,1,1,4,1,1,2,1,4,1,1,2,1,4,1,2,1,4,1,1,2,1,3,1] / 4

// - 0:22:13.74 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.001)!2 * EnvGen.kr(Env.perc(0,0.2,1,-4), ~btrig).distort.softclip  }

// - 0:22:21.21 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.001)!2 * EnvGen.kr(Env.perc(0,0.1,1,-4), ~btrig).distort.softclip  }

// - 0:22:25.08 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.001)!2 * EnvGen.kr(Env.perc(0,0.1,1,-4), ~btrig).distort.softclip  }

// - 0:22:31.68 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.001)!2 * EnvGen.kr(Env.perc(0,0.01,1,-4), ~btrig).distort.softclip  }

// - 0:22:37.93 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.001)!2 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig).distort.softclip  }

// - 0:22:45.57 -  
~snd[0] = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,5,3,2,5,2,3,7,1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3]*100,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:22:55.55 -  
~snd[0] = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,5,3,2,5,2,3,[10,11],1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3]*100,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:23:1.89 -  
~snd[0] = { Splay.ar(SinOsc.ar(Demand.kr(~trig, 0, Dseq([1,2,5,[5,8],2,5,2,3,[10,11],1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3]*100,inf)))!2) * 0.2 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:23:9.66 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.001)!2 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig)  }

// - 0:23:32.96 -  
~snd[0] = { Splay.ar(Saw.ar(Demand.kr(~trig, 0, Dseq([1,2,5,[5,8],2,5,2,3,[10,11],1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3]*100,inf)))!2) * 0.1 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:23:44.71 -  
p.fadeTime = 1

// - 0:23:49.42 -  
~snd[0] = { Splay.ar(Pulse.ar(Demand.kr(~trig, 0, Dseq([1,2,5,[5,8],2,5,2,3,[10,11],1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3]*100,inf)))!2) * 0.1 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:24:0.36 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.001)!2 * 0.1 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig)  }

// - 0:24:9.9 -  
~bass = { RLPF.ar(WhiteNoise.ar, 60, 0.5)!2 * 0.1 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig)  }

// - 0:24:13.79 -  
~bass = { RLPF.ar(WhiteNoise.ar, 120, 0.5)!2 * 0.1 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig)  }

// - 0:24:18.33 -  
~bass = { RLPF.ar(WhiteNoise.ar, 120, 0.5)!2 * 0.5 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig)  }

// - 0:24:50.84 -  
~snd[10] = \filter -> { |in| in + CombN.ar(in, 5, 0.1, 3) };

// - 0:24:54.57 -  
~snd[10] = \filter -> { |in| in + CombN.ar(in, 5, 0.2, 3) };

// - 0:24:57.61 -  
~snd[10] = \filter -> { |in| in + CombN.ar(in, 5, 0.2, 1) };

// - 0:25:8.03 -  
~snd[10] = \filter -> { |in| in + Splay.ar(DelayN.ar(in, 2, [0.5, 1, 1.5, 2])) };

// - 0:25:14.19 -  
~snd[20] = \filter -> { |in| in + CombN.ar(in, 5, 0.2, 1) };

// - 0:25:35.36 -  
~snd[20] = \filter -> { |in| in + CombN.ar(in, 5, 0.1, 1) };

// - 0:25:39.04 -  
~snd[20] = \filter -> { |in| in + CombN.ar(in, 5, 0.01, 1) };

// - 0:25:45.09 -  
~snd[20] = \filter -> { |in| in + CombN.ar(in, 5, 0.01, 1) * 0.1};

// - 0:25:50 -  
~snd[20] = \filter -> { |in| in + CombN.ar(in, 5, 0.01, 1) * 0.5 };

// - 0:25:54.29 -  
~snd[20] = \filter -> { |in| in + CombN.ar(in, 5, 0.01, 0.5) * 0.5 };

// - 0:26:41.65 -  
~snd[50] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.7, 0.7, 0.8) }

// - 0:26:59.29 -  
~bass = { RLPF.ar(WhiteNoise.ar, 120, 0.5)!2 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig)  }

// - 0:27:5.59 -  
~bass = { LPF.ar(WhiteNoise.ar, 120, 0.5)!2 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig)  }

// - 0:27:8.89 -  
~bass = { LPF.ar(WhiteNoise.ar, 200, 0.5)!2 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig)  }

// - 0:27:13.53 -  
~bass = { LPF.ar(WhiteNoise.ar, 200)!2 * EnvGen.kr(Env.perc(0,0.025,1,-4), ~btrig)  }

// - 0:27:23.81 -  
~bass = { LPF.ar(WhiteNoise.ar, 200)!2 * EnvGen.kr(Env.perc(0, 0.01, 1, -4), ~btrig)  }

// - 0:27:27.32 -  
~bass = { LPF.ar(WhiteNoise.ar, 200)!2 * EnvGen.kr(Env.perc(0, 0.01, 1, -4), ~btrig) * 10 }

// - 0:27:30.62 -  
~bass = { LPF.ar(WhiteNoise.ar, 200)!2 * EnvGen.kr(Env.perc(0, 0.01, 1, -4), ~btrig) * 5 }

// - 0:27:56.49 -  
~snd[0] = { Splay.ar(Pulse.ar(Demand.kr(~trig, 0, Dseq([1,2,5,[5,8],2,5,2,3,[10,11],1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3].midiratio * 200,inf)))!2) * 0.1 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:28:12.82 -  
~snd[0] = { Splay.ar(Pulse.ar(Demand.kr(~trig, 0, Dseq([1,2,5,[5,8],2,5,2,3,[10,11],1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3].midiratio * 200,inf)))!2) * 0.1 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:28:38.21 -  
~snd[0] = { Splay.ar(Pulse.ar(Demand.kr(~trig, 0, Dseq(([1,2,5,[5,8],2,5,2,3,[10,11],1,2,3,4,2,3,4,2,1,2,1,2,2,1,2,1,2,3]+60).midicps,inf)))!2) * 0.1 * EnvGen.ar(Env.perc(0.01,0.1,1,-5),~trig) }

// - 0:28:54.17 -  
// wtf was that??

// - 0:29:6.52 -  
p.clear(10)

