// this code was made by a new student in my university, just after 3 sessions supercollider.
// I thought it was remarkable so I publish it here with his permission
// and some changes from my side

/**
	THE TEST - Modeled after the intro of the famous Chemical Brothers song...
	
	Uses redinfo-ugens... see here: http://www.fredrikolofsson.com/f0blog/?q=node/352
	
	Reads ambient light sensors for the snare-sound and various motion sensors for
	the loudness and the sustain of the bass
	
	by bennigraf
**/

// ORIGINAL

( // SynthDefs...

(
SynthDef(\snare, { |out, freq=440, sustain=0.1, amp=0.1|
//	var snd = BPF.ar(WhiteNoise.ar, 2500, MouseX.kr(0.1, 8));
	var snd = LPF.ar(
		HPF.ar(
			BrownNoise.ar+WhiteNoise.ar,
			RedInfoLmu.kr(Impulse.kr(10)).at(0)  * 2
		),
		RedInfoLmu.kr(Impulse.kr(10)).at(1) + 300 * 10
	);
	var env = Env([0, 1, 0.2, 0], [0.02, 0.15, sustain], [0, -3, 0]);
	snd = snd * EnvGen.ar( env ) * amp;
	snd.postln;
//	snd = snd * amp * EnvGen.ar(Env.perc(0.01, sustain), doneAction:2);
//	var snd = WhiteNoise.ar(XLine.kr(1.0, 0.001)) * amp;
	OffsetOut.ar(out, snd.dup);
}).memStore;
);

(
SynthDef(\bassdrum, { |out, freq = 60, sustain = 1, amp = 0.1|
	var snd = SinOsc.ar(freq, 0.3, XLine.kr(
		RedInfoSms.kr(0.1).at(1) + 1 * 0.8,
		0.001,
		RedInfoSms.kr(0.1).at(0) + 1.1 * 0.8
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
/*Synth(\bass, [\freq, 80, \sustain, 1, \amp, 0.8]);*/

) // End of SynthDefs


(

var bpm = 120; // Guess what this is...

r = (); // holds all the rhythmic stuff

// STEPSEQUENZER - 0 is off, 1 is on
// 'stepwidth' explains itself, I hope...

r.snare = ();
r.snare.steps = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0];
r.snare.stepwidth = (1/16);

r.bassdrum = ();
r.bassdrum.steps = [1, 1, 1, 1];
r.bassdrum.stepwidth = 1/4;

// It's a bit more complicated for the bass.
// A tone is generated when there is an array of the midi-tone, the multitude and the sustain
// 0 is still off... 

r.bass = ();
r.bass.stepwidth = 1/16;
r.bass.steps = [[32, 0.3, 1/4], 0, [32, 0.3, 1/4], 0, [32, 0.3, 1/4], 0, 0, 0, 0, 0, 0, [28, 0.3, 1/2], 0, 0, [28, 0.3, 1/4], 0];

// Alternative bassline
// r.bass.steps = [[ 30, 0.4, 1/1.4], 0, 0, 0, 0, [24, 0.4, 1/2], 0, [24, 0.4, 1/4]]; r.bass.stepwidth = 1/8;

// Generating 3 tasks here - maybe I also could combine these to one task?

t = (); // holds the tasks
t.snare = Task({
	var counter = 0;
	inf.do{ |index|
		if ( (counter >= r.snare.steps.size), { counter = 0; } );
		if ( (r.snare.steps.at(counter) == 1),
			{ Synth(\snare, [\sustain: 0.1, \amp, rrand(0.47, 0.53)]); }
		);
		((1/(bpm/60)*4) * r.snare.stepwidth).wait; // hilariously complicated calculation of the wait-time...
		counter = counter + 1;
	}
});
t.bassdrum = Task({
	var counter = 0;
	inf.do{ |i|
		if( (counter >= r.bassdrum.steps.size), { counter = 0 } );
		if( (r.bassdrum.steps.at(counter) == 1), {
			Synth(\bassdrum, [\amp, rrand(0.09, 0.13)]);
		});
		((1/(bpm/60)*4) * r.bassdrum.stepwidth).wait;
		counter = counter + 1;
	}
});
t.bass = Task({
	var counter = 0;
	inf.do{ |i|
		if( (counter >= r.bass.steps.size), { counter = 0 } );
		if( (r.bass.steps.at(counter).isArray), {
//			var freq = r.bass.steps.at(counter).at(0).midicps;
//			var mul = r.bass.steps.at(counter).at(1);
//			var sus = r.bass.steps.at(counter).at(2);
			Synth(\bass, [
				\freq, r.bass.steps.at(counter).at(0).midicps,
				\amp, r.bass.steps.at(counter).at(1) * rrand(0.95, 1.05), 
				\sustain, r.bass.steps.at(counter).at(2)
			]);
		});
		((1/(bpm/60)*4) * r.bass.stepwidth).wait;
		counter = counter + 1;
	}
});

// plays the tasks. That way you can also start and stop them (not synced, though). 
// Some kind of a mixer would probably be better here...
(
t.bassdrum.play;
t.snare.play;
t.bass.play;
)

)
