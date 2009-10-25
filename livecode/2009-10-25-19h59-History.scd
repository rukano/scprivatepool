///////////////////////////////////////////////////
// History, as it was on Sun Oct 25 19:59:57 2009.
///////////////////////////////////////////////////

// Nothing special, but maybe in the future nice for live instrument interaction
// you have to make rhytmic noises to get sound and trigger the others

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:4.31 -  
~out.play

// - 0:0:55.11 -  
44.1e4

// - 0:1:4.65 -  
b = Buffer.alloc(s, 44.1e3)

// - 0:2:2.47 -  
~rec = { RecordBuf.ar(SoundIn.ar(0), b, loop:1) }

// - 0:2:32.6 -  
~snd = { Pan2.ar(PlayBuf.ar(1,b)) }

// - 0:2:38.59 -  
~out = ~snd

// - 0:3:15.55 -  
~snd = { Pan2.ar(PlayBuf.ar(1,b,BufRateScale.kr(b)*1)) }

// - 0:3:26.22 -  
~snd = { Pan2.ar(PlayBuf.ar(1,b,BufRateScale.kr(b)*1)) }

// - 0:3:34.87 -  
~snd = { Pan2.ar(PlayBuf.ar(1,b,BufRateScale.kr(b)*1,loop:1)) }

// - 0:3:40.66 -  
~snd = { Pan2.ar(PlayBuf.ar(1,b,BufRateScale.kr(b)*1,loop:1)) }

// - 0:5:11.94 -  
~snd = { TGrains.ar(2,Impulse.kr(10),b,1,0.5,0.5) }

// - 0:5:36.45 -  
~in = { SoundIn.ar(0) }

// - 0:5:43.39 -  
~in

// - 0:5:52.52 -  
~rec = { RecordBuf.ar(~in.ar, b, loop:1) }

// - 0:8:9.84 -  
~amptrig = { Trig1.kr(Amplitude.kr(~ in.ar,0.01,0.1) > 0.1, 0.1) }

// - 0:8:44.3 -  
~test = { SinOsc.ar(200) * 0.1 * EnvGen.kr(Env.perc, ~amptrig)}

// - 0:8:50.12 -  
~ test.play

// - 0:9:16.33 -  
~amptrig = { Trig1.kr(Amplitude.kr(~ in.ar,0.01,0.1) > 0.25, 0.1) }

// - 0:9:56.42 -  
~rec = { RecordBuf.ar(~in.ar, b, loop:1, trigger:~amptrig) }

// - 0:10:53.59 -  
~snd = { TGrains.ar(2,Impulse.kr(10),b,2,0,0.5) }

// - 0:11:6.57 -  
~ test.clear

// - 0:11:21.91 -  
~rec = { RecordBuf.ar(~in.ar, b, trigger:~amptrig) }

// - 0:11:32.82 -  
~rec = { RecordBuf.ar(~in.ar, b, loop:0, trigger:~amptrig) }

// - 0:11:47.03 -  
~snd = { TGrains.ar(2,Impulse.kr(100),b,2,0,0.1) }

// - 0:12:0.07 -  
~snd = { TGrains.ar(2,Impulse.kr(22),b,2,0,0.1) }

// - 0:12:4.67 -  
~snd = { TGrains.ar(2,Impulse.kr(22),b,2,0,0.25) }

// - 0:12:11.11 -  
~snd = { TGrains.ar(2,Impulse.kr(22),b,1,0,0.25) }

// - 0:12:19.5 -  
p.fadeTime = 2

// - 0:12:32.39 -  
~amptrig = { Trig1.kr(Amplitude.kr(~ in.ar,0.01,0.1) > 0.1, 0.1) }

// - 0:12:52.36 -  
~snd = { TGrains.ar(2,Impulse.kr(22),b,1,0,0.5) }

// - 0:13:13.79 -  
~snd = { TGrains.ar(2,Impulse.kr(22),b,1,0.1,0.5) }

// - 0:13:32.51 -  
~amptrig = { Trig1.kr(Amplitude.kr(~ in.ar,0.01,0.1) > 0.5, 0.1) }

// - 0:13:50.63 -  
~snd = { TGrains.ar(2,Impulse.kr(22),b,1,0.05,0.5) }

// - 0:14:34.58 -  
~snd = { var trig=Impulse.kr(22); TGrains.ar(2,trig,b,1,0.05,0.5) }

// - 0:14:44.43 -  
~snd = { var trig=Impulse.kr(22); TGrains.ar(2,trig,b,1,0.05,1) }

// - 0:15:0.45 -  
~snd = { var trig=Impulse.kr(22); TGrains.ar(2,trig,b,0.1,0.05,1) }

// - 0:15:8.04 -  
~snd = { var trig=Impulse.kr(22); TGrains.ar(2,trig,b,0.5,0.05,1) }

// - 0:15:18.75 -  
~snd = { var trig=Impulse.kr(22); TGrains.ar(2,trig,b,0.5,0.5,1) }

// - 0:15:27.37 -  
~snd = { var trig=Impulse.kr(22); TGrains.ar(2,trig,b,0.5,0.05,1) }

// - 0:15:34.81 -  
~snd = { var trig=Impulse.kr(22); TGrains.ar(2,trig,b,1,0.05,1) }

// - 0:15:53.91 -  
~test = { SinOsc.ar(120)!2 * 0.1 * EnvGen.kr(Env.perc, ~amptrig)}

// - 0:15:58.76 -  
~test.play

// - 0:16:9.09 -  
~test = { SinOsc.ar(120)!2 *  EnvGen.kr(Env.perc, ~amptrig)}

// - 0:16:12.37 -  
~test.play

// - 0:16:24.88 -  
~test = { SinOsc.ar(120)!2 * 0.2 *  EnvGen.kr(Env.perc, ~amptrig)}

// - 0:16:31.03 -  
~test = { SinOsc.ar(120)!2 * 0.5 *  EnvGen.kr(Env.perc, ~amptrig)}

// - 0:16:51.27 -  
~test = { SinOsc.ar(TRand.kr(80,220,~amptrig))!2 * 0.5 *  EnvGen.kr(Env.perc, ~amptrig)}

// - 0:17:13.81 -  
~amptrig = { Trig1.kr(Amplitude.kr(~ in.ar,0.001,0.1) > 0.5, 0.1) }

// - 0:17:31.5 -  
~amptrig = { Trig1.kr(Amplitude.kr(~ in.ar,0.001,0.1) > 0.1, 0.1) }

// - 0:19:0.07 -  
~test = { SinOsc.ar(Demand.kr(~amptrig,0,Dseq([80,160],inf)))!2 * 0.5 *  EnvGen.kr(Env.perc, ~amptrig)}

// - 0:19:34.43 -  
~test = { SinOsc.ar(Demand.kr(~amptrig,0,Dseq([80,160,235],inf)))!2 * 0.5 *  EnvGen.kr(Env.perc, ~amptrig)}

// - 0:20:0.19 -  
~snd = { var trig=Impulse.kr(2); TGrains.ar(2,trig,b,1,0.05,1) }

// - 0:20:29.66 -  
~snd = { var trig=Impulse.kr(3); TGrains.ar(2,trig,b,1,0.05,1) }

// - 0:20:58.73 -  
~test = { SinOsc.ar(Demand.kr(~amptrig,0,Dseq((80,100..200),inf)))!2 * 0.5 *  EnvGen.kr(Env.perc, ~amptrig)}

// - 0:21:22.95 -  
~snd = { var trig=Impulse.kr(111); TGrains.ar(2,trig,b,1,0.05,1) }

// - 0:21:40.75 -  
~snd = { var trig=Impulse.kr(111); TGrains.ar(2,trig,b,1,0.05,0.5) }

// - 0:21:49.3 -  
~snd = { var trig=Impulse.kr(111); TGrains.ar(2,trig,b,1,0.05,0.1) }

// - 0:21:58.62 -  
~snd = { var trig=Impulse.kr(111); TGrains.ar(2,trig,b,1,0.05,0.01) }

// - 0:22:8.68 -  
~snd = { var trig=Impulse.kr(80); TGrains.ar(2,trig,b,1,0.05,0.01) }

// - 0:22:19.16 -  
~snd = { var trig=Impulse.kr(9); TGrains.ar(2,trig,b,1,0.05,0.01) }

// - 0:22:24.98 -  
~snd = { var trig=Impulse.kr(9); TGrains.ar(2,trig,b,1,0.05,0.1) }

// - 0:22:39.46 -  
~snd = { var trig=Impulse.kr(19); TGrains.ar(2,trig,b,1,0.05,0.1) }

// - 0:23:6.35 -  
~snd = { var trig=Impulse.kr(19); TGrains.ar(2,trig,b,1,0.05,0.25) }

// - 0:23:34.07 -  
~snd = { var trig=Impulse.kr(19); TGrains.ar(2,trig,b,TChoose.kr(~amptrig,[0.5,1,2]),0.05,0.25) }

// - 0:23:54.78 -  
p.end(10)

