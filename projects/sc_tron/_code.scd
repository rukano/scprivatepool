(
// NEEDS A MOVIE!!! AND SAMPLES!!!

var window = ();
var screen = ();
var movie = ();
var event = ();

p = ProxySpace.push(s);

// coords & measures
screen.h = Window.screenBounds.height;
screen.w = Window.screenBounds.width;

window.menuOffset = 32;
window.w = 640;
window.h = 288;
window.x = 0;
window.y = screen.h - window.h - window.menuOffset;

movie.x = 0;
movie.y = 0;
movie.w = window.w;
movie.h = window.h;
movie.completePath = Document.current.path.dirname +/+ "data/tron.mov";

// movie display
window.main = Window( "Movie Player", Rect(window.x, window.y, window.w, window.h) ).front;
movie.main = MovieView(window.main, Rect(movie.x, movie.y, movie.w, movie.h));
movie.main.path_(movie.completePath);
movie.main.muted_(true);

// controller window
window.controls = Window( "Controllers", Rect(window.w, window.y, window.w/3, window.h) ).front;
window.controls.view.background_(Color.black);

// spacer -- BIG BUTTON
window.bigButton = Button(window.controls, Rect(0,0,window.w/3, window.h))
	.states_([
		["PLAY", Color.green(0.8), Color.white]
	]);

// buttons actions
// start timer --- PLAY MOVIE
window.bigButton.action_({
	Tdef(\cueList).stop.fork;
	movie.main.start;
});

// MUSIC

// XML Quark alt
/*
DOMDocument(Document.current.path.dirname +/+ "data/tron.xml")
	.getElementsByTagName("markerlist").at(0)
	.getElementsByTagName("marker").collect({|element|
		element.getElementsByTagName("in").at(0)
		.getText.asInteger;
	});

*/

movie.xmlTimes = XMLTag(Document.current.path.dirname +/+ "data/tron.xml", "in").getTimes.relativeTime;
movie.xmlNames = XMLTag(Document.current.path.dirname +/+ "data/tron.xml", "name").getValues;
movie.xmlNames = movie.xmlNames.collect{ |string| string.asSymbol};
movie.list = [movie.xmlTimes, movie.xmlNames].flop;
event = Dictionary.new;
movie.xmlNames.do{ |key| event.add(key -> {  }) };

Tdef(\cueList, {
	var lastTime = 0;
	movie.list.do{ |cue, i|
		cue[0].wait;
		event[cue[1]].value;
		postf("CUE \t%\t-->\t\"%\"\n@ %\n\n", i, cue[1], cue[0]+lastTime);
		lastTime = lastTime + cue[0];
	}
});

s.latency = nil;

// TIMELINE FUNCTIONS
event['intro'] =  {
	// background computer noise
	~intro = {
		SinOsc.ar( SinOsc.kr(LFNoise2.kr(0.1).range(4,12)).range(60,100) ) *
		SinOsc.kr([1,2.33]*8.55).range(0, 0.1)
	};
	~intro.play;

	// prepare next event	
	~computerView = { |amp=0.01| amp *
		Pulse.ar(
			LFNoise0.kr([20,35]/2).range(0,24).midiratio.lag(0.01) * 2000
		) * 
		SetResetFF.ar(Dust.ar(20).dup, Dust.ar(40).dup).lag(0.1)
	};
	~computerView.play;
};
event['computerView'] =  {
	~computerView.set(\amp, 0.1);
	~computerTyping = { SinOsc.ar(990*LFNoise0.kr(12).range(1,2)).dup * Duty.kr(Dwhite(0.05, 0.1, inf), 0, Dseq([1,0], inf)) * 0.1 * LFPulse.kr(8)};
	~computerTyping.play;
	// BBEPS
	{ 7.wait; Task({ Synth(\beep, [\ton, 1.7654]); 0.1.wait; 3.do{ Synth(\beep); 0.25.wait; } }).play; }.fork;
};
event['talk'] =  {
	~computerView.set(\amp, 0.05);
	~computerTyping.clear;
	{ 0.5.wait; Synth(\vocoderA, [\buffer, q.talk1, \rate, 1.25]) }.fork;
	
};
event['laser'] =  {
	~computerView.set(\amp, 0.01);
	~laser = { |freq=120|
		SinOsc.ar(XLine.kr(16000,1,0.5) * ([1,1.1] + SinOsc.kr(120).range(80,300))) *
		SinOsc.kr(XLine.kr(12, [1.33, 2], 6), 0, 0.9, 0.1) *
		0.1
	};
	~laser.play;

};
event['dematerialize'] =  {
	Tdef(\laser, { loop { Synth(\laser); rrand(0.01, 0.3).wait } }).play(quant:nil);

};
event['absorbe'] =  {
	Tdef(\laser).stop;
	~absorve = {
	var line = XLine.kr(1,0.05,2);
	Splay.ar(
		RLPF.ar(
			Saw.ar([200,333,555,8548,12456,17643] * line, mul:0.1),
			5000 * line,
			0.5 * line
		)
	) };
	~absorve.play;
	
};
event['tripStart'] =  {
	~absorve.end(5);
	~computerView.end(2);
	~intro.end(2);
	~laser.end(2);

	// texture ---> trip start
	~texture.fadeTime = 3;
	~texture.play;
	~texture = { var num = 25; Splay.ar(
		SinOsc.ar(
			Array.rand(num, 20,600),
			Array.rand(num, 0, 2pi),
			LFNoise2.kr(Array.rand(num, 1, 10)).range(0,0.1))
	) };


};
event['newPlace'] =  {
	~texture.rebuild;

};
event['digitalEarth'] =  {
	~texture.rebuild;


};
event['tripEnd'] =  {
	~texture.rebuild;

};
event['materialize'] =  {
	~texture.end(1);
	~material.fadeTime = 2;
	~material.play;
	~material = {
		var line = XLine.kr(1, 0.025, 1);
		RLPF.ar(
			Pulse.ar( 2000 * line),
			2000 * line,
			0.25
		) * 0.1
	};
};
event['roomLights'] =  {
	~material.end(2);
	~lights.play;
	~lights = { SinOsc.ar(100 * Line.kr(1, (1, 2.01..15.5), 15)) * 0.05 };
};
event['handLights'] =  {
	~lights.end(1)
};
event['guardComes'] =  {

};
event['guardHits'] =  {

};
event['guardWalks'] =  {

};
event['mothership'] =  {

};
event['ctrlRoom'] =  {

};
event['lightJail'] =  {

};
event['pcSpeaks1'] =  {

};
event['xoSpeaks1'] =  {

};
event['pcSpeaks2'] =  {

};
event['xoSpeaks2'] =  {

};
event['pcSpeaks3'] =  {

};
event['xoSpeaks3'] =  {

};

event['xoGetsPwned'] =  {

};
event['drainEnergy'] =  {

};
event['end'] =  {

};

// BUFFERS

"_synths.scd".loadRelative;
"";
/*
a = XMLTag(Document.current.path.dirname +/+ "data/tron.xml", "name").getValues;
a.do{ |i| postf("\nevent['%'] =  {\n\n};", i) }*/

)