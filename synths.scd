//_______MySynthLib


//_______TESTER
(
SynthDef(\test, { |out, freq=440, sustain=1, amp=0.1, gate=1|
	var snd = Splay.ar(SinOsc.ar(freq * [1,1.5], mul:0.5));
	snd = snd * EnvGen.ar(Env.adsr(0.001, 0.05, 0.33, 0.2), gate, amp, doneAction:2);
	OffsetOut.ar(out, snd)
}).add;
);
//_______GRAINER
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
}).add;
);
//_______VOCODER
(
SynthDef(\vocoder, { |buffer, rate=1, freq=220|
	var inA, chainA, inB, chainB, chain;
	inA = SinOsc.ar(freq * (1,1.5..20), 0, 0.005).sum;
	inB = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate, doneAction:2);
	inB = inB * (Amplitude.kr(inB) > 0.1).lag;
	chainA = FFT(LocalBuf(2048), inA);
	chainB = FFT(LocalBuf(2048), inB);
	chain = PV_MagMul(chainA, chainB); 
	Out.ar(0, IFFT(chain).dup * 2)
}).add;
);
//_______BUFFERplayer
(
SynthDef(\player, { |out, buffer, amp=1, pan=0, sustain=0.1, rate=1, t_trig=1, start=0, loop=0|
	var snd = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate, t_trig, BufFrames.kr(buffer) * start, loop);
	snd = snd * EnvGen.ar(Env.linen(0,sustain,0), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
}).add;
);
//_______BUFFERrecorder
SynthDef(\recorder, { |rate, inVol=1, mix=0,  buf, loop=0, offset=0|
	var snd;
	var input = SoundIn.ar(0);
	snd = RecordBuf.ar(input, buf, offset, inVol, mix, loop:loop, doneAction:2);
}).add;
//_______LASER
(
SynthDef(\laser, { |out, pan, amp=0.1|
	var snd, line, dur;
	dur =  Rand(0.05, 0.2);
	line = XLine.kr(Rand(8000, 12000), Rand(200, 40), dur);
	snd = SinOsc.ar(line) * EnvGen.ar(Env.perc(0.01, dur*1.1), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
}).add;
);
//_______PEEEP!!!
(
SynthDef(\beep, { |ton =1, out, pan, amp=0.5|
	var snd = Pulse.ar((600,1000..8000) * ton, mul:0.05).sum;
	snd = snd * EnvGen.ar(Env.sine(0.1), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
}).add;
);

///////////////////////////////////////////////

(
SynthDef(\ping, { |out, freq=440, amp=0.1, gate=1|
	var snd = Splay.ar(SinOsc.ar(freq * [1,2,3,4], mul:0.25));
	snd = snd * EnvGen.ar(Env.adsr(0.001, 0.1, 0.1, 0.1), gate, doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);

(
SynthDef(\kick, { |out, sustain=1, amp=0.1, saw=1|
	var snd = SinOsc.ar(60)!2;
	snd = snd * EnvGen.ar(Env.perc(0.001, 0.05), doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);

(
SynthDef(\pad, { |out, freqScale=1, sustain=1, amp=0.1, saw=1|
	var snd = Klang.ar(`[ Array.exprand(24, 100, 1000), 0.05, nil ], freqScale)!2;
	snd = snd * EnvGen.ar(Env.sine(sustain), doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).add;
);
