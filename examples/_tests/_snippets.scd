// SYNTHESIS
(
{	// needs increased memory allocation
	// nice ambienty swarm sound
	var snd = Decay2.ar(Dust.ar(4)!2, 0.01, 0.1, mul:WhiteNoise.ar);
	snd = RLPF.ar(snd, XLine.kr(12000,40, 25), 0.05) * 2;
	80.do { snd = AllpassN.ar(snd, 0.5, {0.5.rand}!2, rrand(0.5, 12.0)) };
	snd * EnvGen.kr(Env.perc(0.01, 50, 1, 10), doneAction:2);
}.play
)

// EVENTS & PATTERNS

(
// foar adding proto events! (do not forget)
var	prot = Event.default.put(\freq, { ~midinote.midicps / ~sampleBaseFreq });
p = Pbind(
	...
).play(protoEvent: prot);
)

// shuffle my pattern! (and concatenate patterns)
Pbind(\dur, Prorate([2/3,1/3], Pn(0.5,inf)), \degree, Pseq([0],4) ++ Pwhite(0,7,24).select{ |x| x.even } ++ Pseq([7], 4)).play

// network boradcasting

unixCmd("ifconfig | grep broadcast | awk '{print $NF}'")
NetAddr.broadcastFlag = true;
NetAddr.langPort

// array methods
.reject
.removeAllSuchThat{ |x| x.even }
.diferentiate

// number methods
.midiratio
.ring2

(1 / 4).asFraction
1e12 // (exp)
1.3e4
2r001
2r011
200.asBinaryDigits
215.asDigits(3)
0.5pi

1b	// flat
1s	// sharp

// classes
Scale
Tuning
Pdefn

// synth desc lib
SynthDescLib.global.browse;
SynthDescLib.global.synthDescs.at(\default);
SynthDescLib.global.synthDescs.at(\default).makeWindow; // nice!
SynthDescLib.global.synthDescs.keys; // all stored synths
SynthDef(..., {}, metadata: (specs: (cutoff: \freq, volume: \amp)))
