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
SynthDef(\bassdrum, { |out, freq = 60, sustain = 1, amp = 0.1|
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

var bpm = 120;

r = ();

r.snare = ();
r.snare.steps = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0];
r.snare.stepwidth = (1/16);

r.bassdrum = ();
r.bassdrum.steps = [1, 1, 1, 1];
r.bassdrum.stepwidth = 1/4;

r.bass = ();
r.bass.stepwidth = 1/16;
r.bass.steps = [[32, 0.3, 1/4], 0, [32, 0.3, 1/4], 0, [32, 0.3, 1/4], 0, 0, 0, 0, 0, 0, [28, 0.3, 1/2], 0, 0, [28, 0.3, 1/4], 0];

// It would be possible to make all in one task if there are no rhytmic differences
// I'll try this later

t = (); // holds the tasks
t.snare = Task({
	inf.do{ |counter|
		// the 1th argument is already a counter we just hat to loop it / reset it to 0 with modulo
		// or wrapping the array
		if ( (r.snare.steps.at(counter % r.snare.steps.size) == 1),
			{ Synth(\snare, [\sustain: 0.1, \amp, rrand(0.47, 0.53)]); }
		);
		
		// alternative:
//		if ( r.snare.steps @@ counter == 1)	// @@ is the same as .wrapAt()
										// it looks at the beginning of the array
										// if the index's out of bounds
										
//			{ Synth(\snare, [\sustain: 0.1, \amp, rrand(0.47, 0.53)]); };
		
		// we'll use a TempoClock later, so we handle the timing from outside! :D
		((1/(bpm/60)*4) * r.snare.stepwidth).wait; // hilariously complicated calculation of the wait-time...
	}
});
t.bassdrum = Task({
	inf.do{ |counter|
		if( (r.bassdrum.steps.wrapAt(counter) == 1), {
			Synth(\bassdrum, [\amp, rrand(0.09, 0.13)]);
		});
		((1/(bpm/60)*4) * r.bassdrum.stepwidth).wait;
	}
});
t.bass = Task({
	inf.do{ |counter|
		if( (r.bass.steps.wrapAt(counter).isArray), {
			Synth(\bass, [
				\freq, r.bass.steps.wrapAt(counter).at(0).midicps,
				\amp, r.bass.steps.wrapAt(counter).at(1) * rrand(0.95, 1.05), 
				\sustain, r.bass.steps.wrapAt(counter).at(2)
			]);
		});
		((1/(bpm/60)*4) * r.bass.stepwidth).wait;
	}
});

// we'll use later Tdef, we can quntize those, and play and stop them, and also a GUI to controll them all :D
// i'll do this on this weekend... don't have too much time now...

(
t.bassdrum.play;
t.snare.play;
t.bass.play;
)

)
