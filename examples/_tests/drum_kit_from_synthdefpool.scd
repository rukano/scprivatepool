// needs more dog...
// TODO: repair hihat sustain
// TODO: more complex patterns
// TODO: machine listening (make pattern dependant from other patterns)

SynthDef(\kick, { |out=0, amp=0.1, pan=0|
// by Dan Stowell (SynthDefPool)
	var ampenv, pitchenv;
	ampenv   = EnvGen.ar(Env.perc(0, 0.1, curve: -10), doneAction: 2);
	pitchenv = EnvGen.ar(Env.perc(0, 0.1, curve: -10).exprange(0, 1000), doneAction: 2);
	OffsetOut.ar(out, Pan2.ar(SinOsc.ar(pitchenv) * amp, pan))
}).memStore;

SynthDef(\snare, { |out=0, amp=0.1, pan=0|
// from SynthDefPool
	var snare, filtWhite;
	filtWhite = LPF.ar(WhiteNoise.ar(1), 7040, 1);
	snare = ((SinOsc.ar(330,0,0.25) * EnvGen.ar(Env.perc(0.0005,0.055)))
     	+(SinOsc.ar(185,0,0.25) * EnvGen.ar(Env.perc(0.0005,0.075)))
		+(filtWhite * EnvGen.ar(Env.perc(0.0005,0.2), doneAction: 2) * 0.2)
		+(HPF.ar(filtWhite, 523, 1) * EnvGen.ar(Env.perc(0.0005,0.183)) * 0.2)
	); 
OffsetOut.ar(out, Pan2.ar(snare * amp * 10, pan));
}).memStore;

SynthDef(\hihat, { |out=0, baseFreq = 300, sustain = 250, amp=0.1|
// from SynthDefPool
	var freqs = [205.35, 304.41, 369.64, 522.71, 540.54, 812.21];
	var signal, pulseEnv;
	
	pulseEnv = EnvGen.ar(Env.new([1.0, 0.6], [sustain], [-0.5]), timeScale:(1/1000));
	signal = Mix.new(LFPulse.ar(freqs * 4.09));
	signal = (BinaryOpUGen('==', signal, 6.0) * 0.6) + (BinaryOpUGen('==', signal, 2.0) * 0.2) + (BinaryOpUGen('==', signal, 1.0) * 0.9); // XOR
   	signal = (signal * pulseEnv) + (Mix.new(LFPulse.ar(freqs, width:0.55)) * 0.9);
 	signal = RLPF.ar(signal, 7000, 0.6);
  	signal = RHPF.ar(signal, 6800, 1.5);
 	signal = RHPF.ar(signal, 6800, 1.5);
 	signal = RHPF.ar(signal, 1200, 1.5);
	signal = signal + FreeVerb.ar(signal);
	signal = signal * EnvGen.ar(Env.new([0, 1, 0.4, 0, 0], [2, sustain, 50, 500], [0, -0.5, 0, -50]), timeScale:(1/1000), doneAction:2);
	signal = [signal, DelayN.ar(signal, 0.005, 0.005)];
	OffsetOut.ar(out, signal*4*amp);
}).memStore;

c = TempoClock(2).permanent_(true);

Pdef(\kick,
	Pbind(
		\instrument, \kick,
		\dur, Pseq([1.5,2.5],inf)
	)
).play(c, quant:[4,0,0]);

Pdef(\snare,
	Pbind(
		\instrument, \snare,
		\amp, Pseq([0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,1] *0.1,inf),
		\dur, 0.5
	)
).play(c, quant:[4,0,0]);

Pdef(\hihat,
	Pbind(
		\instrument, \hihat,
		\amp, Pseq([1] * 0.1,inf),
		\sustain, Pseq([1,1,10,1]*0.1, inf),
		\dur, 0.5
	)
).play(c, quant:[4,0,0]);
