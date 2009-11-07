///////////////////////////////////////////////////
// History, as it was on Sat Nov  7 18:46:45 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:0.9 -  
~snd.play

// - 0:0:2.81 -  
~snd = { Splay.ar(Pulse.ar(\factor.kr(0.5).lag * Array.rand(16, 400.0, 450.0) * LFDNoise3.kr(10).range(0.95,1.05), Array.rand(16, 0.3, 0.7),mul:0.1)) }

// - 0:0:5.38 -  
NPdef(~snd, Pbind(\factor, Pseq(([0,7,5,7,6,7,9,10,1,0,0,-11]*4).midiratio, inf), \dur, Pseq([1,2,1,1,2,1,1,2,1,2,4,1,4,4,1,4,1,2,2,1,1]/8,inf)))

// - 0:0:10.18 -  
NPdef(~snd, Pbind(\factor, Pseq(([0,7,5,7,6,7,9,10,1,0,0,-11]*4).midiratio, inf), \dur, Pseq([1,2,1,1,2,1,1,2,1,2,4,1,4,4,1,4,1,2,2,1,1]/8,inf))).play

// - 0:0:14.22 -  
~kick.play

// - 0:0:15.79 -  
~kick = { SinOsc.ar(TRand.kr(60,100,\t_trig.kr))!2 * EnvGen.ar(Env.perc, \t_trig.kr) }

// - 0:0:17.85 -  
NPdef(~kick, Pbind(\t_trig, 1, \dur, Pseq([1,2,1,1,2,4,1,2,2,1,4,1,4,4,1,4,2,4,1,4,1,1,4,2,4,2]/4, inf))).play

// - 0:0:20.93 -  
~noise.play

// - 0:1:5.8 -  
~noise = { HPF.ar(WhiteNoise.ar, 5000) * EnvGen.ar(Env.perc(0, \sustain.kr), \t_trig.kr)}

// - 0:1:59.23 -  
NPdef(~noise, Pbind(\sustain, 0.1, \t_trig, 1, \dur, Pseq([1,1,1,2,1,1,1,1,4,1,1,4,1,2,2,2,2,1,1,1,2,1,1,2,1,2,2,1,2,1,2,1], inf))).play

// - 0:2:7.03 -  
~noise.clear

// - 0:2:13.63 -  
~noise = { HPF.ar(WhiteNoise.ar, 5000)!2 * EnvGen.ar(Env.perc(0, \sustain.kr), \t_trig.kr)}

// - 0:2:16.2 -  
~noise.play

// - 0:2:18.68 -  
NPdef(~noise, Pbind(\sustain, 0.1, \t_trig, 1, \dur, Pseq([1,1,1,2,1,1,1,1,4,1,1,4,1,2,2,2,2,1,1,1,2,1,1,2,1,2,2,1,2,1,2,1], inf))).play

// - 0:2:21.9 -  
NPdef(~noise, Pbind(\sustain, 0.1, \t_trig, 1, \dur, Pseq([1,1,1,2,1,1,1,1,4,1,1,4,1,2,2,2,2,1,1,1,2,1,1,2,1,2,2,1,2,1,2,1]/4, inf))).play

// - 0:2:28.83 -  
~noise = { HPF.ar(WhiteNoise.ar, 5000)!2 * EnvGen.ar(Env.perc(0, \sustain.kr), \t_trig.kr) * 0.1}

// - 0:2:36.14 -  
~noise = { HPF.ar(WhiteNoise.ar, 5000)!2 * EnvGen.ar(Env.perc(0, \sustain.kr), \t_trig.kr) * \amp.kr(0.1)}

// - 0:2:46.73 -  
NPdef(~noise, Pbind(\sustain, 0.1, \t_trig, 1, \amp, 0.2, \dur, Pseq([1,1,1,2,1,1,1,1,4,1,1,4,1,2,2,2,2,1,1,1,2,1,1,2,1,2,2,1,2,1,2,1]/4, inf))).play

// - 0:2:53.3 -  
NPdef(~noise, Pbind(\sustain, 0.01, \t_trig, 1, \amp, 0.2, \dur, Pseq([1,1,1,2,1,1,1,1,4,1,1,4,1,2,2,2,2,1,1,1,2,1,1,2,1,2,2,1,2,1,2,1]/4, inf))).play

// - 0:2:57.78 -  
NPdef(~noise, Pbind(\sustain, 0.05, \t_trig, 1, \amp, 0.2, \dur, Pseq([1,1,1,2,1,1,1,1,4,1,1,4,1,2,2,2,2,1,1,1,2,1,1,2,1,2,2,1,2,1,2,1]/4, inf))).play

// - 0:3:6.44 -  
~noise = { RHPF.ar(WhiteNoise.ar, 5000, 0.1)!2 * EnvGen.ar(Env.perc(0, \sustain.kr), \t_trig.kr) * \amp.kr(0.1)}

// - 0:3:10.79 -  
~noise = { RHPF.ar(WhiteNoise.ar, 5000, 0.5)!2 * EnvGen.ar(Env.perc(0, \sustain.kr), \t_trig.kr) * \amp.kr(0.1)}

// - 0:3:18.86 -  
NPdef(~snd, Pbind(\factor, Pseq(([0,7,5,7,6,7,9,10,1,0,0,-11]).midiratio, inf), \dur, Pseq([1,2,1,1,2,1,1,2,1,2,4,1,4,4,1,4,1,2,2,1,1]/8,inf))).play

// - 0:3:26.87 -  
NPdef(~snd, Pbind(\factor, Pseq(([0,7,5,7,6,7,9,10,1,0,0,-11]-24).midiratio, inf), \dur, Pseq([1,2,1,1,2,1,1,2,1,2,4,1,4,4,1,4,1,2,2,1,1]/8,inf))).play

// - 0:3:58.75 -  
NPdef(~snd, Pbind(\factor, Pseq(([0,7,5,7,6,7,9,10,1,0,0,-11, \]-24).midiratio, inf), \dur, Pseq([1,2,1,1,2,1,1,2,1,2,4,1,4,4,1,4,1,2,2,1,1]/8,inf))).play

// - 0:4:7.49 -  
NPdef(~snd, Pbind(\factor, Pseq(([0,7,5,7,6,7,9,10,1,0,0,-11, \, \, \, \]-24).midiratio, inf), \dur, Pseq([1,2,1,1,2,1,1,2,1,2,4,1,4,4,1,4,1,2,2,1,1]/8,inf))).play

// - 0:4:22.22 -  
NPdef(~snd, Pbind(\factor, Pseq(([0,7,5,7,6,7,9,10,1,0,0,-11]-24).midiratio, inf), \dur, Pseq([1,2,1,1,2,1,1,2,1,2,4,1,4,4,1,4,1,2,2,1,1]/8,inf))).play

// - 0:4:26.54 -  
NPdef(~snd, Pbind(\factor, Pseq(([0,7,5,7,6,7,9,10,1,0,0,-11]-24).midiratio, inf), \dur, Pseq([1,2,1,1,2,1,1,2,1,2,4,1,4,4,1,4,1,2,2,1,1]/4,inf))).play

// - 0:4:47.08 -  
~snd = { Splay.ar(Pulse.ar(\factor.kr(0.5).lag * Array.rand(16, 400.0, 450.0) * LFDNoise3.kr(10).range(0.95,1.05), Array.rand(16, 0.3, 0.7),mul:0.1)) * EnvGen.kr(Env.sine(0.5), \t_trig.kr)}

// - 0:4:55.1 -  
NPdef(~snd, Pbind(\t_trig, 1, \factor, Pseq(([0,7,5,7,6,7,9,10,1,0,0,-11]-24).midiratio, inf), \dur, Pseq([1,2,1,1,2,1,1,2,1,2,4,1,4,4,1,4,1,2,2,1,1]/4,inf))).play

// - 0:4:59.92 -  
~snd = { Splay.ar(Pulse.ar(\factor.kr(0.5).lag * Array.rand(16, 400.0, 450.0) * LFDNoise3.kr(10).range(0.95,1.05), Array.rand(16, 0.3, 0.7),mul:0.1)) * EnvGen.kr(Env.sine(0.1), \t_trig.kr)}

// - 0:5:21.4 -  
~snd = { Splay.ar(Pulse.ar(\factor.kr(0.5).lag * Array.rand(16, 400.0, 450.0) * LFDNoise3.kr(10).range(0.95,1.05), Array.rand(16, 0.3, 0.7),mul:0.1)) * EnvGen.kr(Env.sine(0.1), \t_trig.kr) * 4 }

// - 0:5:27.84 -  
~snd = { Splay.ar(Pulse.ar(\factor.kr(0.5).lag * Array.rand(16, 400.0, 450.0) * LFDNoise3.kr(10).range(0.95,1.05), Array.rand(16, 0.3, 0.7),mul:0.1)) * EnvGen.kr(Env.sine(0.1), \t_trig.kr) * 2 }

// - 0:5:34.46 -  
~snd = { Splay.ar(Pulse.ar(\factor.kr(0.5).lag * Array.rand(16, 400.0, 450.0) * LFDNoise3.kr(10).range(0.95,1.05), Array.rand(16, 0.3, 0.7),mul:0.1)) * EnvGen.kr(Env.perc(0,0.1), \t_trig.kr) * 2 }

// - 0:5:41.83 -  
~snd = { Splay.ar(Pulse.ar(\factor.kr(0.5).lag * Array.rand(16, 400.0, 450.0) * LFDNoise3.kr(10).range(0.95,1.05), Array.rand(16, 0.3, 0.7),mul:0.1)) * EnvGen.kr(Env.perc(0.01, 0.2), \t_trig.kr) * 2 }

// - 0:5:57.34 -  
p.fadeTime = 5

// - 0:6:1.22 -  
p.end(10)

