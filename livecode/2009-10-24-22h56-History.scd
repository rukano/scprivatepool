///////////////////////////////////////////////////
// History, as it was on Sat Oct 24 22:56:51 2009.
///////////////////////////////////////////////////

// totally experimental and with learning purposes
// some lines won't work at all (just testing)
// by the end some weird stuf when cubing / squaring

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:4.06 -  
~out.play

// - 0:0:5.58 -  
~out = ~snd1

// - 0:1:13.14 -  
~snd1 = { Pulse.ar(TRand.kr(120,220,Impulse.kr(8)))!2 * 0.1}

// - 0:1:40.96 -  
~snd1 = { Pulse.ar(TRand.kr(120,SinOsc.kr(0.1).range(130,400),Impulse.kr(8)))!2 * 0.1}

// - 0:2:47.03 -  
Tdef(\_, { inf.do{ |i| ~snd.set(\t_trig, 1); (1/16).wait } }).play

// - 0:2:59.06 -  
~snd1 = { Pulse.ar(TRand.kr(120,SinOsc.kr(0.1).range(130,400), \t_trig.kr(1)))!2 * 0.1}

// - 0:3:6.68 -  
Tdef(\_, { inf.do{ |i| ~snd1.set(\t_trig, 1); (1/16).wait } }).play

// - 0:3:14.08 -  
~snd1 = { Pulse.ar(TRand.kr(120,SinOsc.kr(0.1).range(130,400), \t_trig.kr(1)))!2 * 0.1}

// - 0:3:15.32 -  
~snd1 = { Pulse.ar(TRand.kr(120,SinOsc.kr(0.1).range(130,400), \t_trig.kr(1)))!2 * 0.1}

// - 0:3:17.15 -  
Tdef(\_, { inf.do{ |i| ~snd1.set(\t_trig, 1); (1/16).wait } }).play

// - 0:3:24.62 -  
Tdef(\_, { inf.do{ |i| ~snd1.set(\t_trig, 1); (1/16).wait } }).play

// - 0:3:25.71 -  
~snd1 = { Pulse.ar(TRand.kr(120,SinOsc.kr(0.1).range(130,400), \t_trig.kr(1)))!2 * 0.1}

// - 0:3:32.39 -  
~snd1 = { Pulse.ar(TRand.kr(120,SinOsc.kr(0.1).range(130,400), Dust.kr(10)))!2 * 0.1}

// - 0:4:26.23 -  
~demand = { Demand.kr(\t_trig.kr(1), 0, Dseq([1,2], inf)) }

// - 0:5:3.47 -  
Tdef(\__, { 10.do{ "test".postln; ~demand.wait } })

// - 0:5:9.3 -  
Tdef(\__, { 10.do{ "test".postln; ~demand.wait } })

// - 0:5:12.75 -  
Tdef(\__, { 10.do{ "test".postln; ~demand.wait } }).play

// - 0:5:33.68 -  
~snd1 = { Pulse.ar(TRand.kr(20,SinOsc.kr(0.1).range(130,400), Dust.kr(10)))!2 * 0.1}

// - 0:5:42.23 -  
~snd1 = { Pulse.ar(TRand.kr(20,SinOsc.kr(0.1).range(40,400), Dust.kr(10)))!2 * 0.1}

// - 0:5:52.11 -  
~snd1 = { Pulse.ar(TRand.kr(20,SinOsc.kr(0.1).range(40,400), Dust.kr([10,15]))) * 0.1}

// - 0:6:10.27 -  
// disregard the demand tries...

// - 0:6:15.73 -  
// wont work

// - 0:7:31.47 -  
~snd2 = { Saw.ar(TChoose.kr(Dust.kr([12,17]), Array.geom(12,40,1.2))) * 0.1 }

// - 0:7:38.53 -  
~out = ~snd1 + ~snd2

// - 0:8:6.99 -  
~out = ~snd1 * ~snd2

// - 0:8:13.7 -  
~out = ~snd1.ar * ~snd2.ar

// - 0:8:16.81 -  
~out = ~snd1.ar + ~snd2.ar

// - 0:8:24.84 -  
~snd2 = { Saw.ar(TChoose.kr(Dust.kr([12,17]), Array.geom(12,40,1.2))) * 0.2 }

// - 0:8:35.9 -  
~snd2 = { Saw.ar(TChoose.kr(Dust.kr([12,17]), Array.geom(12,40,1.2)).lag(0.1)) * 0.2 }

// - 0:8:47.15 -  
~snd1 = { Pulse.ar(TRand.kr(20,SinOsc.kr(0.1).range(40,400), Dust.kr([10,15])).lag(0.1)) * 0.1}

// - 0:9:1.29 -  
~snd2 = { Saw.ar(TChoose.kr(Dust.kr([12,17]*4), Array.geom(12,40,1.2)).lag(0.1)) * 0.2 }

// - 0:9:3.39 -  
~snd1 = { Pulse.ar(TRand.kr(20,SinOsc.kr(0.1).range(40,400), Dust.kr([10,15]*4)).lag(0.1)) * 0.1}

// - 0:9:10.27 -  
~snd2 = { Saw.ar(TChoose.kr(Dust.kr([12,17]*4), Array.geom(12,40,1.2).mirror1).lag(0.1)) * 0.2 }

// - 0:9:15.15 -  
~snd1 = { Pulse.ar(TRand.kr(20,SinOsc.kr(0.1).range(40,400), Dust.kr([10,15]*4)).lag(0.1)) * 0.2}

// - 0:9:34.87 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, 200, 0.4);

// - 0:9:40.94 -  
p.fadeTime = 5

// - 0:10:36.42 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, SinOsc.kr(LFNoise2.kr(0.1, 10, 20)), 0.4);

// - 0:10:47.29 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, 500, 0.4);

// - 0:11:36.61 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 300, 400), 0.4);

// - 0:11:47.39 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, 400), 0.4);

// - 0:12:28.86 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)), 0.4);

// - 0:13:13.55 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)), 0.1);

// - 0:13:19.38 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)), 0.8);

// - 0:13:26.31 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).distort, 0.8);

// - 0:13:31.89 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)), 0.8);

// ----- Weird stuff starts here

// - 0:13:35.65 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).cubed, 0.8);

// - 0:13:43.87 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).squared, 0.8);

// - 0:13:50.73 -  
// COOL

// - 0:13:57.5 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).log, 0.8);

// - 0:14:7.48 -  
~out = RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).cubed, 0.8);

// - 0:14:20.54 -  
~out = LPF.ar(RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).cubed, 0.8), 400);

// - 0:14:29.19 -  
~out = LPF.ar(RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).cubed, 0.8) * 0.1, 400);

// - 0:14:53.61 -  
~out = LPF.ar(RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).cubed, 0.8, 0.1) * 0.1, 400);

// - 0:15:1.42 -  
~out = LPF.ar(RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).squared, 0.8, 0.1) * 0.1, 400);

// - 0:15:5.37 -  
~out = LPF.ar(RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).cubed, 0.8, 0.1) * 0.1, 400);

// - 0:15:8.3 -  
~out = LPF.ar(RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)), 0.8, 0.1) * 0.1, 400);

// - 0:15:12.9 -  
~out = LPF.ar(RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).cubed, 0.8, 0.1) * 0.1, 400);

// - 0:15:18.27 -  
~out = LPF.ar(RLPF.ar(~snd1.ar + ~snd2.ar, LFNoise2.kr(1, 100, LFNoise2.kr(1, 400, 800)).squared, 0.8, 0.1) * 0.1, 400);

// - 0:15:25.5 -  
p.end(10)

