b = Buffer.read(s, "sounds/a11wlk01.wav")


(	// time shifting
Tdef(\pshift, {
	var triggerRate = 0.05;
	var jumpFrames = 200.reciprocal;
	inf.do{ |i|
		Synth(\grain, [\buf, b, \start, i * jumpFrames, \windowSize, 0.1, \rate, 1]);
		triggerRate.wait;
	}
}).play
)

(	// complex time shifting
Tdef(\pshift, {
	var triggerRate = 0.05;
	var jumpFrames = 200.reciprocal;
	inf.do{ |i|
		Synth(\grain, [\buf, b, \start, i * jumpFrames, \windowSize, 0.1, \rate, 1]);
		triggerRate.wait;
	}
}).play
)


(	// normal playback
	// trigger rate automatic
	// give overlap and grain size
Tdef(\pshift, {
	var overlap = 2;
	var grainSize = 0.1;
	var triggerRate = grainSize / overlap;
	var jumpFrames = b.numFrames * triggerRate;
	jumpFrames.postln;
	inf.do{ |i|
		Synth.grain(\grain, [\buf, b, \start, (i * jumpFrames), \windowSize, grainSize, \rate, 1]);
		triggerRate.wait;
	}
}).play
)

0.1/2
(0.05 * b.numFrames).reciprocal