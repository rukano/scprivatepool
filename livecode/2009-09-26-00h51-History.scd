///////////////////////////////////////////////////
// History, as it was on Sat Sep 26 00:51:04 2009.
///////////////////////////////////////////////////

// - 0:0:0 -  
p = ProxySpace.push(s)

// - 0:0:1.88 -  
~snd.play

// - 0:0:3.32 -  
~snd.fadeTime = 5

// - 0:0:4.52 -  
~snd = { RLPF.ar(WhiteNoise.ar, 220, 0.1)!2 * \amp.kr(0.1) }

// - 0:0:15.74 -  
~snd = { RLPF.ar(WhiteNoise.ar, 220, 0.08)!2 * \amp.kr(0.1) }

// - 0:0:40.4 -  
~snd = { RLPF.ar(WhiteNoise.ar, 220, 0.08)!2 * \amp.kr(0.1) * LFNoise2.kr(1).range(0.1, 1) }

// - 0:0:47.07 -  
~snd = { RLPF.ar(WhiteNoise.ar, 220, 0.08)!2 * \amp.kr(0.1) * LFNoise2.kr(1).range(0.5, 1) }

// - 0:0:55.76 -  
~snd = { RLPF.ar(WhiteNoise.ar, 220, 0.08)!2 * \amp.kr(0.1) * LFNoise2.kr(0.25).range(0.5, 1) }

// - 0:1:24.69 -  
~dust = { Dust.ar(\dens.kr(5))!2 }

// - 0:1:34.04 -  
~dust.fadeTime = 5

// - 0:1:41.32 -  
~dust.play

// - 0:1:50.43 -  
~dust = { Dust.ar(\dens.kr(5))!2 * \amp.kr(0.1) }

// - 0:2:33.62 -  
~dust[10] = \filter -> ( RHPF.ar(_, 2000, 0.1) )

// - 0:3:48.23 -  
~snd = { RLPF.ar(WhiteNoise.ar, Duty.kr(1, 0, Drand([100,200,300], inf)).lag, 0.08)!2 * \amp.kr(0.1) * LFNoise2.kr(0.25).range(0.5, 1) }

// - 0:3:56.33 -  
~snd = { RLPF.ar(WhiteNoise.ar, Duty.kr(1, 0, Drand([100,200,300], inf)).lag(2), 0.08)!2 * \amp.kr(0.1) * LFNoise2.kr(0.25).range(0.5, 1) }

// - 0:4:2.24 -  
~snd = { RLPF.ar(WhiteNoise.ar, Duty.kr(4, 0, Drand([100,200,300], inf)).lag(2), 0.08)!2 * \amp.kr(0.1) * LFNoise2.kr(0.25).range(0.5, 1) }

// - 0:4:14.48 -  
~snd = { RLPF.ar(WhiteNoise.ar, Duty.kr(4, 0, Drand((80,100..300), inf)).lag(2), 0.08)!2 * \amp.kr(0.1) * LFNoise2.kr(0.25).range(0.5, 1) }

// - 0:4:32.21 -  
~dust[20] = \filter -> { |in| CombC.ar(in, 5, 0.1, 2) }

// - 0:4:49.18 -  
~snd = { RLPF.ar(WhiteNoise.ar, Duty.kr(4, 0, Drand((200,250..600), inf)).lag(2), 0.08)!2 * \amp.kr(0.1) * LFNoise2.kr(0.25).range(0.5, 1) }

// - 0:5:2.23 -  
~snd = { RLPF.ar(WhiteNoise.ar, Duty.kr(4, 0, Drand((200,250..600)/2, inf)).lag(4), 0.08)!2 * \amp.kr(0.1) * LFNoise2.kr(0.25).range(0.5, 1) }

// - 0:5:14.89 -  
~dust[20] = \filter -> { |in| CombC.ar(in, 5, 0.01, 2) }

// - 0:5:20.88 -  
~dust[20] = \filter -> { |in| CombC.ar(in, 5, 0.1, 2) }

// - 0:5:32.19 -  
~dust[10] = \filter -> ( RHPF.ar(_, 5000, 0.1) )

// - 0:5:38.4 -  
~dust[10] = \filter -> ( RHPF.ar(_, 5000, 0.01) )

// - 0:6:29.73 -  
~dust[99] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.8, 0.6)}

// - 0:6:39.2 -  
~dust[99] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.5, 0.6)}

// - 0:6:46.11 -  
~dust[99] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.5, 0.75, 0)}

// - 0:6:51.39 -  
~dust[99] = \filter -> { |in| FreeVerb2.ar(in[0], in[1], 0.5, 0.75, 1)}

// - 0:7:40.55 -  
p.end(10)

