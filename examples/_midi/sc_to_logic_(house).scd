/*
m = MIDIOut(0)
s.latency=nil
*/

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
).play(quant:4);

Pdef(\chords,
	Pbind(
		\type, \midi,
		\midiout, m,
		\midinote, Pstutter(2*4, Pseq([60,62],inf)),
		\chan, 3,
		\sustain, 0.1,
		\amp, Pwhite(0.4,0.6,inf), 
		\dur, Pseq([1.5,2.5], inf)	
	)
).play(quant:4);

Pdef(\kick,
	Pbind(
		\type, \midi,
		\midiout, m,
		\midinote, Pseq([60]-24,inf),
		\chan, 1,
		\legato, 0.7,
		\amp, 0.5, 
		\dur, Pseq([4,4,4,4,4,4,4,2,2]/4, inf)	
	)
).play(quant:4);


Pdef(\bass,
	Pbind(
		\type, \midi,
		\midiout, m,
		\midinote, Pstutter(2*4,Pseq([60,62],inf)) - 24,
		\chan, [2,4],
		\legato, Pseq([0.5,0.05],inf),
		\amp, 0.5, 
		\dur, 2	
	)
).play(quant:4);

Pdef(\bells,
	Pbind(
		\type, \midi,
		\midiout, m,
		\scale, Scale.dorian,
		\degree, Pstutter(4, Pseq([Pseq((3..0),2), Pseq((7..3),2)], inf)),
		\chan, 5,
		\legato, 0.5,
		\amp, 0.5, 
		\dur, 0.5	
	)
).play(quant:4)
)

/*
TempoClock.default.tempo = 122/60
*/