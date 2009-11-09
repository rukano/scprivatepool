(
///////////////////////////////////
//----SYNTHS
///////////////////////////////////
SynthDef(\trig1, {|out=0|
	var env, pan, freq, osc;
	freq= Rand(5.0, 30.0);
	env= EnvGen.ar(Env.perc(Rand(0.0001, 0.1), Rand(0.7, 0.9), 1, Rand(-8.0, -4.0)), doneAction:2);
//	osc= Formant.ar(freq, freq*(4+ Rand(0, 50)), freq*(2 + Rand(0, 50)), env);
	osc= Formant.ar(freq, freq*(Rand(0, 50)), freq*(Rand(0, 50)), env);
	pan= Pan2.ar(osc, Rand(-1.0, 1));
Out.ar(out, pan*0.15)}).store;
///////////////////////////////////
SynthDef(\trig2, {|out=0|
	var env, pan, freq;
	freq= Rand(25.0,120.0);
	env= EnvGen.ar(Env.sine(Rand(0.8, 2.5)), doneAction:2);
	pan= Pan2.ar(FSinOsc.ar(freq + Rand(0, 30), mul:env));
Out.ar(out, pan*0.15)}).store;
//////////////GLOCKEN/////////////////////
SynthDef(\trig3, {|out=0|
	var env, pan, f1, f2, f3, f4, f5, f6, f7, f8;
	f1= Rand(200.00, 300.00);
	f2= Rand(300.00, 400.00);
	f3= Rand(400.00, 500.00);
	f4= Rand(600.00, 800.00);
	f5= Rand(800.00, 1000.00);
	f6= Rand(1000.00, 1500.00);
	f7= Rand(1500.00, 2000.00);
	f8= Rand(2000.00, 5000.00);
	env= EnvGen.ar(Env.perc(0.01, Rand(2.5,4.0)), doneAction:2);
	pan= Pan2.ar(
		SinOsc.ar(f1, 0, env*0.1) +
		SinOsc.ar(f2, 0, env*0.1) +
		SinOsc.ar(f3, 0, env*0.1) +
		SinOsc.ar(f4, 0, env*0.1) +
		SinOsc.ar(f5, 0, env*0.1) +
		SinOsc.ar(f6, 0, env*0.1) +
		SinOsc.ar(f7, 0, env*0.1) +
		SinOsc.ar(f8, 0, env*0.1)
	);
Out.ar(out, pan*0.15)}).store;
///////////////////////////////////
SynthDef(\trig4, {|out=0|
	var env, pan, f1, f2, f3, f4, f5, f6, f7, f8;
	f1= Rand(200.00, 250.00);
	f2= Rand(250.00, 300.00);
	f3= Rand(300.00, 350.00);
	f4= Rand(350.00, 400.00);
	f5= Rand(400.00, 450.00);
	f6= Rand(450.00, 500.00);
	f7= Rand(500.00, 550.00);
	f8= Rand(550.00, 600.00);
	env= EnvGen.ar(Env.perc(0.001, Rand(2.5,4.0)), doneAction:2);
	pan= Pan2.ar(
		FSinOsc.ar(f1, 0, env*0.1) +
		FSinOsc.ar(f2, 0, env*0.1) +
		FSinOsc.ar(f3, 0, env*0.1) +
		FSinOsc.ar(f4, 0, env*0.1) +
		FSinOsc.ar(f5, 0, env*0.1) +
		FSinOsc.ar(f6, 0, env*0.1) +
		FSinOsc.ar(f7, 0, env*0.1) +
		FSinOsc.ar(f8, 0, env*0.1)
	);
Out.ar(out, pan*0.25)}).store;
///////////////FM-AM////////////////////
SynthDef(\trig5, {|out=0|
	var env, pan, dur, car, mod, freq, fm, afm;
	freq = Rand(200.0, 1600.0);
	fm = Rand(10.0, 500.0);
	afm = Rand(50.0, 200);
	dur = Rand(2.0, 5.0);
	env= EnvGen.ar(Env.sine(dur), doneAction:2);
	mod = SinOsc.ar(fm, 0, afm, freq);
	car = SinOsc.ar(mod, 0, 0.25);
	pan= Pan2.ar(car, 1-(Rand(0.0, 2.0)), env);
Out.ar(out, pan*0.15)}).store;
///////////////////////////////////
SynthDef(\trig6, {|out=0|
	var env, pan, dur, car, mod, freq, fam, dam;
	freq = Rand(200.0, 1600.0);
	fam = Rand(10.0, 1000.0);
	dam = Rand(0.1, 1.0);
	dur = Rand(3.0, 6.0);
	env= EnvGen.ar(Env.sine(dur), doneAction:2);
	mod = SinOsc.ar(fam, 0, dam);
	car = SinOsc.ar(freq, 0, mod);
	pan= Pan2.ar(car, 1-(Rand(0.0, 2.0)), env);
Out.ar(out, pan*0.15)}).store;
///////////////////////////////////
///////////////////////////////////
SynthDef(\noise, {|out=0, freq=40|
	var pan, filter, osc1, osc2, noise;
	osc1 = SinOsc.kr(0.025, 0, 0.8);
	osc2 = SinOsc.kr(0.05);
	noise = PinkNoise.ar(osc2);
	filter = Resonz.ar(noise, freq, 1);
	pan = Pan2.ar(filter, osc1);
Out.ar(out, pan*0.3)}).store;
///////////////////////////////////
SynthDef(\dust, {|out=0, freq=70|
	var pan, filter, osc1, panOsc, dust, noise;
	osc1 = SinOsc.kr(0.1,0,36,40);
	panOsc = SinOsc.kr(0.01, 0, 1);
	dust = Dust.kr(osc1);
	noise = PinkNoise.ar(dust);
	filter = Resonz.ar(noise, freq, 1);
	pan = Pan2.ar(filter, panOsc);
Out.ar(out, pan*0.4)}).store;
////////////////////////////////////////////////////////////
//---Cluster Synths
SynthDef(\clusterBass, { |out=0, dur=10|
var snd, pan, clu;
	clu = Array.fill(20,{ Rand(40.0, 120.0);} );
	pan = Rand(0.0, 2.0);
	snd = Klang.ar(`[ clu, nil, nil ], 0.7, 0);
	snd = Pan2.ar(snd, 1-(pan));
	snd = snd * EnvGen.kr(Env.sine(dur), 1, 0.02, doneAction: 2) * 0.25;
Out.ar(out, snd)
}).store;

SynthDef(\clusterMidLo, { |out=0, dur=10|
var snd, pan, clu;
	clu = Array.fill(40, {Rand(120.0, 1200.0);} );
	pan = Rand(0.0, 2.0);
	snd = Klang.ar(`[ clu, nil, nil ], 0.7, 0);
	snd = Pan2.ar(snd, 1-(pan));
	snd = snd * EnvGen.kr(Env.sine(dur), 1, 0.02, doneAction: 2) * 0.25;
Out.ar(out, snd)
}).store;

SynthDef(\clusterMidHi, { |out=0, dur=10|
var snd, pan, clu;
	clu = Array.fill(60,{ Rand(1200.0, 3000.0); });
	pan = Rand(0.0, 2.0);
	snd = Klang.ar(`[ clu, nil, nil ], 0.7, 0);
	snd = Pan2.ar(snd, 1-(pan));
	snd = snd * EnvGen.kr(Env.sine(dur), 1, 0.02, doneAction: 2) * 0.25;
Out.ar(out, snd)
}).store;

SynthDef(\clusterHi, { |out=0, dur=10|
var snd, pan, clu;
	clu = Array.fill(80,{ Rand(2500.0, 10000.0); });
	pan = Rand(0.0, 2.0);
	snd = Klang.ar(`[ clu, nil, nil ], 0.7, 0);
	snd = Pan2.ar(snd, 1-(pan));
	snd = snd * EnvGen.kr(Env.sine(dur), 1, 0.02, doneAction: 2) * 0.25;
Out.ar(out, snd)
}).store;

SynthDef(\reversed, { |out=0, dur=2|
var snd, pan, clu;
	clu = Array.fill(60, { Rand(10000.0, 18000.0); });
	pan = Rand(0.0, 2.0);
	snd = Klang.ar(`[ clu, nil, nil ], 0.7, 0);
	snd = Pan2.ar(snd, 1-(pan));
	snd = snd * EnvGen.kr(Env.new([0,1],[dur], 8), 1, 0.02, doneAction: 2);
Out.ar(out, snd)
}).store;
////////////////////////////////////////////////////////////
////---Tasks
Tdef(\bass, {
	var curve, warte;
	loop({
		curve = rrand(13.0, 16.0);
		warte = rrand(15.0, 17.0);
		"-------BASS".postln;
		("wartezeit: " + warte).postln;
		("klangzeit: " + curve).postln;
		Synth(\clusterBass, [\dur, curve]);
		~netA.sendMsg('/juan/lo', curve);
		warte.wait;
	})
});

Tdef(\midLo, {
	var curve, warte;
	loop({
		curve = rrand(12.0, 14.0);
		warte = rrand(10.0, 14.0);
		"-------MID LO".postln;
		("wartezeit: " + warte).postln;
		("klangzeit: " + curve).postln;
		Synth(\clusterMidLo, [\dur, curve]);
		~netA.sendMsg('/juan/midlo', curve);
		warte.wait;
	})
});

Tdef(\midHi, {
	var curve, warte;
	loop({
		curve = rrand(10.0, 12.0);
		warte = rrand(12.0, 16.0);
		"-------MID HI".postln;
		("wartezeit: " + warte).postln;
		("klangzeit: " + curve).postln;
		Synth(\clusterMidHi, [\dur, curve]);
		~netA.sendMsg('/juan/midhi', curve);
		warte.wait;
	})
});

Tdef(\hi, {
	var curve, warte;
	loop({
		curve = rrand(8.0, 10.0);
		warte = rrand(14.0, 18.0);
		"-------HIGH".postln;
		("wartezeit: " + warte).postln;
		("klangzeit: " + curve).postln;
		Synth(\clusterHi, [\dur, curve]);
		~netA.sendMsg('/juan/hi', curve);
		warte.wait;
	})
});
////////////////////////////////////////////////////////////


/*

Tdef(\bass).play;
Tdef(\midLo).play;
Tdef(\midHi).play;
Tdef(\hi).play;


*/
)