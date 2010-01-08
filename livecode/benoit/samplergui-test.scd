p.makeTempoClock
~tempo = 1.65
~trig = { TDuty.kr(Dseq([1,2,1,1,1,2,1,3].scramble / ~tempo.kr / 4, inf)) }
~snd[0] = { var buf = TChoose.kr(~trig.kr, b.asArray); PlayBuf.ar(1, buf, BufRateScale.kr(buf) * TRand.kr(0.8,0.9,~trig.kr) * TChoose.kr(~trig.kr, [-1,1]), ~trig.kr)!2 }
~snd.play



b.asArray.do{ |buf| buf.normalize }

~snd[10] = \filter -> { |in| DelayN.ar(in.first, 2, [0, 0.01]) * 0.5 }
~snd[20] = \filter -> { |in| CombC.ar(in, 5, 0.005, 2) }
~snd[30] = \filter -> { |in| Splay.ar(MidEQ.ar(in, [128, 440, 660,1600], LFNoise2.kr(1).range(0.1,1), LFNoise2.kr(1).range(-5, 5))) * 0.5 }
~snd[50] = \filter -> { |in| FreeVerb2.ar(in[0]*2, in[1]*2, 0.5, 0.1, 0.99) }

p.end(2)

