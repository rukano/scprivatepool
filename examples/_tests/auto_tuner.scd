// doesn't do what expected, but it's a beginning...

(
SynthDef(\pitcher,{
	var in, amp, freq, hasFreq, out, diff;
	in = SoundIn.ar(0);
	# freq, hasFreq = Pitch.kr(in, minFreq:40.midicps, maxFreq:90.midicps, ampThreshold: 0.1, median: 7);
	diff = freq;
	freq = freq.cpsmidi.round.midicps;
	out = PitchShift.ar(in, pitchRatio:diff/freq).dup;
//	[diff, freq].poll;
	Out.ar(0,out*4)
}).play(s);
)
