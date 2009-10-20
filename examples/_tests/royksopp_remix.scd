// load the voice
b = Buffer.read(s,"/Users/rukano/Downloads/royksopp/Vocals.wav" )

// make the calculations
q = ();
q.bpm = 143;		// bpm of the original song
q.bps = 60/q.bpm;	// bps for triggering
q.ticks = (b.duration / q.bps).round;	// how many ticks do we have in total?
q.takts = (q.ticks / 4).round; // and how many takts in total?
q.takt = q.bps*4;	// long in seconds of a takt

// where and how long is the voide
q.voice = [8,24,40,56,96,112]; // in takte
q.voicetakt = q.voice.collect(_*q.takt); // convert to secs
q.voicedur = 8; // duration in takte

(
// need q.takt initialized to work properly
SynthDef(\voiceplay, { |out, buf, amp, rate=1, offset, takt, sustain=1|
	var taktdur = q.takt;
	var son = PlayBuf.ar(2, buf, rate*BufRateScale.kr(buf), 1, takt*BufSampleRate.kr(buf), 1);
	son = son * EnvGen.kr(Env.linen(0,(sustain*taktdur+offset)/rate,0), doneAction:2);
	OffsetOut.ar(out, son*amp);
}).memStore;

SynthDef(\kick, {|out=0, amp=0.1, pan=0|
	var env0, env1, env1m, son;
	env0 =  EnvGen.ar(Env.new([0.5, 1, 0.5, 0], [0.005, 0.06, 0.26], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([110, 59, 29], [0.005, 0.29], [-4, -5]));
	env1m = env1.midicps;
	son = LFPulse.ar(env1m, 0, 0.5, 1, -0.5);
	son = son + WhiteNoise.ar(1);
	son = LPF.ar(son, env1m*1.5, env0);
	son = son + SinOsc.ar(env1m, 0.5, env0);
	son = son * 1.2;
	son = son.clip2(1);
	OffsetOut.ar(out, Pan2.ar(son * amp));
}).memStore;

SynthDef(\acidbass, {|out=0, gate=1, freq=440, amp=0.1, pan=0|
	var env1, env2, son, pitch;
	pitch = freq.cpsmidi;
	pitch = Lag.kr(pitch, 0.12 * (1-Trig.kr(gate, 0.001)) * gate);
	env1 = EnvGen.ar(Env.new([0, 1.0, 0, 0], [0.001, 2.0, 0.04], [0, -4, -4], 2), gate, amp);
	env2 = EnvGen.ar(Env.adsr(0.001, 0.8, 0, 0.8, 70, -4), gate, doneAction:2);
	son = LFPulse.ar(pitch.midicps, 0.0, 0.51, 2, -1);
	son = RLPF.ar(son, (pitch + env2).midicps, 0.3);
	son = son * env1;
	OffsetOut.ar(out, Pan2.ar(son, pan));
}).memStore;
)


TempoClock.default.tempo_(q.bpm/60)

(
Pdef(\voiceplayer,
	Pbind(
		\instrument, \voiceplay,
		\amp, 0.1,
		\buf, b,
		\rate, 1,
		\takt, Pseq(q.voicetakt,q.voicetakt.size),
		\sustain, q.voicedur,
		\dur, q.voicedur * 4
	)
).play;

Pdef(\kick,
	Pbind(
		\instrument, \kick,
		\amp, 0.25,
		\dur, 1
	)
).play;

Pdef(\bass,
	PmonoArtic(\acidbass,
		\degree, Pseq([Pn(-1,16),Pn(-1,16),Pn(-2,16),Pn(-1,16)], inf),
		\legato, Pwhite(0.9, 1.1, inf),
		\octave, Pseq([2,3], inf),
		\dur, 0.5
	)
).play;

)

















