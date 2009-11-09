// BUFFERS
q = ();
q.talk1 = Buffer.read(s, Document.current.path.dirname +/+ "samples/vocoder/04.aif");

// SYNTHS
(
SynthDef(\testSynth, { |out, freq=440, sustain=1, amp=0.1|
	var snd = SinOsc.ar(freq);
	snd = snd * EnvGen.ar(Env.perc(0.01, sustain), 1, amp, doneAction:2);
	OffsetOut.ar(out, snd)
}).memStore;
);
(
SynthDef(\grains, { |out, tRate=88, minDur=0.01, maxDur=0.1, buffer, start, end=1|
	var rate = LFNoise2.kr(tRate).range(-0.6, 0.6);
//	var center = 2;
	var center = LFNoise2.kr(LFNoise2.kr(4).range(1,5)).range(start, end);
	var grainDur = LFNoise2.kr(tRate).range(minDur, maxDur);
	var grainAmp = grainDur;
	var grainPan = WhiteNoise.ar.range(-0.5, 0.5);
	var snd =	TGrains.ar(
		2,
		Dust.ar(tRate),
		buffer,
		rate,
		center,
		grainDur,
		grainPan,
		grainAmp
	);
	Out.ar(out, snd);
}).memStore;
);

//Synth(\grains, [\buffer, q.talk1, \end, q.talk1.numFrames/q.talk1.sampleRate])

(
SynthDef(\vocoderA, { |buffer, rate=1, freq=220|
	var inA, chainA, inB, chainB, chain;
	inA = SinOsc.ar(freq * (1,1.5..20), 0, 0.005).sum;
	inB = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate, doneAction:2);
	inB = inB * (Amplitude.kr(inB) > 0.1).lag;
	chainA = FFT(LocalBuf(2048), inA);
	chainB = FFT(LocalBuf(2048), inB);
	chain = PV_MagMul(chainA, chainB); 
	Out.ar(0, IFFT(chain).dup * 2)
}).memStore;
);
// Synth(\vocoderA, [\buffer, q.talk1])


(
SynthDef(\player, { |buffer, amp=1, pan=0, rate=1|
	var snd = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate, doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(0, snd * amp);
}).memStore;
);

// Synth(\player, [\buffer, q.talk1, \rate, 0.8])

(
SynthDef(\laser, { |out, pan, amp=0.1|
	var snd, line, dur;
	dur =  Rand(0.05, 0.2);
	line = XLine.kr(Rand(8000, 12000), Rand(200, 40), dur);
	snd = SinOsc.ar(line) * EnvGen.ar(Env.perc(0.01, dur*1.1), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
}).memStore;
);




(
SynthDef(\beep, { |ton =1, out, pan, amp=0.5|
	var snd = Pulse.ar((600,1000..8000) * ton, mul:0.05).sum * EnvGen.ar(Env.sine(0.1), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
}).memStore;
);













