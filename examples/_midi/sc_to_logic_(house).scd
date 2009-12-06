m = MIDIOut(0)
s.latency=nil

(

Pdef(\beat1,
	Pbind(
		\type, \midi,
		\midiout, m,
		\midinote, Pseq([76,74,72,72],inf),
		\chan, 0,
		\amp, 0.8, 
		\dur, Pseq([2,1,3,2]/4, inf)	
	)
).play;

Pdef(\chords,
	Pbind(
		\type, \midi,
		\midiout, m,
		\midinote, Pstutter(20, Pseq([60,62]+12,inf)),
		\chan, 1,
		\legato, 0.7,
		\amp, Pwhite(0.5,0.8,inf), 
		\dur, Pseq([4,4,2,4,2]/4, inf)	
	)
).play;

Pdef(\kick,
	Pbind(
		\type, \midi,
		\midiout, m,
		\midinote, Pseq([60]-24,inf),
		\chan, 1,
		\legato, 0.7,
		\amp, 0.5, 
		\dur, Pseq([Pn(4,7), Pn(2,2)]/4, inf)	
	)
).play;

/*Pdef(\ambient,
	Pbind(
		\type, \midi,
		\midiout, m,
		\scale, Scale.minor,
		\octave, 3,
		\ctranspose, 0,
//		\root, Pstutter(32, Pseq([1,2],inf)),
		\degree, Prand([0,2,4,5],inf),
//		\degree, Pseq((0..11),inf),
		\chan, 2,
		\legato, 0.9,
		\amp, 0.5, 
//		\dur, 0.25
		\dur, Pseq([1,1,1,5+8]/2, inf)	

	)
).play
*/
/*
Pdef(\kick,
	Pbind(
		\type, \midi,
		\midiout, m,
		\midinote, Pwrand([64,65,66],[1,5,3].normalizeSum,inf), 
		\chan, 0,
		\amp, 0.8, 
		\dur, Pseq([4,1,1,1,3,3,3,1,1,1,1].normalizeSum*4, inf)	
	)
).play;

Pdef(\melos,
	Pbind(
		\type, \midi,
		\midiout, m,
		\scale, Scale.dorian,
		\octave, 3,
		\degree, Prand([0,2,3,5], inf), 
		\chan, 1,
		\amp, 0.8, 
		\dur, Pseq([4,1,1,1,3,3,3,1,1,1,1].normalizeSum*4, inf)	
	)
).play;
*/
)

/*
TempoClock.default.tempo = 122/60
*/