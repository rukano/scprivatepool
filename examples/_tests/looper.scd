b = Buffer.alloc(s, 10*s.sampleRate)

~rec = { RecordBuf.ar(SoundIn.ar(0), b, recLevel:0.75, preLevel:0.75, loop:0, trigger:\t_trig.kr) }
~rec.set(\t_trig, 1)

b.play

~play = { PlayBuf.ar(1, b, BufRateScale.kr(b) * \rate.kr(1), \t_trig.kr, loop:1) }
~play.play
~play.set(\t_trig, 1)

Tdef(\looper, { inf.do{ ~play.set(\t_trig, 1); 4.wait } }).play
Tdef(\click, { inf.do{ |i| Synth(\click, [\amp, (4-(i%4)/4)]); 0.5.wait } }).play
Tdef(\recorder, { inf.do { ~rec.set(\t_trig, 1); 4.wait; } }).play


s.latency = nil

SynthDef(\click, { |amp=0.1| OffsetOut.ar(0, Impulse.ar(0).dup * amp * EnvGen.ar(Env.perc(0,0.1), doneAction:2)) }).memStore
Synth(\click)

b.normalize
b.fill(0,b.numFrames,0)