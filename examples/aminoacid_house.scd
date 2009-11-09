// needs aminoacid patterns by jrh
// and optional a processing patch with osc recieve
// but it works also w/o it

// Synths from: SynthDefPool

SynthDef(\kick, {	|out, amp=0.1, pan=0|
	var env0, env1, env1m, son;
	
	env0 =  EnvGen.ar(Env.new([0.5, 1, 0.5, 0], [0.005, 0.06, 0.26], [-4, -2, -4]), doneAction:2);
	env1 = EnvGen.ar(Env.new([110, 59, 29], [0.005, 0.29], [-4, -5]));
	env1m = env1.midicps;
	
	son = LFPulse.ar(env1m, 0, 0.5, 1, -0.5);
	son = son + WhiteNoise.ar(1);
	son = LPF.ar(son, env1m*1.5, env0);
	son = son + SinOsc.ar(env1m, 0.5, env0);
	
	son = son * 1.2;
	son = son.clip2(1);
	
	OffsetOut.ar(out, Pan2.ar(son * amp));
}).store;

SynthDef(\snare, { |out=0, amp=0.1, pan=0|
	var snare, filtWhite;

	filtWhite = LPF.ar(WhiteNoise.ar(1), 7040, 1);

	snare = ((SinOsc.ar(330,0,0.25) * EnvGen.ar(Env.perc(0.0005,0.055)))
                       +(SinOsc.ar(185,0,0.25) * EnvGen.ar(Env.perc(0.0005,0.075)))
                       +(filtWhite * EnvGen.ar(Env.perc(0.0005,0.2), doneAction: 2) * 0.2)
                       +(HPF.ar(filtWhite, 523, 1) * EnvGen.ar(Env.perc(0.0005,0.183)) * 0.2)
                       ); 

	OffsetOut.ar(out, Pan2.ar(snare * amp * 10, pan));
}).store;

SynthDef(\hh, { |out, baseFreq = 300, time = 15, amp=0.1, pan|
	var freqs = [205.35, 304.41, 369.64, 522.71, 540.54, 812.21];
	var signal, pulseEnv;
	
	pulseEnv = EnvGen.ar(Env.new([1.0, 0.6], [time], [-0.5]), timeScale:(1/1000));
	signal = Mix.new(LFPulse.ar(freqs * 4.09));
	signal = (BinaryOpUGen('==', signal, 6.0) * 0.6) + (BinaryOpUGen('==', signal, 2.0) * 0.2) + (BinaryOpUGen('==', signal, 1.0) * 0.9); // XOR
   	signal = (signal * pulseEnv) + (Mix.new(LFPulse.ar(freqs, width:0.55)) * 0.9);
 	signal = RLPF.ar(signal, 7000, 0.6);
  	signal = RHPF.ar(signal, 6800, 1.5);
 	signal = RHPF.ar(signal, 6800, 1.5);
 	signal = RHPF.ar(signal, 1200, 1.5);
	signal = signal + FreeVerb.ar(signal);
	signal = signal * EnvGen.ar(Env.new([0, 1, 0.4, 0, 0], [2, time, 50, 500], [0, -0.5, 0, -50]), timeScale:(1/1000), doneAction:2);
//	signal = [signal, DelayN.ar(signal, 0.005, 0.005)];
	signal = Pan2.ar(signal, pan);
	OffsetOut.ar(out, signal*4*amp);
}).store;

SynthDef(\acidBass, {	|out, gate=1, freq=440, amp=0.1, pan=0|
	var env1, env2, son, pitch;
	pitch = freq.cpsmidi;
	pitch = Lag.kr(pitch, 0.12 * (1-Trig.kr(gate, 0.001)) * gate);
	env1 = EnvGen.ar(Env.new([0, 1.0, 0, 0], [0.001, 2.0, 0.04], [0, -4, -4], 2), gate, amp);
	env2 = EnvGen.ar(Env.adsr(0.001, 0.8, 0, 0.8, 70, -4), gate, doneAction:2);
	son = LFPulse.ar(pitch.midicps, 0.0, 0.51, 2, -1);

	son = RLPF.ar(son, (pitch + env2).midicps, 0.3);
	son = son * env1;
	
	OffsetOut.ar(out, Pan2.ar(son, pan));
}).store;

///////////////////////////////////////////////
n = NetAddr("127.0.0.1", 12000);

q = ();
q.kick =		List[0.5];

q.snare =		List[0.5];
q.snareAmp =	List[0,1]*0.1;

q.hh =		List[0.125];
q.hhAmp =		List[1]*0.1;

q.bass =		List[0.125];
q.bassAmp =	List[1]*0.1;
q.bassLine =	List[0,2,1,0,0,4];
q.bassArticRaw = [0,1,0,0,1,0].collect{|i| if (i < 1) { 0.9 } { 1 }  };
q.bassArtic =	List.newUsing(q.bassArticRaw);

q.clock = TempoClock(2);

q.bassFuncCounter = 0;
q.bassFunc = {
	q.bassFuncCounter = q.bassFuncCounter + 1;
	n.sendMsg("/kick", (8+(q.bassFuncCounter%4)).asInteger);
};

q.snareFuncCounter = 0;
q.snareFuncStats = [[1,1,1], [1,0.5,1]] * 255;
q.snareFunc = {
	var current = q.snareFuncStats[q.snareFuncCounter%2];
	q.snareFuncCounter = q.snareFuncCounter + 1;
	n.sendMsg("/snare", current[0].asInteger, current[1].asInteger, current[2].asInteger);
};

q.hihatCounter = 0;
q.hihatFunc = {
	q.hihatCounter = q.hihatCounter + 1;
	n.sendMsg("/hihat", (20.rand).asInteger, (q.hihatCounter%4).asInteger)
};

q.amino = AminoacidPattern("ggaacgggtactattatttattataaccagggc", inf, 0);

Pdef(\kick,
	Pbind(
		\instrument, \kick,
		\dur, Pseq(q.kick, inf),
		\func, Pfunc{ q.bassFunc.value; 0 }
	)
);

Pdef(\snare,
	Pbind(
		\instrument, \snare,
		\amp, Pseq(q.snareAmp, inf),
		\dur, Pseq(q.snare, inf),
		\func, Pfunc{ q.snareFunc.value; 0 }
	)
);

Pdef(\hh,
	Pbind(
		\instrument, \hh,
		\amp, Pseq(q.hhAmp, inf),
		\dur, Pseq(q.hh, inf),
		\pan, Pwhite(-0.3, 0.3, inf),
		\func, Pfunc{ q.hihatFunc.value; 0 }
	)
);

Pdef(\bass,
	PmonoArtic(\acidBass,
		\degree, q.amino.trace,
		\stepsPerOctave, 12,
		\octave, 2,
		\mtranspose, 0,
		\scale, [0,1,4,5,6,9,10],	//harmonicMinor
		\dur, 0.125,
		\pan, Pwhite(-0.25, 0.25, inf),
		\legato, Prand([0.3, 0.2, 1], inf)
	)
);

//Pdef(\bass,
//	PmonoArtic(\acidBass,
//		\scale, [0,2,3,5,7,8,10],
//		\octave, 2,
//		\mtranspose, 0,
//		\ctranspose, 7,
//		\legato, Pseq(q.bassArtic, inf),
//		\degree, Pseq(q.bassLine, inf),
//		\amp, Pseq(q.bassAmp, inf),
//		\dur, Pseq(q.bass, inf)
//	)
//);

q.main = Ptpar([
	0,	Pdef(\kick),
	4,	Pdef(\snare),
	8,	Pdef(\hh),
	12,	Pdef(\bass)
]).play;

TempoClock.default.tempo = 1.25;

/*
q.kick.array = [0.125];

q.main.stop
q.bassLine.array = [0,0,4,0,0,3,0,2,0,1,0]

SynthDefPool.gui
*/