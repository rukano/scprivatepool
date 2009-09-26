///////////////////////////////////////////////////
// History, as it was on Sun Sep 27 00:11:11 2009.
///////////////////////////////////////////////////

// Needs UGenPatterns - Only testing code, it wasn't really live coding...

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:1:3.35 -  
~snd = { SinOsc.ar( \freq.kr(440) ) * \amp.kr(0.1) * EnvGen.kr(Env.sine, doneAction:2) }

// - 0:1:29.31 -  
~snd[0]

// - 0:1:40.06 -  
~snd[0].asSynthDef

// - 0:1:47.15 -  
~snd[0].asSynthDef.store(name: \test)

// - 0:2:47.86 -  
~snd[0].asSynthDef(name: \test).store

// - 0:3:39.69 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 1, \freq, Pseq([300,400,450], inf)))

// - 0:3:46.7 -  
Pdef(\main).play

// - 0:3:56.19 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.sine, doneAction:2) }

// - 0:3:58.61 -  
~snd[0].asSynthDef(name: \test).store

// - 0:5:5.3 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 1, \freq, PLine(100,400,10)))

// - 0:5:22.46 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 1, \freq, PLine(100,400,3)))

// - 0:7:19.37 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 1, \freq, PSinOsc(4, 0)))

// - 0:7:28.61 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 1, \freq, PSinOsc(4, 0, 300, 400)))

// - 0:7:40.58 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 0.25, \freq, PSinOsc(4, 0, 300, 400)))

// - 0:8:1.37 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.sine(0.5), doneAction:2) }

// - 0:8:1.66 -  
~snd[0].asSynthDef(name: \test).store

// - 0:8:9.67 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.sine(0.25), doneAction:2) }

// - 0:8:18.96 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.sine(\sustain.kr(0.1)), doneAction:2) }

// - 0:8:19.24 -  
~snd[0].asSynthDef(name: \test).store

// - 0:8:41.45 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 0.25, \freq, PSinOsc(4, 0, 300, 400), \legato, Pwhite(0.1, 2, inf)))

// - 0:8:51.95 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 0.25, \freq, PSinOsc(4, 0, 300, 400), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:8:58.92 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 0.25, \freq, PSinOsc(4, 0, 300, 400), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:9:7.28 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 0.25, \freq, PSinOsc(4, 0, 100, 200), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:9:15.18 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 0.25, \freq, PSinOsc(1, 0, 100, 200), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:9:31.46 -  
Pdef(\main, Pbind(\instrument, \test, \dur, 0.25, \freq, PSinOsc(1.1, 0, 100, 200), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:10:48.05 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.5, 0.6), \freq, PSinOsc(1.1, 0, 100, 200), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:10:57.63 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.5, 0, 0.5, 0.6), \freq, PSinOsc(1.1, 0, 100, 200), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:11:4.75 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(1, 0, 0.5, 0.6), \freq, PSinOsc(1.1, 0, 100, 200), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:11:14.5 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(1, 0, 0.9, 1), \freq, PSinOsc(1.1, 0, 100, 200), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:11:24.88 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(10, 0, 0.9, 1), \freq, PSinOsc(1.1, 0, 100, 200), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:11:29.94 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(1.1, 0, 100, 200), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:11:47.15 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(1.1, 0, 100, 500), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:11:51.8 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(1.1, 0, 100, 300), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:11:55.62 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(1.1, 0, 250, 300), \legato, Pwhite(0.5, 1.2, inf)))

// - 0:12:12.02 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(1.1, 0, 250, 300), \legato, Pwhite(0.1, 1.1, inf)))

// - 0:12:55.57 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(4, 0, 250, 300), \legato, Pwhite(0.1, 1.1, inf)))

// - 0:13:0.26 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(1, 0, 250, 300), \legato, Pwhite(0.1, 1.1, inf)))

// - 0:13:9.54 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(0.5, 0, 250, 300), \legato, Pwhite(0.1, 1.1, inf)))

// - 0:13:13.66 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(0.88, 0, 250, 300), \legato, Pwhite(0.1, 1.1, inf)))

// - 0:13:27.94 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.0001, \sustain.kr(0.1)), doneAction:2) }

// - 0:13:29.37 -  
~snd[0].asSynthDef(name: \test).store

// - 0:13:32.89 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.01, \sustain.kr(0.1)), doneAction:2) }

// - 0:13:34.08 -  
~snd[0].asSynthDef(name: \test).store

// - 0:13:38.29 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.05, \sustain.kr(0.1)), doneAction:2) }

// - 0:13:38.46 -  
~snd[0].asSynthDef(name: \test).store

// - 0:13:49.79 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(0.88, 0, 250, 300), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:13:53.14 -  
Pdef(\main, Pbind(\instrument, \test, \dur, PLFTri(0.1, 0, 0.9, 1), \freq, PSinOsc(0.88, 0, 250, 300), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:14:18.91 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1), inf), \freq, PSinOsc(0.88, 0, 250, 300), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:14:31.93 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(0.88, 0, 250, 300), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:14:53.56 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(0.88, 0, 700, 800), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:15:1.54 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2, 0, 700, 800), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:15:9.14 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.001, 0, 700, 800), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:15:16.81 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2, 0, 700, 800), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:15:22.88 -  
Pdef(\main).stop

// - 0:15:28.1 -  
Pdef(\main).play

// - 0:15:38.08 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.001, 0, 700, 800), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:15:50.41 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.01, 0, 700, 800), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:15:57.58 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.0051, 0, 700, 800), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:16:5.4 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.00001, 0, 700, 800), \legato, Pwhite(0.1, 0.5, inf)))

// - 0:16:10.85 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.001, \sustain.kr(0.1)), doneAction:2) }

// - 0:16:12.24 -  
~snd[0].asSynthDef(name: \test).store

// - 0:16:22.46 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.00001, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:16:25.12 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.00001, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:16:28.79 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.005, \sustain.kr(0.1)), doneAction:2) }

// - 0:16:28.92 -  
~snd[0].asSynthDef(name: \test).store

// - 0:16:34.37 -  
~snd = { SinOsc.ar( \freq.kr(440)!2 ) * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.01, \sustain.kr(0.1)), doneAction:2) }

// - 0:16:34.94 -  
~snd[0].asSynthDef(name: \test).store

// - 0:16:42.07 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.0001, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:16:49.54 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.001, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:17:24.94 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.005, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:17:45.14 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.01, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:17:50.54 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.01, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:17:52.32 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.01, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:17:54.32 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.01, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:17:56.47 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.01, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:17:58.9 -  
Pdef(\main, Pbind(\instrument, \test, \dur, Pseq((0.1,0.2..1).mirror/4, inf), \freq, PSinOsc(2.01, 0, 700, 800), \legato, Pwhite(0.2, 0.4, inf)))

// - 0:18:4.52 -  
Pdef(\main).stop

