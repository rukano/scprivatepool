SynthDef(\bd, {|out, freq=440, att=0.01, sustain=0.5, pan, amp=0.1|
	var snd;
	snd = SinOsc.ar(freq);
	snd = snd * EnvGen.ar(Env.perc(att, sustain), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd*amp);
}).store;
// Synth(\bd);
SynthDef(\hh, {|out, freq=4000, rq=0.5, att=0.01, sustain=0.1, pan, amp=0.1|
	var snd;
	snd = RHPF.ar(WhiteNoise.ar, freq, rq);
	snd = snd * EnvGen.ar(Env.perc(att, sustain), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd*amp);
}).store;
//Synth(\hh)
SynthDef(\bass, {|out, freq=440, rq=0.25, gate=1, pan, amp=0.1|
	var snd;
	snd = (SinOsc.ar(freq) * 0.1) + (Pulse.ar(freq, LFNoise2.kr(10).dup.range(0.25,0.5)));
	snd = RLPF.ar(snd, freq*2, rq);
	snd = snd * EnvGen.ar(Env.adsr(0.01, 0.01, 1, 0.1), gate, doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd*amp);
}).store;
//a = Synth(\bass)
//a.set(\gate, 0)