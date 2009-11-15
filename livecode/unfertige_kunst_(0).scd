p = ProxySpace.push(s)
b = Buffer.read(s, "~/Desktop/bad_samples.aif".standardizePath)
b.play

~out.ar(2)
~out.play
~player.clear
~player = { PlayBuf.ar(1, b, BufRateScale.kr(b)*\rate.kr(1), \t_trig.kr(1), BufFrames.kr(b) * \start.kr, \loop.kr(1))!2 * \amp.kr(0.1)  }

~out = ~player

NPdef(~player, Pbind(\t_trig, 1, \rate, Pseq(([0,7,7,0,9,7,0,0].midiratio)/4,inf), \start, Pwhite(0.3, 0.7, inf), \amp, 1, \dur, Pseq([1,2,1,1,2,1,4,1,1,2,1,4,1,2,2,1,2,1]/4,inf))).play

~player.set(\start, 0.9, \t_trig, 1, \rate, 1)

~click = { BPF.ar(WhiteNoise.ar!2, TRand.kr(2000,8000,~trig), 0.1) * EnvGen.ar(Env.perc(0,0.01), ~trig) }

~trig = { Trig.kr(\t_trig.kr, 0.01) }

NPdef(~trig, Pbind(\t_trig, 1, \dur, Pseq([1,2,2,1,1,4,1,1,2,1,Pseq((1!4)/4),1,2,2,1,2,4,1,4,Pseq(0.25!8)]/4,inf))).play

~out = ~player + ~click

~click[10] = \filter -> { |in| CombC.ar(in, 4, 0.25, 1) }
~click[50] = \filter -> { |in| in + GVerb.ar(in, 10, mul:0.5) }

~player[50] = \filter -> { |in| in + GVerb.ar(in, mul:0.75) }

~mod = ~player.ar * { SinOsc.kr(200).range(0,1) }

~out = ~player + ~click + ~Êmod