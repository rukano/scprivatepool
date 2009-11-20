// MIDIClient.init
// m = MIDIOut(0)
(
var array = (29..80);
var weight = Array.series(array.size, 200, -5).normalizeSum;
Pdef(\drums,
	Pbind(
		\type, \midi,
		\midiout, m,
		\midinote, Pwrand(array+10, weight, inf),
		\amp, Pwhite(0.1,1.0,inf),
		\dur, Pwrand([1/4, 1/2, 1], [10,5,1].normalizeSum, inf)
	)
).play
)
TempoClock.default.tempo = 20/60
