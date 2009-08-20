/*
TO DO - 3. Teil (melodien, akkorde und SZ pausen!
GUI !!!
QC composer outputs

Snare sound!!!
Pattern beliebing auswŠhlen? nich []++[]++[]


*/

//////////////////////////////////////////////////////////////////////////////
/////////////////////////////SYNTHS///////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

SynthDef(\ping, { |out, freq=440, attack=0.001, release=1, amp=0.1, pan|
	var snd;
	snd = FSinOsc.ar(freq);
	snd = snd * EnvGen.ar(Env.perc(attack, release, 1, -20), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
	OffsetOut.ar(0, snd * amp);
}).store;

SynthDef(\peng, { |out, freq=440, attack=0.0001, release=1, amp=0.1, pan, modFreq=111, detune=2, rq=0.8|
	var snd, mod;
	mod = SinOsc.ar(modFreq);
	snd = Saw.ar([freq, freq*Rand(1.45, 1.55)] + modFreq.range(detune.neg, detune)).sum;
	snd = snd * mod;
	snd = RHPF.ar(snd, freq/2, rq*2);
	snd = RLPF.ar(snd, freq*2, rq/2);
	snd = snd * EnvGen.ar(Env.perc(attack, release, 1, -12), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
	OffsetOut.ar(0, snd * amp);
}).store;

SynthDef(\chord, { |out, freq=440, attack=0.2, sustain=0.2, decay=0.15, amp=0.05, pan, rq=0.25, gate=1|
	var snd;
	snd = Pulse.ar(freq + SinOsc.ar([Rand(0.8, 1.2), Rand(0.8, 1.2)]).range(-1,1), Rand(0.1, 0.49));
	snd = snd * SinOsc.ar(Rand(6.0, 8.2)).range(0.8, 1.0);
	snd = RLPF.ar(snd, freq, rq/4, 0.1);
	snd = snd + RHPF.ar(snd, freq, rq*2, 0.075);
	snd = snd + Blip.ar(freq, 3, 0.05);
//	snd = snd * EnvGen.ar(Env.adsr(attack, decay, 0.3, sustain), gate, doneAction:2);
	snd = snd * EnvGen.ar(Env.perc(attack, sustain), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp * 2);
	OffsetOut.ar(0, snd * amp / 2);
}).store;

SynthDef(\pong, { |out, freq=440, attack=0.1, sustain=1, amp=0.1, pan|
	var snd;
	snd = Pulse.ar(freq, 0.1);
	snd = LPF.ar(snd, freq*4);
	snd = snd * 0.25 + RLPF.ar(snd, freq, 0.45);
	snd = snd + RLPF.ar(snd, freq*1.5, 0.1);
	snd = snd * EnvGen.ar(Env.perc(attack, sustain, 1, -8), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
	OffsetOut.ar(0, snd * amp);
}).store;

/////////////////////////////DRUMS//////////////////////////////////////////////

SynthDef(\kick, { |out, ffreq=80, attack=0, release=2, amp=0.1, pan|
	var snd;
	snd = SinOsc.ar([ffreq, ffreq*1.01, ffreq*1.03, ffreq*1.06, ffreq*1.1], 0, 0.5).sum;
	snd = snd + PinkNoise.ar;
	snd = RLPF.ar(snd, ffreq, 0.1);
	snd = RLPF.ar(snd, ffreq*2, 0.2);
	snd = RLPF.ar(snd, ffreq*3, 0.3);
	snd = RLPF.ar(snd, ffreq*4, 0.4);
	snd = RLPF.ar(snd, ffreq*5, 0.5);
	snd = snd + LPF.ar(WhiteNoise.ar, ffreq*6);
	snd = snd * EnvGen.ar(Env.perc(attack, release, 1, -50), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
	OffsetOut.ar(0, snd * amp);
}).store;

SynthDef(\bass, { |out, freq=100, attack=0.1, release=2, amp=0.1, pan|
	var snd;
	snd = SinOsc.ar(XLine.kr(
		[freq, freq*1.5, freq*2, freq*3],
		[freq, freq*1.5, freq*2, freq*3]/4,
		release/2,
		0,
		0.5)
	).sum;
	snd = RLPF.ar(snd, freq*2/3, 0.1);
	snd = snd * EnvGen.ar(Env.perc(attack, release, 2, -10), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
	OffsetOut.ar(0, snd * amp);
}).store;

SynthDef(\snare, { |out, ffreq=100, rq=0.5, attack=0, release=0.5, amp=0.1, pan|
	var snd;
	snd = WhiteNoise.ar();
	snd = HPF.ar(snd, ffreq);
	snd = snd + HPF.ar(snd, ffreq*1.345);
	snd = snd + HPF.ar(snd, ffreq*2.4567);
	snd = snd + HPF.ar(snd, ffreq*4.345);
	snd = LPF.ar(snd, 2000);
	snd = RHPF.ar(snd, ffreq*2, rq) * 0.2;
	snd = snd * EnvGen.ar(Env.perc(attack, release, 1, -10), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
	OffsetOut.ar(0, snd * amp);
}).store;

SynthDef(\hihat, { |out, ffreq=200, rq=0.5, attack=0, release=0.025, amp=0.1, pan|
	var snd;
	snd = WhiteNoise.ar();
	snd = HPF.ar(snd, ffreq);
	snd = RHPF.ar(snd, ffreq*2, rq);
	snd = snd * EnvGen.ar(Env.perc(attack, release, 1, -10), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp * 2);
	OffsetOut.ar(0, snd * amp);
}).store;



//////////////////////////FX////////////////////////////////////////////////

SynthDef(\reverbz, { |in=20, out=100, amp=0.1, mix=0.5, rmix=1, room=0.8, damp=0.8|
	var snd;
	snd = In.ar(in, 2);
	snd = FreeVerb2.ar(snd[0], snd[1], rmix, room, damp);
	XOut.ar(out, mix, snd);
}).store;

SynthDef(\combzA, { |in=22, out=100, amp=0.1, mix=0.5, maxdelay=5, delay=0.05, decay=0.6|
	var snd;
	snd = In.ar(in, 2);
	snd = CombN.ar(snd, maxdelay, delay, decay);
	XOut.ar(out, mix, snd);
}).store;

SynthDef(\combzB, { |in=24, out=100, amp=0.1, mix=0.5, maxdelay=5, delay=0.1, decay=1|
	var snd;
	snd = In.ar(in, 2);
	snd = CombN.ar(snd, maxdelay, delay, decay);
	XOut.ar(out, mix, snd);
}).store;

SynthDef(\combzC, { |in=26, out=100, amp=0.1, mix=0.5, maxdelay=5, delay=0.018, decay=0.35|
	var snd;
	snd = In.ar(in, 2);
	snd = CombN.ar(snd, maxdelay, delay, decay);
	XOut.ar(out, mix, snd);
}).store;

SynthDef(\mixer, { |in=100, out, amp=0.1, mix=0.5, maxdelay=5, delay=0.111, decay=2|
	var snd;
	snd = In.ar(in, 2) * 2;
	XOut.ar(out, mix, snd);
}).store;

SynthDef(\compressor, { |in=0, out, amp=0.1, thresh=0.8, slopeB=1, slopeA=0.1, clampT=0.01, relaxT=0.5|
	var snd;
	snd = In.ar(in, 2);
	snd = Compander.ar(snd, snd, thresh, slopeB, slopeA, clampT, relaxT);
	ReplaceOut.ar(out, snd);
}).store;


///////////////////////////TESTS////////////////////////////////////////////
/*


*/

///////////////////////////////////////////////////////////////////////////
///////////////////////////SCORE///////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

/*
OUT 20/21 -> reverbz
OUT 22/23 -> combz (delay) short
OUT 24/25 -> combz (delay) long
OUT 26/27 -> combz (delay) xtra short

OUT 100/101 -> mixer
*/

q = q ? ();
q.fx = ();
q.ping = ();
q.pong = ();
q.chord = ();
q.chords = ();
q.buttons = ();


q.fx.reverb = Synth.tail(s, \reverbz);
q.fx.combA = Synth.tail(s, \combzA);
q.fx.combB = Synth.tail(s, \combzB);
q.fx.combC = Synth.tail(s, \combzC);
q.mixer = Synth.tail(s, \mixer);
q.compressor = Synth.tail(s, \compressor);
q.pdef = [ Pdef(\chord), Pdef(\ping), Pdef(\peng) ];
q.scale = [ 0,2,4,5,7,9,11 ]-2;

//---Pings

q.ping.melodyA = [3,5,7,8, 3,5,7,8, 2,4,6,10, 3,4,6,10];
q.ping.melodyB = [5,4,3,1, 0,1,0,1,0, -2,-3]+7;
q.ping.melodyC = [-3,-1,3,1]+7;
q.ping.melodyD = [0,-2]+7;

q.ping.rhythmA = 2!16;
q.ping.rhythmB = [2,2,2,10, 1,1,1,1,2, 1,9];
q.ping.rhythmC = [2,2,2,10];
q.ping.rhythmD = [7, 9];

//---Harmonies
//---First Part

q.chords[0] = [1,8];
q.chords[1] = [5,3];
q.chords[2] = [1,6,4];
q.chords[3] = [4,8];
q.chords[4] = [5,7];
q.chords[5] = [6,10];

//---Second Part

q.chords[6] = [1,3,5];
q.chords[7] = [-3,1];
q.chords[8] = [-2,1,3];
q.chords[9] = [-3,-1];

q.chords[10] = [-3,-1,2];
q.chords[11] = [-2,1];
q.chords[12] = [-3,1];
q.chords[13] = [-5,-2];

//---Third Part

q.chords[14] = [6];
q.chords[15] = [5];
q.chords[16] = [8];
q.chords[17] = [3];

q.chords[18] = [6];
q.chords[19] = [5];
q.chords[20] = [8];
q.chords[21] = [10];

//---Chord Rhythms

q.chord.rhythmA = [2,2,3.5, 2.5,2,4];
q.chord.rhythmB = [3.5,4.5,4.5,3.5, 3,5,3,5];

q.chord.rhythmC = [3.5,4,4,8.5];

//---PONG

q.pong.melodyA = [-1,3,5, 3,5,3, 1,7];
q.pong.melodyB = [8,6,4,3, 3,4, 3,4,2];
q.pong.melodyC = [8,9,10, 6,5,2];

q.pong.rhythmA = [1,2,2,  1,1,1, 1,8];
q.pong.rhythmB = [2,2,2,2, 2,2, 1,1,9];
q.pong.rhythmC = [2,2,4, 2,2,3];

/////////////////////PATTERNS///////////////////////////

Pdef(\ping,
	Pbind(
		\scale, q.scale,
		\instrument, \ping,
		\degree, Pseq(
			q.ping.melodyA ++ q.ping.melodyA ++
			q.ping.melodyB ++ q.ping.melodyC ++ q.ping.melodyD ++
			q.ping.melodyB ++ q.ping.melodyC ++ q.ping.melodyD			-1, inf),
		\octave, 6, 
		\out, 20,
		\amp, 0.5,
		\dur, Pseq(
			q.ping.rhythmA ++ q.ping.rhythmA ++
			q.ping.rhythmB ++ q.ping.rhythmC ++ q.ping.rhythmD ++
			q.ping.rhythmB ++ q.ping.rhythmC ++ q.ping.rhythmD 
			/ 4, inf)
	)
);

Pdef(\chord,
	Pbind(
		\scale, q.scale,
		\instrument, \chord,
		\degree, Pseq([
			q.chords[0], q.chords[1], q.chords[2], q.chords[3], q.chords[4], q.chords[5],
			q.chords[0], q.chords[1], q.chords[2], q.chords[3], q.chords[4], q.chords[5],
			q.chords[6], q.chords[7], q.chords[8], q.chords[9],
			q.chords[10], q.chords[11], q.chords[12], q.chords[13],
			q.chords[6], q.chords[7], q.chords[8], q.chords[9],
			q.chords[10], q.chords[11], q.chords[12], q.chords[13]			] -1 + 7,inf),
		\legato, 1,
		\octave, 4, 
		\out, 20,
		\amp, 0.25,
		\dur, Pseq( q.chord.rhythmA ++ q.chord.rhythmA ++ q.chord.rhythmB ++ q.chord.rhythmB / 2, inf )
	)
);


Pdef(\chordB,
	Pbind(
		\scale, q.scale,
		\instrument, \chord,
		\degree, Pseq([
			q.chords[14], q.chords[15], q.chords[16], q.chords[17],
			q.chords[18], q.chords[19], q.chords[20], q.chords[21]
			] -1 + 7,inf),
		\legato, 1,
		\octave, 4, 
		\out, 20,
		\amp, 0.25,
		\dur, Pseq( q.chord.rhythmC / 2, inf )
	)
);

Pdef(\pong,
	Pbind(
		\scale, q.scale,
		\instrument, \pong,
		\degree, Pseq(
			q.pong.melodyA ++
			q.pong.melodyB ++
			q.pong.melodyA ++
			q.pong.melodyC
			- 1, inf),
		\octave, 4, 
		\out, 20,
		\amp, 0.5,
		\legato, 2,
		\dur, Pseq( q.pong.rhythmA ++ q.pong.rhythmB ++ q.pong.rhythmA ++ q.pong.rhythmC / 4, inf)
	)
); 

////////////////////////////////////DRUMZ////////////////////////////////////

Pdef(\kick,
	Pbind(
		\instrument, \kick,
		\freq, 80,
		\sustain, 0.1,
		\out, Prand([0,0,0,0,0,0,0,0,0,0, 22, 24, 26], inf),
		\amp, 0.1,
		\dur, Prand([
			Pseq([3,3,1,1]/4),
			Pseq([3,5]/4),
			Pseq([1,2,1,4]/4),
			Pseq([1,2,2,1,1,1]/4),
			Pseq([8]/4),
		],inf)
	)
);


Pdef(\snare,
	Pbind(
		\instrument, \snare,
		\sustain, 0.1,
		\out, Prand([0,0,0,0,0,0,0,0,0,0, 22, 24, 26], inf),
		\amp, Prand([
			Pseq([0,0,1,0]/2),
			Pseq([0,0,1,0]/2),
			Pseq([0,0,1,0]/2),
			Pseq([0,0,1,0]/2),
			Pseq([0,0,1,0]/2),
			Pseq([0,0,1,0]/2),
			Pseq([0,0,1,0]/2),
			Pseq([0,0,1,0]/2),
			Pseq([0,0,1,1]/2),
			Pseq([1,0,0,0]/2),
			Pseq([1,1,0,1]/2),
			Pseq([1,0,1,0]/2),
			Pseq([1,1,1,1]/2),
		], inf),
		\dur, Pseq([1,1,1,1]/4,inf)
	)
);


Pdef(\hihat,
	Pbind(
		\instrument, \hihat,
		\sustain, 0.1,
		\out, Prand([0,0,0,0, 22, 24, 26], inf),
		\amp, Pseq([1,1,1,1]/10,inf),
		\dur, Pseq([1,1,1,1]/4,inf)
	)
);

Pdef(\bass,
	Pbind(
		\instrument, \bass,
		\freq, Prand([80, 120],inf),
		\sustain, 0.1,
		\out, Prand([0,0,0,0,0,0,0,0,0,0,20], inf),
		\amp, 0.075,
		\dur, Prand([
			Pseq([16]/4),
			Pseq([16]/4),
			Pseq([16]/4),
			Pseq([16]/4),
			Pseq([8]/4),
			Pseq([8]/4),
			Pseq([3,5]/4),
			Pseq([7,1]/4),
		],inf)
	)
);


Pdef(\ping).stop;
Pdef(\chord).stop;
Pdef(\kick).stop;
Pdef(\bass).stop;
Pdef(\hihat).stop;
Pdef(\snare).stop;
Pdef(\pong).stop;


//Pdef(\ping).play;
//Pdef(\chord).play;
//Pdef(\kick).play;
//Pdef(\bass).play;
//Pdef(\hihat).play;
//Pdef(\snare).play;


/*




















(
Pdef(\ping).stop;
Pdef(\chord).stop;

Pdef(\pong).play;
Pdef(\chordB).play;
)

(
Pdef(\ping).play;
Pdef(\chord).play;

Pdef(\chordB).play;
Pdef(\pong).stop;
)

*/

TempoClock.default.tempo = 1.25;


/*

q.pdef.do { |i| i.play };
q.pdef.do { |i| i.stop };
s.queryAllNodes

*/


///////////////////////////////////////////////////////////////////////////
///////////////////////////GUI/////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////


//w = GUI.window.new("Aphex Twin Generator").front;

