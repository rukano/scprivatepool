p = ProxySpace.push(s)

~trig = { Impulse.kr(~tempo) }
~send = { SendTrig.kr(~trig) }

~beep[0] = { Splay.ar(SinOsc.ar((120,222..500) * \ratio.kr(1)) * 0.1) * EnvGen.kr(Env.perc(0, 0.5), \t_trig.kr(1)) }

~beep.fadeTime = 1
~beep.play

~noise[0] = { WhiteNoise.ar(0.1).dup * \amp.kr(0.1) * EnvGen.kr(Env.perc(0,0.1), \t_trig.kr(1)) }
~noise.play

~noise[10] = \filter -> { |in| BPF.ar(in, ~ffreq, ~resonanz) * 4 }

~ffreq = 16000
~ffreq.fadeTime = 3

~resonanz = 0.01
~resonanz.fadeTime = 5

~noise[20] = \filter -> { |in| Splay.ar(DelayC.ar(in, 2, [0, 0.01, 0.025, 0.033] * 8)) }

~melody = { Saw.ar( ~demand  ).dup * 0.05 * EnvGen.kr(Env.perc, \t_trig.kr(1))}
~melody.play

~demand = { Demand.kr(\t_trig.kr(1), 0, Dseq([60,63,67,42] * 0.5, inf)) }

~melody[10] = \filter -> { |in| RLPF.ar(in, ~demand * 2, 0.1) }

~text = { Splay.ar(SinOsc.ar( Array.rand(20, 200,2000) )) * 0.1 * \amp.kr(1).lag}

~text.play

(
OSCresponder(nil, "/tr", { |t,r,m|
//	m.postln;
	~noise.set(\t_trig, 1, \amp, rrand(0.1, 1));
	0.5.coin.if { ~beep.set(\t_trig, 1); 0.5.coin.if{ ~beep.set(\ratio, rrand(-5, 5).midiratio) } };
	0.3.coin.if { ~demand.set(\t_trig, 1); ~melody.set(\t_trig, 1) };
	0.9.coin.if { ~text.set(\amp, [0,1].choose); }
	
}).add;
)


s.latency = nil

~tempo = 4
~tempo.fadeTime = 5

p.end(10)