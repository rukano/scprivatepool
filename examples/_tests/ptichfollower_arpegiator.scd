~out = ~snd
~snd[0] = { SoundIn.ar(1)!2 * 2 }
~trig = { Amplitude.kr(~snd.ar) > 0.01 }
~triggen = { Trig.kr(~trig, 0.01) }
~sin = { SinOsc.ar(~seq.kr * ~pitch.kr)!2 * EnvGen.kr(Env.perc, ~triggen) * 0.1}
~sin.play

~seq = { Demand.kr(~triggen, 0, Dseq((2,2.5..4), inf)) }

~pitch = { Pitch.kr(~snd.ar, ampThreshold:0.01, median: 1).at(1) }