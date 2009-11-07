///////////////////////////////////////////////////
// History, as it was on Sat Nov  7 20:21:27 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:12.74 -  
~out.play

// - 0:1:13.68 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(4,10,~trig)) * ~bassamp }

// - 0:1:49.04 -  
~bassfreq = { Demand.kr(~trig, 0, Drand([80,60,122],inf)) }

// - 0:2:4.19 -  
~trig = { Impulse.kr(2) }

// - 0:2:8.96 -  
~out = ~bass

// - 0:2:17.65 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(4,10,~trig)) * ~bassamp }

// - 0:2:20.21 -  
~bassfreq = { Demand.kr(~trig, 0, Drand([80,60,122],inf)) }

// - 0:2:24.52 -  
~trig = { Impulse.kr(2) }

// - 0:2:33.79 -  
~bass.play

// - 0:2:50.23 -  
~ bassfreq = 80

// - 0:2:52.07 -  
~bassfreq = 80

// - 0:3:1.58 -  
~ bassamp = 0.1

// - 0:3:5.56 -  
~bassfreq = { Demand.kr(~trig, 0, Drand([80,60,122],inf)) }

// - 0:3:12.3 -  
~trig = { Impulse.kr(1) }

// - 0:3:16.18 -  
~trig = { Impulse.kr(4) }

// - 0:3:24.37 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(4,10,~trig))!2 * ~bassamp }

// - 0:3:56.47 -  
~bassenv = { EnvGen.kr(Env.perc(0.01,0.25), ~trig) }

// - 0:4:1.14 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(4,10,~trig))!2 * ~bassamp * ~bassenv}

// - 0:4:7.62 -  
~bassenv = { EnvGen.kr(Env.perc(0.01,0.5), ~trig) }

// - 0:4:24.76 -  
~bassfreq = { Demand.kr(~trig, 0, Drand((20,35..100),inf)) }

// - 0:4:33.19 -  
~bassfreq = { Demand.kr(~trig, 0, Drand((35,45..100),inf)) }

// - 0:5:2.84 -  
~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,1,2,1,2,1,1,2,1,3,1,1,4,1,1,3,1,2,1,3,1,4,1,1,2,3,1]/4, inf)) }

// - 0:5:14.7 -  
~bassfreq = { Demand.kr(~trig, 0, Drand((35,50..100),inf)) }

// - 0:5:36.38 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(8,25,~trig))!2 * ~bassamp * ~bassenv }

// - 0:5:48.55 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(2,9,~trig))!2 * ~bassamp * ~bassenv }

// - 0:5:53.76 -  
~bassamp = 0.4

// - 0:5:56.3 -  
~bassamp = 0.2

// - 0:7:20.75 -  
~trig = { Trig.kr(\t_trig.kr, 0.01) } 

// - 0:7:21.63 -  
NPdef(~trig, Pbind(\t_trig, 1, \dur, Pseq([1,2,1,1,2,1,1,2,1,2,1,1,2,1,3,1,1,4,1,1,3,1,2,1,3,1,4,1,1,2,3,1]/4, inf))).play

// - 0:8:41.72 -  
~click = { Blip.ar(\freq.kr, \harm.kr) * EnvGen.ar(Env.sine(\sustain.kr), \t_trig.kr)}

// - 0:9:31.8 -  
NPdef(~click, Pbind(\freq, 800, \harm, 10, \sustain, 0.1, \t_trig, 1, \dur, 0.5)).play

// - 0:9:40.65 -  
~out = ~bass +  ~click

// - 0:9:48.36 -  
NPdef(~click, Pbind(\freq, 800, \harm, 10, \sustain, 0.01, \t_trig, 1, \dur, 0.5)).play

// - 0:10:1.25 -  
~click = { Blip.ar(\freq.kr, \harm.kr) * EnvGen.ar(Env.sine(\sustain.kr), \t_trig.kr, \amp.kr)}

// - 0:10:19.46 -  
NPdef(~trig, Pbind(\t_trig, 1, \dur, Pseq([1,2,1,1,2,1,1,2,1,2,1,1,2,1,3,1,1,4,1,1,3,1,2,1,3,1,4,1,1,2,3,1]/4, inf))).play

// - 0:10:21.58 -  
NPdef(~trig, Pbind(\t_trig, 1, \dur, Pseq([1,2,1,1,2,1,1,2,1,2,1,1,2,1,3,1,1,4,1,1,3,1,2,1,3,1,4,1,1,2,3,1]/4, inf))).play

// - 0:10:21.71 -  
NPdef(~click, Pbind(\freq, 800, \harm, 10, \sustain, 0.01, \t_trig, 1, \dur, 0.5)).play

// - 0:10:35.11 -  
NPdef(~click, Pbind(\freq, 800, \harm, 10, \sustain, 0.01, \t_trig, 1, \dur, 0.25)).play;

// - 0:11:0.78 -  
NPdef(~click, Pbind(\freq, Pseq((100,200..800),inf), \harm, 10, \sustain, 0.01, \t_trig, 1, \dur, 0.25)).play;

// - 0:11:9.66 -  
NPdef(~click, Pbind(\freq, Pxrand((100,200..800),inf), \harm, 10, \sustain, 0.01, \t_trig, 1, \dur, 0.25)).play;

// - 0:11:20.31 -  
NPdef(~click, Pbind(\freq, Pxrand((100,200..800),inf), \harm, Pwhite(2,10,inf), \sustain, 0.01, \t_trig, 1, \dur, 0.25)).play;

// - 0:11:28.12 -  
NPdef(~click, Pbind(\freq, Pxrand((100,200..800),inf), \harm, Pwhite(2,10,inf), \sustain, 0.005, \t_trig, 1, \dur, 0.25)).play;

// - 0:11:33.87 -  
NPdef(~click, Pbind(\freq, Pxrand((100,200..800),inf), \harm, Pwhite(2,10,inf), \sustain, 0.005, \t_trig, 1, \dur, 0.125)).play;

// - 0:12:16.37 -  
NPdef(~click, Pbind(\freq, Pxrand((100,200..800),inf), \harm, Pwhite(2,10,inf), \sustain, 0.005, \t_trig, 1, \dur, 0.125, \amp, Prand([1,1,1,0]*0.1,inf))).play;

// - 0:12:28.7 -  
NPdef(~click, Pbind(\freq, Pxrand((100,200..800),inf), \harm, Pwhite(2,10,inf), \sustain, 0.0025, \t_trig, 1, \dur, 0.125, \amp, Prand([1,1,1,0]*0.1,inf))).play;

// - 0:12:34.34 -  
NPdef(~click, Pbind(\freq, Pxrand((100,200..800),inf), \harm, Pwhite(2,10,inf), \sustain, 0.0025, \t_trig, 1, \dur, 0.125, \amp, Prand([1,1,1,0]*0.5,inf))).play;

// - 0:13:7.81 -  
~bassfreq = { Demand.kr(~trig, 0, Drand((30,33..50).midicps,inf)) }

// - 0:13:20.4 -  
~bassfreq = { Demand.kr(~trig, 0, Drand((25,28..45).midicps,inf)) }

// - 0:13:34 -  
NPdef(~click, Pbind(\freq, Pxrand((100,200..800),inf), \harm, Pwhite(2,10,inf), \sustain, 0.0025, \t_trig, 1, \dur, 0.125, \amp, Prand([1,0.75,0.5,0]*0.5,inf))).play;

// - 0:14:15.55 -  
~click[10] = \filter -> { |in| DelayC.ar(in, 5, [0, 0.5]) }

// - 0:14:37.32 -  
~click[10] = \filter -> { |in| Splay.ar(DelayC.ar(in, 5, [0, 0.25, 0.5, 0.75, 1])) }

// - 0:15:9.18 -  
~click[10] = \filter -> { |in| Splay.ar(DelayC.ar(in, 5, [0, 0.25, 0.5, 0.75, 1], [5,4,3,2,1]/5)) }

// - 0:15:18.99 -  
~click[10] = \filter -> { |in| Splay.ar(DelayC.ar(in, 5, [0, 0.215, 0.5, 0.75, 1], [5,4,3,2,1]/5)) }

// - 0:15:25.43 -  
~click[10] = \filter -> { |in| Splay.ar(DelayC.ar(in, 5, [0, 0.215, 0.5, 0.789, 1], [5,4,3,2,1]/5)) }

// - 0:15:35.44 -  
~click[10] = \filter -> { |in| Splay.ar(DelayC.ar(in, 5, [0, 0.215, 0.5, 0.789, 1], [5,2,2,1,1]/5)) }

// - 0:16:21.39 -  
~kick = { SinOsc.ar(80)!2 * EnvGen.kr(Env.perc(0,0.01), \t_trig.kr) }

// - 0:16:42.23 -  
NPdef(~kick, Pbind(\t_trig, 1, \dur, 0.5)).play

// - 0:16:47.99 -  
~out = ~bass +  ~click + ~kick

// - 0:17:3.24 -  
~kick = { SinOsc.ar(80).wrap2(0.2)!2 * EnvGen.kr(Env.perc(0,0.01), \t_trig.kr) }

// - 0:17:15.62 -  
~kick = { SinOsc.ar(80)!2 * EnvGen.kr(Env.perc(0,0.01), \t_trig.kr) }

// - 0:17:59.09 -  
~kick = { (RLPF.ar(PinkNoise.ar, 80, 0.25, 4)!2 + SinOsc.ar(80)!2) * EnvGen.kr(Env.perc(0,0.01), \t_trig.kr) }

// - 0:18:14.09 -  
~kick = { (RLPF.ar(PinkNoise.ar, 80, 0.25, 4).distort!2 + SinOsc.ar(80)!2) * EnvGen.kr(Env.perc(0,0.01), \t_trig.kr) }

// - 0:18:24.82 -  
(
NPdef(~trig, Pbind(\t_trig, 1, \dur, Pseq([1,2,1,1,2,1,1,2,1,2,1,1,2,1,3,1,1,4,1,1,3,1,2,1,3,1,4,1,1,2,3,1]/4, inf))).play;
NPdef(~click, Pbind(\freq, Pxrand((100,200..800),inf), \harm, Pwhite(2,10,inf), \sustain, 0.0025, \t_trig, 1, \dur, 0.125, \amp, Prand([1,0.75,0.5,0]*0.5,inf))).play;
NPdef(~kick, Pbind(\t_trig, 1, \dur, 0.5)).play
);

// - 0:18:36.31 -  
s.latency = nil

// - 0:18:40.08 -  
~kick = { (RLPF.ar(PinkNoise.ar, 80, 0.25, 4).distort!2 + SinOsc.ar(80)!2) * EnvGen.kr(Env.perc(0,0.01), \t_trig.kr) }

// - 0:18:47.27 -  
~kick = { (RLPF.ar(PinkNoise.ar, 80, 0.25, 4).softclip!2 + SinOsc.ar(80)!2) * EnvGen.kr(Env.perc(0,0.01), \t_trig.kr) }

// - 0:18:57.23 -  
~kick = { (RLPF.ar(PinkNoise.ar, [80,120], 0.25, 4) + SinOsc.ar(80)!2) * EnvGen.kr(Env.perc(0,0.01), \t_trig.kr) }

// - 0:19:35.37 -  
NPdef(~kick, Pbind(\t_trig, 1, \dur, Prand([Pseq([1,1,1,1]), Pseq([1,1,1,0.5,0.5])],inf))).play

// - 0:19:48.17 -  
NPdef(~kick, Pbind(\t_trig, 1, \dur, Prand([Pseq([1,1,1,1]/2), Pseq([1,1,1,0.5,0.5]/2)],inf))).play

// - 0:20:8.55 -  
~bassfreq = { Demand.kr(~trig, 0, Drand((25,29..45).midicps,inf)) }

// - 0:20:19.62 -  
~bassfreq = { Demand.kr(~trig, 0, Drand((20,22..40).midicps,inf)) }

// - 0:20:38.62 -  
~bassfreq = { Demand.kr(~trig, 0, Drand([25,28,29,31,32,33,36,38,39].midicps,inf)) }

// - 0:20:46.68 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(2,15,~trig))!2 * ~bassamp * ~bassenv }

// - 0:20:55.31 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(8,15,~trig))!2 * ~bassamp * ~bassenv }

// - 0:21:0.03 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(8,25,~trig))!2 * ~bassamp * ~bassenv }

// - 0:21:5.66 -  
~bass = { Blip.ar(~bassfreq, TRand.kr(8,25,~trig))!2 * ~bassamp * ~bassenv }

// - 0:21:21.69 -  
p.fadeTime = 5

// - 0:21:26.03 -  
p.end(10)

