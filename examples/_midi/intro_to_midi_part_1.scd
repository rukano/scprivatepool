// take a sound and control it with midi CC
// easy mode

s.boot;

// sound with arguments
a = { |freq=220, amp=0.1| SinOsc.ar(freq).dup * amp  }.play;

// manually control the arguments
a.set(\freq, 440);
a.set(\amp, 0.5);

// create a MIDI CC responder to control something
// this should initialize the MIDI client if it isn't already initialized
// If you whish to do manually: MIDIClient.init

CCResponder({ |src, chan, cc, val|
	a.set(\freq, 220 + val)	;	// min freq: 220, max freq: (220+127)
// this should work with all the incoming MIDI controls
});

// clean the responders sou you dont get: FAILURE /n_set Node not found
CCResponder.removeAll;

// choose a specific controller for the freq and other for the amp
CCResponder({ |src, chan, cc, val|
	if(cc==1) { a.set(\freq, 220 + val) };	// CC 1 controls freq as above
	if(cc==2) { a.set(\amp, val/127) };		// CC 2 controls amp
	// scale 'val' as you wish
});

// another way to do the same:
CCResponder({ |src, chan, cc, val|
	switch(cc,
		1, { a.set(\freq, 220 + val) },
		2, { a.set(\amp, val/127) }
	)
});

// yet ANOTHER way to do the same (but needs 2 responders)
CCResponder({ |src, chan, cc, val|
	a.set(\freq, 220 + val);
}, nil, nil, 1, nil);	// you can also filter channels, ources, or even values

CCResponder({ |src, chan, cc, val|
	a.set(\amp, val/127)
}, nil, nil, 2, nil);


// Same thing in ProxySpace:
p = ProxySpace.push(s);
~aSound.play;
~aSound = { SinOsc.ar(\freq.kr(440)).dup * \amp.kr(0.1)  }; // i like this syntax

CCResponder({ |src, chan, cc, val|
	switch(cc,
		1, { ~aSound.set(\freq, 220 + val) },
		2, { ~aSound.set(\amp, val/127) }
	)
});

// lag the inputs to avoid clicks (cause of the midi values)

~aSound.fadeTime = 1;
~aSound = { SinOsc.ar(\freq.kr(440).lag(0.1)).dup * \amp.kr(0.1).lag(0.01)  };
~aSound = { Saw.ar(\freq.kr(440).lag(0.1)).dup * \amp.kr(0.1).lag(0.01)  };
~aSound = { Pulse.ar(\freq.kr(440).lag(0.1)).dup * \amp.kr(0.1).lag(0.01)  };
~aSound.end(3);	// end in 3 secs (i love proxy space)


// more info:
MIDIResponder.help
CCResponder.help
ProxySpace.help
