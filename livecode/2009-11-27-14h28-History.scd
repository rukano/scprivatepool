///////////////////////////////////////////////////
// History, as it was on Fri Nov 27 14:28:00 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:1.78 -  
p.fadeTime = 1

// - 0:0:10.78 -  
~out.play

// - 0:0:16.9 -  
~snd.ar(2)

// - 0:0:17.79 -  
~out = ~snd

// - 0:0:18.99 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.15), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:0:21.29 -  
~snd[10] = \filter -> {|in| in + DelayC.ar(in, 2, 1) }

// - 0:0:22.25 -  
~snd[20] = \filter -> {|in| in * LFClipNoise.ar(10,0.4,0.6) }

// - 0:0:23.26 -  
~snd[50] = \filter -> {|in| in + FreeVerb2.ar(in[0], in[1], 1, 1, 0.99, 0.5)}

// - 0:0:25.18 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Pwrand([Pseq([100,200]), Pseq([150,300])], [0.7,0.3], inf), \amp, 1, \sustain, Prand([0.5,1,2], inf), \dur, Pseq([1,2], inf))).play

// - 0:0:30.53 -  
TempoClock.default.tempo = 1

// - 0:1:11.02 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Pwrand([Pseq([100,200,250,300]), Pseq([150,300])], [0.7,0.3], inf), \amp, 1, \sustain, Prand([0.5,1,2], inf), \dur, Pseq([1,2], inf))).play

// - 0:1:49.98 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.15), mul:0.1)) * EnvGen.kr(Env.perc(0.01, \sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:2:30.14 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.15), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:2:44.91 -  
~snd[50] = \filter -> {|in| in + FreeVerb2.ar(in[0], in[1], 1, 1, 0.99, 0.5)}

// - 0:3:3.15 -  
~snd[50] = \filter -> {|in| in + 4.do { FreeVerb2.ar(in[0], in[1], 1, 1, 0.99, 0.5) } }

// - 0:3:11 -  
~snd[50] = \filter -> {|in| in + FreeVerb2.ar(in[0], in[1], 1, 1, 0.99, 0.5) }

// - 0:3:14.32 -  
~snd[20] = \filter -> {|in| in * LFClipNoise.ar(10,0.4,0.6) }

// - 0:3:15.15 -  
~snd[10] = \filter -> {|in| in + DelayC.ar(in, 2, 1) }

// - 0:3:19.45 -  
p.fadeTime = 1

// - 0:3:39.21 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Pseq([100,200,300,500,800], inf), \amp, 1, \sustain, Prand([0.5,1,2], inf), \dur, Pseq([1,2], inf))).play

// - 0:4:1.06 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Pseq((80,125..800), inf), \amp, 1, \sustain, Prand([0.5,1,2], inf), \dur, Pseq([1,2], inf))).play

// - 0:4:13.67 -  
~snd[50] = \filter -> {|in| in + FreeVerb2.ar(in[0], in[1], 1, 1, 0.99, 0.8) }

// - 0:4:25.88 -  
~snd[50] = \filter -> {|in| in + FreeVerb2.ar(in[0], in[1], 1, 1, 0.99, 2) }

// - 0:5:14.54 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Pseq((80,125..800), inf), \amp, 1, \sustain, Prand([0.5,1,2], inf), \dur, Pseq([1,2]/2, inf))).play

// - 0:5:24.79 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Pseq((80,125..800), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Pseq([1,2]/2, inf))).play

// - 0:5:28.77 -  
~snd[50] = \filter -> {|in| in + FreeVerb2.ar(in[0], in[1], 1, 1, 0.99, 1) }

// - 0:5:45.42 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Pseq((80,125..800), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Prand([1,2]/4, inf))).play

// - 0:5:52.86 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,125..800), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Prand([1,2]/4, inf))).play

// - 0:6:3.58 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,99..450), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Prand([1,2]/4, inf))).play

// - 0:6:14.18 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,99..450)*10, inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Prand([1,2]/8, inf))).play

// - 0:6:27.19 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.25), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:6:30.86 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.35), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:6:34.35 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.5), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:6:37.3 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.1), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:6:43.31 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,0.95), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:6:52.6 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,0.85), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:7:6.47 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.124), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:7:11.42 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,99..450)*20, inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Prand([1,2]/8, inf))).play

// - 0:7:16.92 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,99..450), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Prand([1,2]/8, inf))).play

// - 0:7:56.02 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,99..450), inf) * Pseq((1..5), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Prand([1,2]/8, inf))).play

// - 0:8:6.38 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,99..450), inf) * Pseq((1..5), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Prand([1,2,4,8]/8, inf))).play

// - 0:8:17.66 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,99..450), inf) * Pseq((1..5), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Pseq([1,2,1,1,2,1,2,4,1,2,4,1]/8, inf))).play

// - 0:8:23.79 -  
~snd[50] = \filter -> {|in| in + FreeVerb2.ar(in[0], in[1], 0.4, 0.4, 0.99, 1) }

// - 0:8:37.21 -  
~snd[50] = \filter -> {|in| in + FreeVerb2.ar(in[0], in[1], 0.4, 0.7, 0.99, 1) }

// - 0:8:40.14 -  
~snd[50] = \filter -> {|in| in + FreeVerb2.ar(in[0], in[1], 0.7, 0.7, 0.99, 1) }

// - 0:8:48.67 -  
~snd[20] = \filter -> {|in| in * LFClipNoise.ar(20,0.4,0.6) }

// - 0:8:56.47 -  
~snd[20] = \filter -> {|in| in * LFClipNoise.ar(40,0.4,0.6) }

// - 0:9:18.34 -  
~snd[10] = \filter -> {|in| in + DelayC.ar(in, 2, [0.5,1,1.3]).sum }

// - 0:9:30.53 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.134), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:9:33.91 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.15), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:9:36.78 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.15), mul:0.3)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:9:41.36 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.15), mul:0.01)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:9:44.48 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.15), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:9:49.67 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.5), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:9:57.66 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.51), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:3.18 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.52), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:7.13 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.53), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:10.57 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.55), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:13.99 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.58), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:20.15 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.7), mul:0.1)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:23.99 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.7), mul:0.05)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:29.33 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.89), mul:0.05)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:33.11 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1,1.89), mul:0.033)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:50.62 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1, 2), mul:0.033)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:10:59.31 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1, 1), mul:0.033)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr}

// - 0:11:9.9 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,99..450), inf) * Pseq((1..5), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Pseq([1,2,1,1,2,1,2,4,1,2,4,1]/8, inf))).stop

// - 0:11:15.7 -  
NPdef(~snd, Pbind(\t_trig, 1, \freq, Prand((80,99..450), inf) * Pseq((1..5), inf), \amp, 1, \sustain, Prand([0.1,0.2,0.5], inf), \dur, Pseq([1,2,1,1,2,1,2,4,1,2,4,1]/8, inf))).play

// - 0:11:27.99 -  
~amp = 1

// - 0:11:33.87 -  
~snd[0] = { Splay.ar(SinOsc.ar((\freq.kr(100)+LFNoise2.kr(1,5,0)) * Array.geom(10,1, 1), mul:0.033)) * EnvGen.kr(Env.sine(\sustain.kr(1)), \t_trig.kr) * \amp.kr * ~amp}

// - 0:11:40.27 -  
~amp.fadeTime = 10

// - 0:11:48.88 -  
p.end(60)

