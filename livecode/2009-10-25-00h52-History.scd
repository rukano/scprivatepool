///////////////////////////////////////////////////
// History, as it was on Sun Oct 25 00:52:29 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:2.37 -  
~trig = { Impulse.ar([1,1.0001]) }

// - 0:0:2.57 -  
~snd = { Splay.ar(SinOsc.ar(Latch.ar(SinOsc.ar(1.3,0,4e2,5e2),~trig.ar*[1,2,3,4]).lag(0.05))) }

// - 0:0:3.66 -  
~snd.play

// - 0:0:7.9 -  
~bass = { SinOsc.ar(80)!2 * EnvGen.ar(Env.perc(0,0.1), ~trig.ar[0]) }

// - 0:0:9.25 -  
~bass.play

// - 0:0:52.47 -  
~bass = { SinOsc.ar(EnvGen.ar(Env([120,20],0.2), ~trig.ar[0]))!2 * EnvGen.ar(Env.perc(0,0.1), ~trig.ar[0]) }

// - 0:0:56.06 -  
~bass = { SinOsc.ar(EnvGen.ar(Env([120,20],0.2), ~trig.ar[0]))!2 * EnvGen.ar(Env.perc(0,0.1), ~trig.ar[0]) }

// - 0:1:3.43 -  
~bass = { SinOsc.ar(EnvGen.ar(Env([120,20],[0.2]), ~trig.ar[0]))!2 * EnvGen.ar(Env.perc(0,0.1), ~trig.ar[0]) }

// - 0:1:24.08 -  
~bass = { SinOsc.ar(80)!2 * EnvGen.ar(Env.perc(0,0.1), ~trig.ar[0]) }

// - 0:1:50.03 -  
~bass = { (SinOsc.ar(80) + LPF.ar(WhiteNoise.ar,120))!2 * EnvGen.ar(Env.perc(0.001,0.1), ~trig.ar[0]) }

// - 0:1:56.86 -  
~bass = { (SinOsc.ar(80) + LPF.ar(PinkNoise.ar,120))!2 * EnvGen.ar(Env.perc(0.001,0.1), ~trig.ar[0]) }

// - 0:2:42.64 -  
~bass[1] = \filter -> { |in| DelayN.ar(in, 2, [0,0.5]) }

// - 0:2:56.31 -  
~bass = { (SinOsc.ar(80) + RLPF.ar(PinkNoise.ar,120,0.1))!2 * EnvGen.ar(Env.perc(0.001,0.1), ~trig.ar[0]) }

// - 0:2:59.88 -  
~bass[1] = \filter -> { |in| DelayN.ar(in, 2, [0,0.5]) }

// - 0:3:44.39 -  
~bass[1] = \filter -> { |in| DelayN.ar(in, 2, (0,0.25..1)).sum!2 }

// - 0:4:11.93 -  
~bass[0] = { (SinOsc.ar(80) + RLPF.ar(PinkNoise.ar, 80, 0.1) )!2 * EnvGen.ar(Env.perc(0.001,0.1), ~trig.ar[0]) }

// - 0:4:19.42 -  
~bass[0] = { (SinOsc.ar(80) + RLPF.ar(PinkNoise.ar, 70, 0.01) )!2 * EnvGen.ar(Env.perc(0.001,0.1), ~trig.ar[0]) }

// - 0:4:25.4 -  
~bass[0] = { (SinOsc.ar(70) + RLPF.ar(PinkNoise.ar, 70, 0.01) )!2 * EnvGen.ar(Env.perc(0.001,0.1), ~trig.ar[0]) }

// - 0:4:32.87 -  
~bass[0] = { (SinOsc.ar(70) + RLPF.ar(PinkNoise.ar, 70, 0.01) )!2 * EnvGen.ar(Env.perc(0.01,0.1), ~trig.ar[0]) }

// - 0:4:37.47 -  
~bass[0] = { (SinOsc.ar(70) + RLPF.ar(PinkNoise.ar, 70, 0.01) )!2 * EnvGen.ar(Env.perc(0.05,0.1), ~trig.ar[0]) }

// - 0:4:41.02 -  
~bass[0] = { (SinOsc.ar(70) + RLPF.ar(PinkNoise.ar, 70, 0.01) )!2 * EnvGen.ar(Env.perc(0.05,0.01), ~trig.ar[0]) }

// - 0:4:54.95 -  
~bass[0] = { (SinOsc.ar(70) + RLPF.ar(PinkNoise.ar, 70, 0.01) )!2 * EnvGen.ar(Env.perc(0.01,0.01), ~trig.ar[0]) }

// - 0:5:1.84 -  
~bass[0] = { (SinOsc.ar(70) + RLPF.ar(PinkNoise.ar, 70, 0.01) )!2 * EnvGen.ar(Env.perc(0.01,0.05), ~trig.ar[0]) }

// - 0:5:36.71 -  
~bass[0] = { (SinOsc.ar(70) + RLPF.ar(PinkNoise.ar, 70, 0.01) )!2 * EnvGen.ar(Env.perc(0.01,0.05), ~trig.ar[0]) * Latch.ar(WhiteNoise.ar, ~trig.ar[0]) }

// - 0:5:50.21 -  
~bass[1] = \filter -> { |in| DelayN.ar(in, 2, (0,0.125..1)).sum!2 }

// - 0:6:13.35 -  
p.fadeTime = 5

// - 0:6:29.22 -  
0.125/2

// - 0:6:37.08 -  
~bass[1] = \filter -> { |in| DelayN.ar(in, 2, (0,0.0625..1)).sum!2 }

// - 0:6:55.41 -  
~bass[1] = \filter -> { |in| Splay.ar(DelayN.ar(in, 2, (0,0.0625..1))) }

// - 0:7:8.81 -  
0.0625/2

// - 0:7:17.13 -  
~bass[1] = \filter -> { |in| Splay.ar(DelayN.ar(in, 2, (0,0.03125..1))) }

// WARNING!!! Do not do this:

// - 0:7:37.07 -  
~trig = { Impulse.ar([1,1.0001]*1.2) }	// bad line! bad line!

// - 0:7:48.28 -  
~bass[1] = \filter -> { |in| Splay.ar(DelayN.ar(in, 2, (0,0.03125..1))) * 2}

// - 0:7:53 -  
p.fadeTime = 5

// - 0:7:56.7 -  
p.end

