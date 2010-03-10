// MIDIClient.init
m = MIDIOut(0)

c = TempoClock.new(1).permanent_(true)


(
var scale = Scale.dorian;

Pdef(\piano,
	Pbind(
		\type, \midi,
		\midiout, m,
		\chan, 0,
		\legato, Prand([0.25,1,2], inf),
		\scale, scale,
		\strum, Prand([0], inf),
		\degree, Ptuple([
			Pshuf([0,1,4,8], inf),
			Pshuf([0,1,2,4,6,8], inf),
			Pshuf([0,3,7,8], inf),
		], inf),
		\octave, Ptuple([
			Prand((2..4), inf),
			Prand((4..6), inf),
			Prand((6..7), inf),
		], inf),
		\amp, Ptuple([
			Pwrand([1, 0.5], [0.7,0.3], inf),
			Pwrand([1, 0.5], [0.5,0.5], inf),
			Pwrand([1, 0.5], [0.2,0.8], inf)
		], inf),
		\dur, Pshuf([1,2,2,1,1,2]/8, inf)	)
).play(c);

)

c.tempo = 1


Event

s.latency=nil