///////////////////////////////////////////////////
// History, as it was on Mon Nov 23 00:32:25 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:1.3 -  
~out.play

// - 0:0:2.35 -  
~out = { Pulse.ar(\freq.kr(200)*[1,1.51,2,2.01], {rrand(0.1,0.9)}!4).sum * EnvGen.ar(Env.perc(0, 0.5), \t_trig.kr) * \amp.kr(0.1)!2 }

// - 0:0:3.54 -  
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(8, Pseq([100, 40], inf)), \dur, 0.5)).play

// - 0:0:9.87 -  
~out = { Pulse.ar(\freq.kr(200)*[1,1.51,2,2.01], {rrand(0.1,0.9)}!4).sum * EnvGen.ar(Env.perc(0, 0.5), \t_trig.kr) * \amp.kr(0.1)!2 }

// - 0:0:12.06 -  
~out = { Pulse.ar(\freq.kr(200)*[1,1.51,2,2.01], {rrand(0.1,0.9)}!4).sum * EnvGen.ar(Env.perc(0, 0.5), \t_trig.kr) * \amp.kr(0.1)!2 }

// - 0:0:23.11 -  
~out.fadeTime_(1)

// - 0:0:24.14 -  
~out = { Pulse.ar(\freq.kr(200)*[1,1.51,2,2.01], {rrand(0.1,0.9)}!4).sum * EnvGen.ar(Env.perc(0, 0.5), \t_trig.kr) * \amp.kr(0.1)!2 }

// - 0:0:56.06 -  
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play(quant:4)

// - 0:1:15.11 -  
~pad.play

// - 0:2:15.82 -  
Array.geom(8,1,1.25)

// - 0:2:44.07 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.25), mul:0.1).sum * \amp.kr(0.1) }

// - 0:2:49.48 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.25), mul:0.1).sum * \amp.kr(0.1)!2 }

// - 0:3:27.96 -  
NPxdef(~pad, Pbind(\freq, Pseq([200, 150], inf), \dur, 4)).play

// - 0:4:56.22 -  
NPxdef(~pad, Pbind(\freq, Pseq([200, 220, 150], inf), \dur, Pseq([2,2,4], inf))).play(quant:4)

// - 0:5:4.06 -  
NPxdef(~pad, Pbind(\freq, Pseq([200, 250, 150], inf), \dur, Pseq([2,2,4], inf))).play(quant:4)

// - 0:5:20.67 -  
~kick.play

// - 0:6:8.69 -  
~kick = { SinOsc.ar([80,120]).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr) }

// - 0:6:40.1 -  
NPdef(~kick, Pbind(\t_trig, 1, \dur, 1)).play(quant:4)

// - 0:6:51.07 -  
~kick = { SinOsc.ar([80,120]).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr)!2 }

// - 0:7:3.96 -  
~kick = { SinOsc.ar([80,120]).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:7:24.5 -  
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, 1)).play

// - 0:9:44.08 -  
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,1.5,1.5,1.5,0.5], inf))).play

// - 0:10:8.04 -  
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play

// - 0:10:13.54 -  
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play

// - 0:10:41.38 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play(quant:4);
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play(quant:4);
NPxdef(~pad, Pbind(\freq, Pseq([200, 250, 150], inf), \dur, Pseq([2,2,4], inf))).play(quant:4);
);

// - 0:10:56.15 -  
~kick = { SinOsc.ar([80,120]).sum * EnvGen.ar(Env.perc(0,0.2), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:11:3.93 -  
~kick = { SinOsc.ar([80,120]).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:11:8.07 -  
~kick = { SinOsc.ar([80,120]).sum * EnvGen.ar(Env.perc(0.001,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:11:11.92 -  
~kick = { SinOsc.ar([80,120]).sum * EnvGen.ar(Env.perc(0.0001,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:11:15.19 -  
~kick = { SinOsc.ar([80,120]).sum * EnvGen.ar(Env.perc(0.0005,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:11:38.03 -  
~kick = { SinOsc.ar([80,120]).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:12:25.94 -  
~kick = { SinOsc.ar([80,120]*EnvGen.kr(Env([1,0], [0.1]), \t_trig.kr)).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:12:35.23 -  
~kick = { SinOsc.ar([80,120]*EnvGen.kr(Env([1,2], [0.1]), \t_trig.kr)).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:12:42.16 -  
~kick = { SinOsc.ar([80,120]*EnvGen.kr(Env([1,2], [0.2]), \t_trig.kr)).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:12:49.81 -  
~kick = { SinOsc.ar([80,120]*EnvGen.kr(Env([2,0.5], [0.2]), \t_trig.kr)).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:12:52.31 -  
~kick = { SinOsc.ar([80,120]*EnvGen.ar(Env([2,0.5], [0.2]), \t_trig.kr)).sum * EnvGen.ar(Env.perc(0,0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:13:7.98 -  
~click.play

// - 0:13:48.51 -  
~click = { WhiteNoise.ar() * EnvGen.ar(Env.sine(0.1), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:14:17.8 -  
NPdef(~click, Pbind(\t_trig, 1, \dur, 0.25)).play(quant:4);

// - 0:14:25.91 -  
~click = { WhiteNoise.ar() * EnvGen.ar(Env.sine(0.01), \t_trig.kr)!2 * \amp.kr(0.1) }

// - 0:16:9.51 -  
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([0.1], 4), Pseq([9,1,1,1]/10), Pseq([9,1,1,9,1,1,9,1]/9)], inf), \dur, 0.25)).play(quant:4);

// - 0:16:27.22 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play(quant:4);
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play(quant:4);
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([0.1], 4), Pseq([9,1,1,1]/10), Pseq([9,1,1,9,1,1,9,1]/10)], inf), \dur, 0.25)).play(quant:4);
NPxdef(~pad, Pbind(\freq, Pseq([200, 250, 150], inf), \dur, Pseq([2,2,4], inf))).play(quant:4);
);

// - 0:16:38.38 -  
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([0.1], 4), Pseq([9,1,1,1]/10), Pseq([9,1,1,9,1,1,9,1]/10)], inf) * 0.5, \dur, 0.25)).play(quant:4);

// - 0:17:12.26 -  
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([0.1], 4), Pseq([9,1,1,1]/10), Pseq([9,1,1,9,1,1,9,1]/10)], inf) * 0.1, \dur, 0.25)).play(quant:4);

// - 0:17:28.77 -  
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([0.1], 4), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play(quant:4);

// - 0:17:44.82 -  
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play(quant:4);

// - 0:17:49.84 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play(quant:4);
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play(quant:4);
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play(quant:4);
NPxdef(~pad, Pbind(\freq, Pseq([200, 250, 150], inf), \dur, Pseq([2,2,4], inf))).play(quant:4);
);

// - 0:18:5.96 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.33), mul:0.1).sum * \amp.kr(0.1)!2 }

// - 0:18:14.19 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.125), mul:0.1).sum * \amp.kr(0.1)!2 }

// - 0:18:31.82 -  
NPxdef(~pad, Pbind(\freq, Pseq([200, 250, 150], inf), \amp, 0.5, \dur, Pseq([2,2,4], inf))).play(quant:4);

// - 0:18:37.56 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play(quant:4);
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play(quant:4);
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play(quant:4);
NPxdef(~pad, Pbind(\freq, Pseq([200, 250, 150], inf), \amp, 0.5, \dur, Pseq([2,2,4], inf))).play(quant:4);
);

// - 0:19:6.22 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Pseq([200, 250, 150], inf), \amp, 0.5, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:20:2.03 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],4), Pseq([300,350,250],4)], inf), \amp, 0.5, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:20:30.09 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.5), mul:0.1).sum * \amp.kr(0.1)!2 }

// - 0:20:42.03 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.5), mul:0.1).sum * \amp.kr(0.1)!2 }

// - 0:20:48.48 -  
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],4), Pseq([300,350,250],4)], inf), \amp, 0.1, \dur, Pseq([2,2,4], inf))).play;

// - 0:20:56.81 -  
~pad.fadeTime = 0.5

// - 0:21:3.02 -  
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],4), Pseq([300,350,250],4)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;

// - 0:21:10.21 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],4), Pseq([300,350,250],4)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:21:17.38 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],4), Pseq([300,350,250],4)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:21:50.1 -  
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,225],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;

// - 0:21:58.49 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,225],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:22:6.86 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,225],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:22:23.23 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.5), mul:0.1).sum * \amp.kr(0.1)!2 * LFDNoise3.kr(1)}

// - 0:22:34.58 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.5), mul:0.1).sum * \amp.kr(0.1)!2 * LFDNoise3.kr(10).range(0.8,1)}

// - 0:22:40.05 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.5), mul:0.1).sum * \amp.kr(0.1)!2 * LFDNoise3.kr(20).range(0.8,1)}

// - 0:22:47.74 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,225],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:23:4 -  
~pad = { SinOsc.ar(\freq.kr(200)*Array.geom(8,1,1.5), mul:0.1).sum * \amp.kr(0.1)!2 * LFDNoise3.kr(40).range(0.5,1)}

// - 0:23:44.05 -  
~pad[10] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.8, 0.8, 0.9) }

// - 0:24:0.4 -  
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;

// - 0:24:15.98 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:24:28.45 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:0.43 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:6.98 -  
~pad.fadeTime = 0.1

// - 0:25:20.82 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:21.87 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:22.46 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:23.1 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:23.74 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:24.34 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:24.82 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:25.33 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:25.9 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:26.42 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:26.99 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:27.52 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:28.05 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:28.54 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:29.02 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:25:29.49 -  
(
NPdef(~kick, Pbind(\t_trig, 1, \amp, 0.5, \dur, Pseq([1,1,0.75,0.75,0.5], inf))).play;
NPdef(~out, Pbind(\t_trig, 1, \freq, Pstutter(16, Pseq([100, 40], inf)), \dur, 0.25)).play;
NPdef(~click, Pbind(\t_trig, 1, \amp, Prand([Pseq([1,1,1,1]/2), Pseq([2,1,1,1]/2), Pseq([2,1,1,2,1,1,2,1]/2)], inf) * 0.1, \dur, 0.25)).play;
NPxdef(~pad, Pbind(\freq, Prand([Pseq([200, 250, 150],2), Pseq([300,350,250],2), Pseq([100,150,190],2)], inf), \amp, 0.2, \dur, Pseq([2,2,4], inf))).play;
);

// - 0:26:2.46 -  
p.end(20)

