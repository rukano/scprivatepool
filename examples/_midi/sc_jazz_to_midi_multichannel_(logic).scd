// MIDIClient.init
m = MIDIOut(0)

c = TempoClock.new(1).permanent_(true)
(
var scale = Scale.choose;

Pdef(\banjo,
	Pbind(
		\type, \midi,
		\midiout, m,
		\chan, 0,
		\legato, Pwhite(0.1,3,inf),
		\scale, scale,
		\degree, Prand([0,1,2,4,6,8], inf),
		\octave, Prand((4..5),inf),
		\amp, Pwhite(0.6,1.0,inf),
		\dur, Prand([1,2,4,2,1,4,1,2,3,2]/4,inf)
	)
).play(c);

Pdef(\piano,
	Pbind(
		\type, \midi,
		\midiout, m,
		\chan, 1,
		\legato, Pwhite(0.1,1.5,inf),
		\scale, scale,
		\degree, Prand([0,1,2,4,6], inf),
		\octave, Prand((5..7),inf),
		\amp, Pwhite(0.6,1.0,inf),
		\dur, Prand([1,2,4,2,1,4,1,2,3,2]/4,inf)
	)
).play(c);

Pdef(\bass,
	Pbind(
		\type, \midi,
		\midiout, m,
		\chan, 2,
		\legato, Pwhite(0.1,1,inf),
		\scale, scale,
		\degree, Prand([0,4,6], inf),
		\octave, Prand((3..4),inf),
		\amp, Pwhite(0.6,1.0,inf),
		\dur, Prand([1,2,4,2,1,4,1,2,3,2]/2,inf)
	)
).play(c);

Pdef(\chords,
	Pbind(
		\type, \midi,
		\midiout, m,
		\chan, 4,
		\legato, Pwhite(0.5,1,inf),
		\scale, scale,
		\degree, Pfunc{ Array.rand(4, 0, 8) },
		\octave, Prand((4..6),inf),
		\amp, Pwhite(0.6,1.0,inf),
		\dur, Prand([1,2,4,2,1,4,1,2,3,2],inf)
	)
).play(c);

Pdef(\ride,
	Pbind(
		\type, \midi,
		\midiout, m,
		\chan, 3,
		\midinote, Pwrand((51..53), [0.1, 0.1, 0.8],inf),
		\amp, Pwhite(0.6,1.0,inf),
		\dur, Prand([1,2,4,2,1,4,1,2,2]/4,inf)
	)
).play(c);

Pdef(\kick,
	Pbind(
		\type, \midi,
		\midiout, m,
		\chan, 3,
		\midinote, Prand((35..35), inf),
		\amp, Pwhite(0.6,1.0,inf),
		\dur, Prand([1,2,4,2,1,4,1,2,2]/2,inf)
	)
).play(c);

Pdef(\snare,
	Pbind(
		\type, \midi,
		\midiout, m,
		\chan, 3,
		\midinote, Pwrand((38..40), [0.3,0.2,0.5], inf),
		\amp, Pwhite(0.6,1.0,inf),
		\dur, Prand([1,2,4,2,1,4,1,2,2]/2,inf)
	)
).play(c);



)



c.tempo = 2


Event

s.latency=nil