// this code was made by a new student in my university, just after 3 sessions supercollider.
// I thought it was remarkable so I publish it here with his permission
// and some changes from my side

/**
	THE TEST - Modeled after the intro of the famous Chemical Brothers song...
	
	Uses redinfo-ugens... see here: http://www.fredrikolofsson.com/f0blog/?q=node/352
	
	Reads ambient light sensors for the snare-sound and various motion sensors for
	the loudness and the sustain of the bass
	
	by bennigraf
	refactoring / optimizing by rukano
**/


( // SynthDefs...

(
SynthDef(\snare, { |out, freq=440, sustain=0.1, amp=0.1|
	var snd = LPF.ar(
		HPF.ar(
			BrownNoise.ar+WhiteNoise.ar,
			RedInfoLmu.kr(Impulse.kr(10)).at(0)  * 2
		),
		RedInfoLmu.kr(Impulse.kr(10)).at(1) + 300 * 10
	);
	var env = Env([0, 1, 0.2, 0], [0.02, 0.15, sustain], [0, -3, 0]);
	snd = snd * EnvGen.ar( env, doneAction:2 ) * amp;
	OffsetOut.ar(out, snd.dup);
}).memStore;
);

(
SynthDef(\kick, { |out, freq = 60, sustain = 1, amp = 0.1|
	var snd = SinOsc.ar(freq, 0.3, XLine.kr(
		RedInfoSms.kr(0.1).at(1) + 1 * 0.8,
		0.001,
		RedInfoSms.kr(0.1).at(0) + 1.1 * 0.8,
		doneAction:2		// free the synth
	));
	OffsetOut.ar(out, snd.dup);
}).memStore;
);


(
SynthDef(\bass) { |out, freq = 50, sustain = 1, amp = 0.1|
	var snd = Saw.ar(freq);
	snd = (snd * amp * EnvGen.ar(Env.perc(0.01, sustain), doneAction: 2));
	OffsetOut.ar(out, snd.dup);
}.memStore;
);

) // End of SynthDefs


(

r = ();

r.snare = ();
r.snare.steps = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0];
r.snare.stepwidth = (1/16);

r.kick = ();
r.kick.steps = [1, 1, 1, 1];
r.kick.stepwidth = 1/4;

r.bass = ();
r.bass.stepwidth = 1/16;
r.bass.steps = [[32, 0.3, 1/4], 0, [32, 0.3, 1/4], 0, [32, 0.3, 1/4], 0, 0, 0, 0, 0, 0, [28, 0.3, 1/2], 0, 0, [28, 0.3, 1/4], 0];

// It would be possible to make all in one task if there are no rhytmic differences
// I'll try this later

t = ();
c = TempoClock.new(120/60).permanent_(true);

// now you can change the Tempo like this:
/*

c.tempo = 1;	// absolute value
c.tempo = c.tempo * 1.1;	// relative value to the old tempo

// you could make a gui to change the tempo...

*/


// lets use Tdef for the tasks, so they are synchro, and you can change them on the go
Tdef(\snare, {
	inf.do{ |i|
		(r.snare.steps.wrapAt(i)).coin.if { Synth(\snare, [\sustain: 0.1, \amp, rrand(0.47, 0.53)]); };
		(4 * r.snare.stepwidth).wait;
	}
});

Tdef(\kick, {
	inf.do{ |i|
		r.kick.steps.wrapAt(i).coin.if {
			Synth(\kick, [\amp, rrand(0.09, 0.13)]);
		};
		(4 * r.kick.stepwidth).wait;
	}
});

Tdef(\bass, {
	inf.do{ |i|
		if( (r.bass.steps.wrapAt(i).isArray), {
			Synth(\bass, [
				\freq, r.bass.steps.wrapAt(i).at(0).midicps,
				\amp, r.bass.steps.wrapAt(i).at(1) * rrand(0.95, 1.05), 
				\sustain, r.bass.steps.wrapAt(i).at(2)
			]);
		});
		(4 * r.bass.stepwidth).wait;
	}
});

// play the Tdefs and make a GUI

(
	Tdef(\snare).play(c);
	Tdef(\kick).play(c);
	Tdef(\bass).play(c);
	
	// Gui for all Tdefs (one of the good things of Tdef)
	TdefAllGui.new;
	c.gui;
);
)
