// init
a = ();
b = ();

// tunings in cents
a.m1 = [0,70,260,90,155,205,120,170,205,105,180,200,120,190,170,160,190];
a.m2 = [0,210,210,130,170,170,190,120,190,150,250,110,200,100];

// convert the cents to degreens in the 'b' dictionary
a.keysDo{ |key| b[key.asSymbol] = integrate(a[key.asSymbol]/100) };


(
// a very easy sound, that doesn't even sound like a marimba, but for the test is ok
SynthDef(\marimba, { arg out, freq=440, amp=0.1, att=0.002, dec=0.5, pan; 
	var sound = SinOsc.ar(freq);
	sound = sound * EnvGen.kr(Env.perc(att,dec), doneAction:2);
	OffsetOut.ar(out, Pan2.ar(sound, pan, amp));
}).memStore;
)

(
// set the global tuning
b.tuning = b.m1;

// let's make the left hand (bass notes / bourdon)
Pdef(\marimba_low_left,
	Pbind(
		\instrument, \marimba,
		// should be inf, but for the recording I'll take 80 notes
		\amp, Pwhite(0.5,0.1, 80),
		\pan, Pwhite(-0.75,-0.1,inf),
		\scale, b.tuning,	// here the tuning!
		\degree, Pseq([1,1,2,2,2,1,1,1,2,2,3],inf),
		\octave, 4,
		\dur, Pseq([2,2,1,1,2,1,1]/2, inf)
	)
);

// and the right hand (higher notes)
Pdef(\marimba_low_right,
	Pbind(
		\instrument, \marimba,
		// should be inf, but for the recording I'll take 80 notes
		\amp, Pwhite(0.5,0.1, 20),
		\pan, Pwhite(0.1,0.75,inf),
		\scale, b.tuning,
		\degree, Pseq([1,5,2,2,2,3,1,1,4,3].scramble,inf),
		\octave, 5,
		\dur, Pseq([2,2,1,1,2,1,1].reverse/3, inf)
	)
);

// parallel timing
Pdef(\main,
	Ptpar([
		0, Pdef(\marimba_low_left),
		16, Pdef(\marimba_low_right)
	])
).play;

)

// stop all
Pdef(\main).stop





















