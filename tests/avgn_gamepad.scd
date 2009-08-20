// AVGN
// init gamepad from menu

// INIT
var voiceButtons, voiceNotes, voicePairs, voiceDict;

// SYNTHS
SynthDef(\test, { |out, freq=440, amp=0.5, gate=1|
	var harm = (1,1.98..4);
	var snd = Splay.ar(Pulse.ar(freq * harm, mul: harm.size.reciprocal));
	snd = RLPF.ar(snd, freq*4, 0.1);
	snd = snd * EnvGen.ar(Env.adsr(0.05, 0.25, 0.4, 0.1), gate, amp, doneAction:2);
	OffsetOut.ar(out, snd!2)
}).memStore;

// VOICE / MELODY
voiceButtons = #[b1,b2,b3,b4,b6,b8];
voiceNotes = ([0,2,4,5,7,-3] + 68).midicps;
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


