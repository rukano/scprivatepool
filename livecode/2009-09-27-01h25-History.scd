///////////////////////////////////////////////////
// History, as it was on Sun Sep 27 01:25:11 2009.
///////////////////////////////////////////////////

// Warning, you need a SnthDef with RecordBuf named 'recoder' for the live interaction

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:8.19 -  
~dust .play

// - 0:0:20.78 -  
~dust.fadeTime = 10

// - 0:0:52.4 -  
~dust = { Dust.ar([2,3]) * \amp.kr(0.1) }

// - 0:1:14.26 -  
~dust .play

// - 0:1:18.41 -  
~dust = { Dust.ar([2,3]) * \amp.kr(0.1) }

// - 0:2:19.45 -  
~dust[10] = \filter -> { |in| Splay.ar(BPF.ar(in, (100,200..1000), 0.05)) }

// - 0:2:37.18 -  
~dust[10] = \filter -> { |in| Splay.ar(BPF.ar(in, 1000, 0.05)) }

// - 0:2:40.67 -  
~dust[10] = \filter -> { |in| Splay.ar(BPF.ar(in, 1000, 0.01)) }

// - 0:2:51.67 -  
~dust[10] = \filter -> { |in| Splay.ar(BPF.ar(in, 1000, 0.1)) }

// - 0:2:59.73 -  
~dust[10] = \filter -> { |in| Splay.ar(RLPF.ar(in, 1000, 0.1)) }

// - 0:3:9.58 -  
~dust[0] = { Dust.ar([2,3]) * \amp.kr(0.5) }

// - 0:4:21.44 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb.ar(in[0], in[1], 0.7, 0.8, 1), 800) }

// - 0:4:46.3 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb.ar(in[0], in[1], 1, 1, 1), 800) }

// - 0:4:50.43 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 1, 1, 1), 800) }

// - 0:5:1.72 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 0.7, 0.7, 1), 800) }

// - 0:5:14.84 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 0.75, 0.75, 1), 400) }

// - 0:5:23.43 -  
~dust[10] = \filter -> { |in| Splay.ar(RLPF.ar(in, 800, 0.1)) }

// - 0:5:28.49 -  
~dust[0] = { Dust.ar([2,3]) * \amp.kr(1) }

// - 0:5:43.81 -  
~dust[10] = \filter -> { |in| Splay.ar(RLPF.ar(in, 1800, 0.1)) }

// - 0:6:0.27 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 0.75, 0.75, 1), 1000) }

// - 0:6:8.44 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 0.8, 0.8, 1), 1000) }

// - 0:6:13.92 -  
q = ()

// - 0:6:43.51 -  
q.sss = Buffer.alloc(s, 2*s.sampleRate, 1)

// - 0:7:3.59 -  
Synth(\recorder, [\buf, q.sss])

// - 0:7:10.04 -  
~player.play

// - 0:7:16.14 -  
~player.fadeTime = 5

// - 0:7:25.05 -  
~dust[10] = \filter -> { |in| Splay.ar(RLPF.ar(in, 500, 0.1)) }

// - 0:7:28.99 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 0.8, 0.8, 1), 200) }

// - 0:7:38.38 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 0.9, 0.9, 1), 200) }

// - 0:7:43.67 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 0.9, 0.9, 0), 200) }

// - 0:8:35.35 -  
~player = { PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(1), loop:1).dup }

// - 0:8:44.44 -  
~player = { PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(1), loop:1).dup * \amp.kr(0.1)}

// - 0:9:8.35 -  
~player.set(\rate, 0.8)

// - 0:9:21.2 -  
~player.set(\amp, 0.2)

// - 0:10:29.03 -  
~player = { var trig = Impulse.kr(1); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(1), trig, loop:1).dup * \amp.kr(0.1) * EnvGen.kr(Env.sine(1), trig) }

// - 0:10:41.69 -  
~dust[0] = { Dust.ar([5,3]) * \amp.kr(1) }

// - 0:10:53.3 -  
~dust[10] = \filter -> { |in| Splay.ar(RLPF.ar(in, 250, 0.01)) }

// - 0:10:57.08 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 0.9, 0.9, 0), 100) }

// - 0:11:12.21 -  
~player = { var trig = Impulse.kr(0.5); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(1), trig, loop:1).dup * \amp.kr(0.1) * EnvGen.kr(Env.sine(1), trig) }

// - 0:11:22.53 -  
~player = { var trig = Impulse.kr(0.5); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(1), trig, loop:1).dup * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.01, 0.1), trig) }

// - 0:11:38.3 -  
~player = { var trig = Impulse.kr(0.5); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(0.1), trig, loop:1).dup * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.01, 0.1), trig) }

// - 0:11:53.24 -  
~player.set(\rate, 0.5)

// - 0:12:3.6 -  
Synth(\recorder, [\buf, q.sss])

// - 0:12:10.12 -  
~player = { var trig = Impulse.kr(0.5); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(0.1), trig, loop:1).dup * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.01, 0.2), trig) }

// - 0:12:14.6 -  
~player.set(\rate, 1)

// - 0:12:23.27 -  
~player = { var trig = Impulse.kr(0.5); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(0.1), trig, loop:1).dup * \amp.kr(0.1) * EnvGen.kr(Env.perc(0.01, 0.5), trig) }

// - 0:12:34.11 -  
~player = { var trig = Impulse.kr(0.5); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(0.1), trig, loop:1).dup * \amp.kr(0.5) * EnvGen.kr(Env.perc(0.01, 0.5), trig) }

// - 0:12:41.11 -  
~player = { var trig = Impulse.kr(0.5); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(0.1), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.01, 0.5), trig) }

// - 0:12:45.28 -  
~player.set(\amp, 0.5)

// - 0:12:54.58 -  
~player.set(\rate, 1)

// - 0:12:59.68 -  
~player.set(\amp, 1)

// - 0:13:15.92 -  
Synth(\recorder, [\buf, q.sss])

// - 0:13:25.86 -  
Synth(\recorder, [\buf, q.sss])

// - 0:13:32.89 -  
Synth(\recorder, [\buf, q.sss])

// - 0:13:39.08 -  
Synth(\recorder, [\buf, q.sss])

// - 0:13:44.16 -  
Synth(\recorder, [\buf, q.sss])

// - 0:13:52.3 -  
Synth(\recorder, [\buf, q.sss])

// - 0:13:59.34 -  
Synth(\recorder, [\buf, q.sss])

// - 0:14:30.91 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/4,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(0.1), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.01, 0.5), trig) }

// - 0:14:52.86 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/6,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(0.1), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.01, 0.5), trig) }

// - 0:15:12.61 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/6,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * \rate.kr(0.1), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.1, 0.3), trig) }

// - 0:15:50.77 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/6,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * Demand.kr(trig, 0, Dseq([1,2,1,1,2,1,1,2,1,1,1,2,1,1,2,1,1,1,2,1,1,2,1,1,2,1,2,1,3,3,1,3,1],inf)), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.1, 0.3), trig) }

// - 0:16:13.14 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/6,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * Demand.kr(trig, 0, Dseq([1,2,1,1,2,1,1,2,1,1,1,2,1,1,2,1,1,1,2,1,1,2,1,1,2,1,2,1,3,3,1,3,1]/2,inf)), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.1, 0.3), trig) }

// - 0:16:36.9 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/6,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * Demand.kr(trig, 0, Dseq([1,2,1,1,2,1,1,4,1,1,1,2,1,1,2,1,4,1,2,1,1,2,1,1,2,1,2,1,3,3,1,3,1,1,1,4,1,1,3,1,1,2,1,3,3,3,1,4,1,1,2,1,4,1,3,1]/2,inf)), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.1, 0.3), trig) }

// - 0:16:53.19 -  
Synth(\recorder, [\buf, q.sss])

// - 0:16:58.28 -  
Synth(\recorder, [\buf, q.sss])

// - 0:18:13.25 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/6,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * Demand.kr(trig, 0, Dxrand([1,1,1,2,3,4,5,1,1,1,1,2,2,2,5,4,3,2,2,1]/4,inf)), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.1, 0.3), trig) }

// - 0:18:30.16 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/6,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * Demand.kr(trig, 0, Dxrand([1,1,1,2,3,4,5,1,1,1,1,2,2,2,5,4,3,2,2,1]/3,inf)), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.1, 0.3), trig) }

// - 0:18:37.2 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/6,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * Demand.kr(trig, 0, Dxrand([1,1,1,2,3,4,5,1,1,1,1,2,2,2,5,4,3,2,2,1]/4,inf)), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.1, 0.3), trig) }

// - 0:18:54.74 -  
Synth(\recorder, [\buf, q.sss])

// - 0:19:2.14 -  
Synth(\recorder, [\buf, q.sss])

// - 0:19:8.8 -  
Synth(\recorder, [\buf, q.sss])

// - 0:19:27.7 -  
~player[10] = \filter -> { |in| CombC.ar( in, 5, 0.5, 3  ) }

// - 0:20:1.41 -  
~player[20] = \filter -> { |in| FreeVerb2.ar(in[0], in[1] ) }

// - 0:20:8.68 -  
Synth(\recorder, [\buf, q.sss])

// - 0:20:13.95 -  
Synth(\recorder, [\buf, q.sss])

// - 0:20:22.36 -  
Synth(\recorder, [\buf, q.sss])

// - 0:20:35.4 -  
Synth(\recorder, [\buf, q.sss])

// - 0:20:48.44 -  
~player = { var trig = TDuty.kr(Dseq([1,1,2,1,1,2,1,3,1,1,2,1,2,1,1,2,1,3,1,4,1,1,2,1,2,1,1,2]/8,inf)); PlayBuf.ar(1, q.sss, BufRateScale.kr(q.sss) * Demand.kr(trig, 0, Dxrand([1,1,1,2,3,4,5,1,1,1,1,2,2,2,5,4,3,2,2,1]/4,inf)), trig, loop:1).dup * \amp.kr(1) * EnvGen.kr(Env.perc(0.1, 0.3), trig) }

// - 0:20:54.86 -  
~player[10] = \filter -> { |in| CombC.ar( in, 5, 0.25, 4  ) }

// - 0:21:7.17 -  
~player[20] = \filter -> { |in| in + FreeVerb2.ar(in[0], in[1], 1, 1 ) }

// - 0:21:14.07 -  
Synth(\recorder, [\buf, q.sss])

// - 0:21:31.71 -  
~dust[0] = { Dust.ar([5,3]) * 5 }

// - 0:21:39.64 -  
~dust[0] = { Dust.ar([8,10]) * 5 }

// - 0:21:43.23 -  
~dust[10] = \filter -> { |in| Splay.ar(RLPF.ar(in, 250, 0.01)) }

// - 0:21:47.31 -  
~dust[50] = \filter -> { |in| in + LPF.ar(FreeVerb2.ar(in[0], in[1], 0.9, 0.9, 0), 100) }

// - 0:21:50.63 -  
~dust[0] = { Dust.ar([8,10]) * 1 }

// - 0:21:57.43 -  
~dust[0] = { Dust.ar([8,10]) }

// - 0:22:6.06 -  
p.end(30)

