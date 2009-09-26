///////////////////////////////////////////////////
// History, as it was on Sat Sep 26 13:39:28 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:8.94 -  
~snd.play

// - 0:0:14.21 -  
~snd.fadeTime = 5

// - 0:2:13.19 -  
~snd = { DelayC.ar(GrayNoise.ar(10), 5, [0, SinOsc.kr(0.5).range(0,0.1)]) * \amp.kr(0.1) }

// - 0:2:29.7 -  
~snd = { DelayC.ar(GrayNoise.ar(15), 5, [0, SinOsc.kr(0.5).range(0,0.1)]) * \amp.kr(0.1) }

// - 0:2:34.07 -  
~snd = { DelayC.ar(GrayNoise.ar(8), 5, [0, SinOsc.kr(0.5).range(0,0.1)]) * \amp.kr(0.1) }

// - 0:2:40.21 -  
~snd = { DelayC.ar(GrayNoise.ar(8), 5, [0, SinOsc.kr(1).range(0,0.1)]) * \amp.kr(0.1) }

// - 0:2:52.86 -  
~snd = { DelayL.ar(GrayNoise.ar(8), 5, [0, SinOsc.kr(1).range(0,0.1)]) * \amp.kr(0.1) }

// - 0:3:16.07 -  
~snd = { DelayL.ar(RLPF.ar(GrayNoise.ar(8), 1000, 0.5), 5, [0, SinOsc.kr(1).range(0,0.1)]) * \amp.kr(0.1) }

// - 0:3:33.55 -  
~snd = { DelayL.ar(RLPF.ar(GrayNoise.ar(8), 1000, 0.5), 5, [0, LFNoise2.kr(1).range(0,1)]) * \amp.kr(0.1) }

// - 0:3:45.52 -  
~snd = { DelayL.ar(RLPF.ar(GrayNoise.ar(8), 500, 0.5), 5, [0, LFNoise2.kr(1).range(0,1)]) * \amp.kr(0.1) }

// - 0:4:23.53 -  
~snd = { DelayL.ar(RLPF.ar(GrayNoise.ar(8), 500, 0.5), 5, [0, LFNoise2.kr(1).range(0,1)]) * \amp.kr(0.1) * LFNoise2.kr(1).range(0,1) }

// - 0:5:27.73 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, 0.05, 1) }

// - 0:5:40.94 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, 0.05, 1) + in }

// - 0:5:57.08 -  
~snd = { DelayL.ar(RLPF.ar(GrayNoise.ar(8), 500, 0.5), 5, [0, LFNoise2.kr(1).range(0,1)]) * 0.05 * LFNoise2.kr(1).range(0,1) }

// - 0:6:14.87 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, 0.05, 1).softclip + in.distort }

// - 0:6:42.3 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, MouseX.kr(0.01, 1), 1).softclip + in.distort }

// - 0:7:22.14 -  
~snd.play

// - 0:7:23.01 -  
~snd.fadeTime = 5

// - 0:7:23.36 -  
~snd = { DelayL.ar(RLPF.ar(GrayNoise.ar(8), 500, 0.5), 5, [0, LFNoise2.kr(1).range(0,1)]) * 0.05 * LFNoise2.kr(1).range(0,1) }

// - 0:7:24.89 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, MouseX.kr(0.01, 1), 1).softclip + in.distort }

// - 0:7:30.63 -  
p.end

// - 0:7:40.95 -  
~snd = { DelayL.ar(RLPF.ar(GrayNoise.ar(8), 500, 0.5), 5, [0, LFNoise2.kr(1).range(0,1)]) * 0.05 * LFNoise2.kr(1).range(0,1) }

// - 0:7:43.11 -  
~snd.play

// - 0:7:51.5 -  
// omg crash

// - 0:8:7.03 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, 0.01, 1).softclip + in.distort }

// - 0:9:1.96 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2], inf), 0, Dseq((0.01,0.02..0.1), inf)), 1).softclip + in.distort }

// - 0:9:19.19 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2]/2, inf), 0, Dseq((0.01,0.02..0.1), inf)), 1).softclip + in.distort }

// - 0:9:39.81 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2]/4, inf), 0, Dseq((0.01,0.02..0.1), inf)), 1).softclip + in.distort }

// - 0:9:47.51 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2]/4, inf), 0, Dseq((0.005,0.01..0.5), inf)), 1).softclip + in.distort }

// - 0:10:4.09 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2]/4, inf), 0, Dseq((0.005,0.01..0.5), inf)), 1).softclip + in.distort }

// - 0:10:11.03 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2]/4, inf), 0, Dseq((0.01,0.1..0.5), inf)), 1).softclip + in.distort }

// - 0:10:21.11 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2]/4, inf), 0, Dseq((0.01,0.1..1), inf)), 1).softclip + in.distort }

// - 0:11:9.83 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3]/5, inf), 0, Dseq((0.01,0.1..1), inf)), 1).softclip + in.distort }

// - 0:11:33.89 -  
~snd[20] = \filter -> { |in| HPF.ar(in, 5000) + in }

// - 0:12:14.36 -  
~snd[20] = \filter -> { |in| in + (HPF.ar(in, 5000) * 5) }

// - 0:12:24.91 -  
~snd[20] = \filter -> { |in| in + (HPF.ar(in, 5000) * 2) }

// - 0:12:30.97 -  
~snd[20] = \filter -> { |in| in + (HPF.ar(in, 5000)) }

// - 0:13:14.55 -  
~snd[20] = \filter -> { |in| var modin = HPF.ar(in, 5000); in + (FreeVerb2.ar(modin[0], modin[1], 1, 1)) }

// - 0:13:26.27 -  
~snd[20] = \filter -> { |in| var modin = HPF.ar(in, 3000); in + (FreeVerb2.ar(modin[0], modin[1], 1, 1)) }

// - 0:13:38.15 -  
~snd[20] = \filter -> { |in| var modin = RHPF.ar(in, 3000, 0.1); in + (FreeVerb2.ar(modin[0], modin[1], 1, 1)) }

// - 0:13:52.25 -  
~snd[20] = \filter -> { |in| var modin = RHPF.ar(in, 5000, 0.1); in + (FreeVerb2.ar(modin[0], modin[1], 1, 1)) }

// - 0:14:4.35 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1]/6, inf), 0, Dseq((0.01,0.1..1), inf)), 1).softclip + in.distort }

// - 0:14:12.82 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1]/6, inf), 0, Dseq((0.01,0.1..0.5), inf)), 1).softclip + in.distort }

// - 0:14:57.43 -  
~snd[99] = \filter -> { |in| Limiter.ar(in, 1) }

// - 0:15:53.15 -  
~snd[99] = \filter -> { |in| Limiter.ar(Compander.ar(in, in, 0.1, 0.1, 1/3), 1) }

// - 0:15:58.28 -  
~snd[99] = \filter -> { |in| Limiter.ar(Compander.ar(in, in, 0.1, 0.1, 0.1), 1) }

// - 0:16:3.31 -  
~snd[99] = \filter -> { |in| Limiter.ar(Compander.ar(in, in, 0.1, 0.1, 2), 1) }

// - 0:16:12.64 -  
~snd[99] = \filter -> { |in| Limiter.ar(Compander.ar(in, in, 0.1, 0.1, 5), 1) }

// - 0:16:15.44 -  
~snd[99] = \filter -> { |in| Limiter.ar(Compander.ar(in, in, 0.1, 0.01, 5), 1) }

// - 0:16:19.72 -  
~snd[99] = \filter -> { |in| Limiter.ar(Compander.ar(in, in, 0.01, 0.01, 5), 1) }

// - 0:16:45.12 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1,2,2,1,1,1,2,3,8]/8, inf), 0, Dseq((0.01,0.1..0.5), inf)), 1).softclip + in.distort }

// - 0:16:53.87 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1,2,2,1,1,1,2,3,8]/8, inf), 0, Dseq((0.01,0.1..0.5)*2, inf)), 1).softclip + in.distort }

// - 0:17:14.21 -  
~snd[20] = \filter -> { |in| var modin = RLPF.ar(in, 200, 0.1); in + (FreeVerb2.ar(modin[0], modin[1], 1, 1)) }

// - 0:17:29.99 -  
~snd[20] = \filter -> { |in| var modin = RLPF.ar(in, 200, 0.01); in + (FreeVerb2.ar(modin[0], modin[1], 1, 1)) }

// - 0:17:37.33 -  
~snd[20] = \filter -> { |in| var modin = RLPF.ar(in, 200, 0.5); in + (FreeVerb2.ar(modin[0], modin[1], 1, 1)) }

// - 0:17:59.27 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1,2,2,1,1,1,2,3,8,1,1,2,1,1,2,1,1,4,1,1,1,2,2]/8, inf), 0, Dseq((0.01,0.1..0.5)*2, inf)), 1).softclip + in.distort }

// - 0:18:7.54 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1,2,2,1,1,1,2,3,8,1,1,2,1,1,2,1,1,4,1,1,1,2,2]/8, inf), 0, Dseq((0.01,0.1..0.5).mirror2*2, inf)), 1).softclip + in.distort }

// - 0:18:17.96 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1,2,2,1,1,1,2,3,8,1,1,2,1,1,2,1,1,4,1,1,1,2,2]/8, inf), 0, Dseq((0.01,0.1..0.5).mirror2*2, inf)), 1).softclip + in.distort.softclip.distort }

// - 0:18:27.16 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1,2,2,1,1,1,2,3,8,1,1,2,1,1,2,1,1,4,1,1,1,2,2]/8, inf), 0, Dseq((0.01,0.1..0.5).mirror2*2, inf)), 1).softclip.squared + in.distort.softclip.distort }

// - 0:18:37.63 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1,2,2,1,1,1,2,3,8,1,1,2,1,1,2,1,1,4,1,1,1,2,2]/8, inf), 0, Dseq((0.01,0.1..0.5).mirror2*2, inf)), 1).softclip.distort + in.distort.softclip.distort }

// - 0:18:45.2 -  
~snd[10] = \filter -> { |in| CombC.ar(in, 2, Duty.kr(Dseq([1,2,3,1,1,2,2,1,1,1,2,3,8,1,1,2,1,1,2,1,1,4,1,1,1,2,2]/16, inf), 0, Dseq((0.01,0.1..0.5).mirror2*2, inf)), 1).softclip.distort + in.distort.softclip.distort }

// - 0:18:53.39 -  
p.end(30)

