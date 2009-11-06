p = ProxySpace.push(s.boot)

~snd.play

~snd[0] = { Pulse.ar(~freq) * ~amp * ~mod * ~env}

~env = { EnvGen.kr(Env.perc(0.01, TRand.kr(0.01,0.5,~trig)), ~trig, 0.1) }

~mod = { LFCub.kr(50) }

~snd[10] = \filter -> { |in| Formlet.ar(in, ~freq, 0.01, 0.1).distort.wrap2(0.1).softclip }

~snd[20] = \filter -> { |in| LPF.ar(in, 8000) }

~snd[50] = \filter -> { |in| CombC.ar(in, 5, 0.5, 3) }

~snd[100] = \filter -> { |in| LPF.ar(in, ~freq * 4) + FreeVerb.ar(in, 1, 1, 1) }

~snd[101] = \filter -> { |in| Limiter.ar(in, 0.9) }

p.fadeTime_(1)

~freq = { Demand.kr(~trig, 0, Dseq((50,80..2000)*4,inf)) }

~trig = { TDuty.kr(Dseq([1,2,1.5,2,1.33,1.5,2,2.1,2.5]/2,inf)) }

~amp = 1

~bass.play

~bass = { SinOsc.ar([66,68] * ~bassratio) * ~bassamp }

~bassratio = { LFPar.kr(0.05).range(0.5,1.5) }

~bassamp = { SinOsc.kr(1).range(0,1) }

~bass.play

~mic.play
~mic = { SoundIn.ar(0) * SinOsc.ar(120) * 0.1 }
p.end(10)