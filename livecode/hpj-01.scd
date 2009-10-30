p = ProxySpace.push(s)
~snd[0] = { Splay.ar(Pulse.ar(~seq * [1,1.01,2,05], mul:~amp).softclip.distort.wrap2(0.01)*100) * ~env}
~amp = 0.1

~snd[10] = \filter -> { |in| CombC.ar(in,5,0.05,0.5) }

~snd[20] = \filter -> { |in| RLPF.ar(in, ~seq*20, 0.01) }


~out = ~snd + ~sin
~trig = { TDuty.kr(Dseq([1,1,3,1,1,2]/8,inf)) }



^~seq = { Demand.kr(~trig, 0, Dseq([25,67,89,267,546].mirror1/2,inf)) }

p.fadeTime = 2
~out.play
~env = { EnvGen.kr(Env.perc(1,0), ~trig) }
~snd

~sin = { SinOsc.ar(Latch.ar(SinOsc.ar(1.23).range(120,400), Impulse.ar([1,1.251]))) * ~ring * ~amp * 10}
~ring = { SinOsc.ar(120).range(0,1) }

p.end(60)