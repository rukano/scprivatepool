// initialize MIDI
// if you intend to make a loopback MIDI, turn on your IAC Driver

MIDIClient.init;

(
// build me a midi keyboard (unicode as notes)

var midi = MIDIOut(0);	
var midiKey, reihe, tasten, tastenFunc;
var button=30, hoch=button*4, breit=button*9 ;
s.latency = 0;

midiKey = Window.new("MIDI Tastatur",
	Rect(
		(SCWindow.screenBounds.width/2) - (breit/2),
		(SCWindow.screenBounds.height/2) - (hoch/2),
		breit,
		hoch
	),
	border:false
);
midiKey.view.background = Color.black;
midiKey.addFlowLayout( 0@0, 0@0);
midiKey.front;


tasten = (nil!9)!4;
tastenFunc = Dictionary.new;
reihe = ["123456789","qwertzuio","asdfghjkl","yxcvbnm,."];	
reihe.do{ |reiheString, reiheIndex|
	reiheString.do{ |reiheChar, i|
		tasten[reiheIndex][i] = Button(midiKey, Rect(0, 0, button, button));
		tasten[reiheIndex][i]
			.states_([
				[ reiheChar.asString, Color.gray(0.3), Color.gray(0.1)],
				[ reiheChar.asString, Color.white, Color.gray(0.5)]
			];)
			.font_(Font("Bank Gothic", 20));
			
		tastenFunc.add(reiheChar.asSymbol -> { |val| tasten[reiheIndex][i].value_(val) })
	};
};

midiKey.view.keyDownAction_({ |view, key, mod, uni|
//	[view, key, mod, uni].postln;
//	midi.noteOn(1, uni, 100);		// uncomment for MIDI Note On
	tastenFunc[key.asSymbol].value(1)
});
midiKey.view.keyUpAction_({ |view, key, mod, uni|
//	[view, key, mod, uni].postln;
//	midi.noteOff(1, uni, 100);		// uncomment for MIDI Note Off
	tastenFunc[key.asSymbol].value(0)

});

CmdPeriod.add({midiKey.close})

);

(

// get the midi In

SynthDef(\hallo, {|out, gate=1, amp=0.1, freq=400|
	var snd = SinOsc.ar(freq).dup;
	snd = snd * EnvGen.ar(Env.asr(0.1, 1, 0.5), gate, doneAction:2);
	OffsetOut.ar(out, snd * amp)
}).store;

a = ();

MIDIIn.connect;
MIDIIn.noteOn = {arg src, chan, num, vel;
	(a[num].isPlaying.not).if ({ 
		a[num] = Synth(\hallo, [\freq, num.midicps]);
		a[num].register;
	})
};

MIDIIn.noteOff = { arg src,chan,num,vel;
	a[num].set(\gate, 0);
};


);


