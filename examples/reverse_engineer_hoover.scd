// reverse engineering from Dominator (human ressources?)
// code found in the sc-user mailing list posted by Wouter Snoei
// http://www.youtube.com/watch?v=J1pzvapaR1E

(
SynthDef( "hoover", { |freq = 220, amp = 0.1, lgu = 0.1, lgd = 1, gate = 1|
var pwm, mix, env;

freq = freq.cpsmidi.lag(lgu,lgd).midicps;
freq = SinOsc.kr( { 2.9 rrand: 3.1 }!3, {2pi.rand}!3 ).exprange( 0.995, 1.005 ) * freq;
pwm = SinOsc.kr( {2.0 rrand: 4.0}!3 ).range(0.125,0.875);

// the saw/pulses
mix = (LFSaw.ar( freq * [0.25,0.5,1], 1 ).range(0,1)
		* (1 - LFPulse.ar(freq * [0.5,1,2], 0, pwm))).sum * 0.1;

// the bass
mix = mix + LFPar.ar( freq * 0.25, 0, 0.1 );

// eq for extra sharpness
mix = BPeakEQ.ar( mix, 6000, 1, 3 );
mix = BPeakEQ.ar( mix, 3500, 1, 6 );

// kind of chorus
mix = mix + CombC.ar( mix.dup, 1/200,
			SinOsc.kr( 3, [0.5pi, 1.5pi] ).range(1/300,1/200),
		0.0 ) * 0.5;

env = EnvGen.kr( Env.asr, gate );

Out.ar( 0, mix * env * amp );
}).store;
)

(
p = Pmono(\hoover,
		\dur, Pseq([0.25,0.5,7, 0.25]* 0.24, inf),
		\lgu, 0.15,
		\lgd, Pseq([ 0.1, 0.1, 1.5, 0.25], inf ),
		\midinote, Pseq([20, 67, 62, 20] , inf)).play;
)
p.stop;

(
p = Pmono(\hoover, \dur, 0.24,
	\lgu, 0.2,
	\lgd, Pseq([1,1,2,0.5,2,2,2,2], inf ),
	 \midinote, Pseq([55, 40, 67, 55, 40, 55, 53, 52], inf)).play;
)
p.stop;
