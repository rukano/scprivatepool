p = ProxySpace.push(s)
p.fadeTime = 1

~snd.clear

~snd[0] = { Splay.ar(Blip.ar(~freq.kr.lag(0.1), TRand.kr(10,50,~trig), 4).distort.wrap2(0.2) * ~amp * EnvGen.kr(Env.sine(0.01), ~trig) )}

~snd[10] = \filter -> { |in| Splay.ar(DelayN.ar(in + (~player.ar), 4, [0,1,2,3])) }

~amp = 2

~root = 0

~freq = { Demand.kr(~trig, 0, Dseq(((10,11..45).mirror1.scramble + ~root.kr).midicps, inf)) }

~trig = { TDuty.kr(Dseq([1,2,1,1,2,1,0.5,0.5,2,1,1,1,2,1,1,2,1,2,0.5,0.5,0.5,0.5]/4, inf)) }

~out.play

~out = ~snd
~out.clear

Demand
TDuty
Duty
LFDNoise

b = Buffer.alloc(s, s.sampleRate * 4)
b.normalize
~rec = { RecordBuf.ar(SoundIn.ar(0), b, 0, 1, 0, loop:0, trigger:1) }


~player.play

~player = { PlayBuf.ar(1, b, TChoose.kr(~trig, [0.25,0.33]++(0.5,1..2) * ~rate.kr), ~trig, loop:1) * 0.1 }

~rate = 1

~buftrig = { Impulse.kr(4) }

p.end(60)
