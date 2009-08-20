(
SynthDef(\grain, { |buf, amp=1, pan=0, rate=1,start=0, windowSize=0.1|
	var snd = PlayBuf.ar(1, buf, BufRateScale.kr(buf) * rate, startPos:start*BufFrames.kr(buf));
	snd = EnvGen.ar(Env.sine(windowSize), doneAction:2) * Pan2.ar(snd, pan);
	OffsetOut.ar(0, snd * amp);
}).memStore;
);

b = Buffer.read(s, "sounds/a11wlk01.wav")

({
var triggerRate = Impulse.ar(0.05.reciprocal);			// trigger
var rate = Line.kr(1,2,10);							// pitch
var playhead = Line.kr(0,BufDur.kr(b),BufDur.kr(b), doneAction:2);
var windowSize = 0.25;								// grain duration

TGrains.ar(
	2,							// num out channels
	triggerRate,					// trigger rate
	b,							// bufnum
	rate,						// rate
	playhead,						// actual buffer position
	windowSize,					// grain duration
	0,							// pan = mitte
	1							// amp = 1
)

}.play)
