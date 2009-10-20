(
// AVGN
// init gamepad from menu

// INIT
var voiceButtons, voiceNotes, voicePairs, voiceDict, group, effects;

// SYNTHS
//SynthDef(\test, { |out, freq=440, amp=0.5, gate=1|
//	var harm = (1,1.98..4);
//	var snd = Splay.ar(Pulse.ar(freq * harm, mul: harm.size.reciprocal));
//	snd = RLPF.ar(snd, freq*4, 0.1);
//	snd = snd * EnvGen.ar(Env.adsr(0.05, 0.25, 0.4, 0.1), gate, amp, doneAction:2);
//	OffsetOut.ar(out, snd!2)
//}).memStore;

SynthDef(\test, { |out, freq=440, amp=0.7, gate=1|
	var harm = (1,1.98..4);
	var snd = Nes2Square.ar(Impulse.kr(15), 0, 0, 1, 10, 1, 7, 0, 0, (1790000 / (freq.midicps * 16) - 1), 20);
	snd = snd * EnvGen.ar(Env.adsr(0.05, 0.25, 0.4, 0.1), gate, amp, doneAction:2);
	snd = Limiter.ar(Compander.ar(snd, snd, 0.1, 0.01, 4), 1);
	OffsetOut.ar(out, snd!2 * amp)
}).memStore;

SynthDef(\fx, { |in, out|
	var input = In.ar(in, 2);
	var snd = FreeVerb2.ar(input[0], input[1], 0.2, 0.5, 0);
	ReplaceOut.ar(out, snd);
}).memStore;

//group = Group.new;
//effects = Synth.tail(group, \fx);

// VOICE / MELODY
voiceButtons = #[b1,b2,b3,b4,b6,b8];
voiceNotes = ([0,2,4,5,7,-3] + 68 - 12);
voicePairs = [voiceButtons, voiceNotes].flop;
voiceDict = ();

voicePairs.do{ |pair|
	~gamepad[pair[0]].action_({ |v|
		v.value.coin.if {
			voiceDict[pair[0]] = Synth(\test, [\freq, pair[1]]);
		}{
			voiceDict[pair[0]].set(\gate, 0);
		}
	})
};

// s.freeAll
)

(
var sampleNames, samplePath, samples;
samplePath = "/Volumes/DATA/samples/futuremusic213/Dubstep_5/No_FX" ;
sampleNames = ["DS_ClosedHat01.wav", "DS_Kick02.wav","DS_Snare03.wav"];
samples = sampleNames.collect{ |name| samplePath +/+ name };
samples = samples.collect{ |path, i| Buffer.read(s, path, bufnum:i) };
~gamepad[\dpad].action_({ |v|
	var norm = v.value * 7;
	(norm == 3).if { samples[1].play };
	(norm == 7).if { samples[2].play };
});
~gamepad[\b7].action_({ |v| v.value.coin.if { samples[0].play } }) ;
~gamepad[\b5].action_({ |v| v.value.coin.if { samples[0].play } })  ;
)