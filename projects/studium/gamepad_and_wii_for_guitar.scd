// Gitarre + (standalone)
// Studienarbeit


// Variables
q = ();			// Global Dictionary
z = [0,0,0,0];	// Button State (4 Buttons)
d = 2;			// Buffer duration in seconds
x = Buffer.alloc(s, 44100 * d, 1, bufnum:1);	// Buffer 1 (X)
y = Buffer.alloc(s, 44100 * d, 1, bufnum:2);	// Buffer 2 (Y)
n = 0;			// Phisikalischer Audio Eingang (0 = Audio In 1)
t = 250;			// Threshold (Wii)

{ Out.ar(0, SoundIn.ar(1).dup) }.play;

// Synth Definitions
// Buffer Recorder
SynthDef(\bufRecorder,{ |out=0, buf=0, fade=0.1, level=1, xfade=0, run=1, vol=1|
	var in;
	in = SoundIn.ar(n, EnvGen.kr(
			Env.new([0,1,1,0], [fade, d-(fade*2), fade], 'linear'), doneAction: 2)
	) * vol;
	RecordBuf.ar(in, buf, 0, level, xfade, run);
}).store;

// Grain Player
SynthDef(\granulator,{ |out=0, buf=0, vol=2, atk=0.1, rel=3, gate=1, hor=0, ver=0, paning=0, rate=1|
	var trate, durR, clk, pos, pan, grains;
	trate = (ver * 145) + 5; //---between 1 and 120
	durR = 12 / trate;
	clk = Impulse.kr(trate);
	pos = hor + TRand.kr(0, 0.01, clk);
	pan = paning.lag(0.1) + WhiteNoise.kr(0.1);
	grains = TGrains.ar(4, clk, buf, rate.lag(0.1), pos, durR, pan);
	grains = grains * EnvGen.kr(
		Env.asr(atk, 1, rel, 1, 'exponential'), gate, doneAction:2
	) * vol;
	Out.ar(out, grains);
}).store;

// Reverb
SynthDef(\reverbz, { |in=0, out=0, revTime=3, mix=0.5, damp=0.9, cuthi=12000, cutlo=180, rel=3|
	var input, snd;
	input = In.ar(in, 2);
	snd = FreeVerb2.ar(input[0], input[1], mix, revTime, damp);
	snd = LPF.ar(snd, cuthi);
	snd = HPF.ar(snd, cutlo);
	ReplaceOut.ar(out, snd);
}).store;

// Ring Mod
SynthDef(\ringModz, { |in=0, out=0, ringFreq=88, ringAmp=0.9, rel=3|
	var input, snd;
	input = In.ar(in, 2);
	snd = input * SinOsc.ar(ringFreq, 0, ringAmp);
//	snd = snd * EnvGen.kr( Env.asr(0.1, 1, rel, 1, 'exponential'), gate, doneAction:2 );
	ReplaceOut.ar(out, snd);
}).store;

// Comb
SynthDef(\combz, { |in=0, out=0, maxdelay=5, delay=0.018, decay=0.35|
	var input, snd;
	input = In.ar(in, 2);
	snd = CombN.ar(input, maxdelay, delay, decay);
//	snd = snd * EnvGen.kr( Env.asr(0.1, 1, rel, 1, 'exponential'), gate, doneAction:2 );
	ReplaceOut.ar(out, snd);
}).store;

// Gamepad Init
GeneralHID.buildDeviceList;		// Build the Devices List
l = GeneralHID.deviceList;		// Assign it to "l"
GeneralHID.postDevices;			// Post available
a = GeneralHID.open( l[0] );	// Open the first one
GeneralHID.startEventLoop;		// Start the loop

/*
NOTE:  If your device is not the first one in the list, look for the desired device on the list and change l[x] being x the number of the device on the list (0 = 1th position)

Help code for debugging
a.caps; a.debug_( false );
*/

// Gamepad Functions
// back buttons right
a.slots[1].at( 6 ).action_({ |v|
	( v.value == 1 ).if( { Synth(\bufRecorder, [\buf, x.bufnum]) }; );
});

a.slots[1].at( 8 ).action_({ |v|
	( v.value == 1 ).if( { 	Synth(\bufRecorder, [\buf, y.bufnum]) }; );
});

// back buttons left
a.slots[1].at( 5 ).action_({ |v|
	( v.value == 1 ).if( { Synth(\bufRecorder, [\buf, x.bufnum]) }; );
});

a.slots[1].at( 7 ).action_({ |v|
	( v.value == 1 ).if( { 	Synth(\bufRecorder, [\buf, y.bufnum]) }; );
});

// analog left
a.slots[3].at( 48 ).action_({ |v|
		(q.grainX.isPlaying).if(
			{ q.grainX.set([\hor, (v.value)]) }
		);
});

a.slots[3].at( 49 ).action_({ |v|
		(q.grainX.isPlaying).if(
			{ q.grainX.set([\ver, (v.value)]) }
		);
});

a.slots[1].at( 11 ).action_({ |v|
	(v.value == 1).if {
		(q.grainX.isPlaying.not).if(
			{ q.grainX = Synth(\granulator, [\buf, x.bufnum]); q.grainX.register; "grain X ON".postln;},
			{ q.grainX.set(\gate, 0); "grain X OFF".postln; }
		);
	}
});

// analog right
a.slots[3].at( 50 ).action_({ |v|
		(q.grainY.isPlaying).if(
			{ q.grainY.set([\hor, (v.value)]) }
		);
});

a.slots[3].at( 53 ).action_({ |v|
		(q.grainY.isPlaying).if(
			{ q.grainY.set([\ver, (v.value)]) }
		);
});

a.slots[1].at( 12 ).action_({ |v|
	(v.value == 1).if {
		(q.grainY.isPlaying.not).if(
			{ q.grainY = Synth(\granulator, [\buf, y.bufnum]); q.grainY.register; "grain Y ON".postln; },
			{ q.grainY.set(\gate, 0); "grain Y OFF".postln; }
		);
	}
});

// Effects

// delay
// TASTE 1 >>> DEFEKT!
//a.slots[1].at( 1 ).action_({ |v|
//	(v.value == 1).if {}
//});

// reverb
a.slots[1].at( 2 ).action_({ |v|
	(v.value == 1).if {
		(q.reverb.isPlaying.not).if(
			{ q.reverb = Synth.tail(s, \reverbz);
			  q.reverb.register;
			  ("REVERB ON").postln;
			},
			{ q.reverb.free;
			  ("REVERB OFF").postln;
		});
	}
});


// ring mod
a.slots[1].at( 3 ).action_({ |v|
	(v.value == 1).if {
		(q.ringMod.isPlaying.not).if(
			{ q.ringMod = Synth.tail(s, \ringModz);
			  q.ringMod.register;
			  ("RING MOD ON").postln;
			},
			{ q.ringMod.free;
			  ("RING MOD OFF").postln;
		});
	}
});


// comb
a.slots[1].at( 4 ).action_({ |v|
	(v.value == 1).if {
		(q.comb.isPlaying.not).if(
			{ q.comb = Synth.tail(s, \combz);
			  q.comb.register;
			  ("COMB ON").postln;
			},
			{ q.comb.free;
			  ("COMB OFF").postln;
		});
	}
});


// Wii
// Left/Right (Panorama)
OSCresponder(nil, "/wii/acc", {arg time, resp, msg, add;
//	msg.postln  // msg[1] = left, right  // msg[3] = up, down  // msg[2] = fwd, rev
	(q.grainX.isPlaying).if(
		{
			q.grainX.set(\paning, (msg[1] / 127 - 1).round(0.01));
			q.grainX.set(\rate, (msg[3] - 25 / 127) );
		}
	);
	(q.grainY.isPlaying).if(
		{
			q.grainY.set(\paning, (msg[1] / 127 - 1).round(0.01));
			q.grainY.set(\rate, (msg[3] - 25 / 127) );

		}
	);
}).add;

 