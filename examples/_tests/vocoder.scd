Ndef(\v, {
	var bands = Array.series(16, 80, 100);
	var input = BPF.ar(SoundIn.ar(0), bands, 0.01);
	var amps = Amplitude.kr(input,0.1,0.1);
	Splay.ar(Impulse.ar(bands, mul:amps.lag(0.1)))
}).play