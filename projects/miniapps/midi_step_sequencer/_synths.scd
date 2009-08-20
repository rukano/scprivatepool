~synthList = [\ping, \sine];

// ping
SynthDef(~synthList[0], { |out, freq=440, pan, amp=0.1, sustain=0.25|
	var snd = SinOsc.ar(freq);
	snd = snd * EnvGen.ar(Env.perc(0.01, sustain), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd*amp);
}).store;

// sine
SynthDef(~synthList[1], { |out, freq=440, pan, amp=0.1, sustain=0.25|
	var snd = SinOsc.ar(freq);
	snd = snd * EnvGen.ar(Env.sine(sustain), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd*amp);
}).store;

"synths loaded".postln;
