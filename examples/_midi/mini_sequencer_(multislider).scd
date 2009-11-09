var size;
SynthDef(\sine, { |out, freq=440, amp=0.1, attack=0.01, sustain=1, pan|
	var snd;
	snd = FSinOsc.ar(freq);
	snd = snd * EnvGen.ar(Env.perc(attack, sustain), doneAction:2);
	snd = Pan2.ar(snd, pan);
	OffsetOut.ar(out, snd * amp);
}).store;

size = 32;
c = Array.fill(size, { 24.rand });
a = SCWindow("sequencer", Rect(200 , 450, 10 + (size * 17), 10 + (size * 10) + 200));
b = SCMultiSliderView(a, Rect(5, 5, size * 17, size * 10));
b.action = { |slider| 
	c.put(slider.index, (slider.currentvalue * 24).round );
};
a.front;
b.value_(c/24);
b.isFilled = false;
b.gap = 5;
b.thumbSize_(12);
b.strokeColor_(Color.blue);
b.fillColor_(Color.grey);
b.showIndex = true;
////////////////////////////////
Tdef(\seq, {
	1000.do { |i|
		i = i%32;
		{ b.index_(i) }.defer;
		( instrument: \sine, degree: c[i].value, amp: 0.5.rand * (1-i%8/8) * 0.1 ).play;
		0.25.wait;
	}
}).play;
CmdPeriod.add({a.close});