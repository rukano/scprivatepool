p = ProxySpace.push(s)

// a trigger generator and a trigger sender
~imp = { Impulse.kr(8) }
~send = { SendTrig.kr(~imp, 1) } 

// a sound with a t_trig argument input
~sound.play
~sound = { SinOsc.ar((\note.kr(60)).midicps * [1,2]) * EnvGen.kr(Env.perc(0, 0.25), \t_trig.kr(1)) * \amp.kr(0.1) }

// set the responder to do something when it becomes the trigger (SendTrig.help)
(
OSCresponder(nil, '/tr', {
	~sound.set(\note, rrand(50,80), \t_trig, 1);
}).add
)

// change the responder on the go
(
OSCresponder(nil, '/tr', {
	0.5.coin.if { ~sound.set(\note, rrand(50,80), \t_trig, 1); };
	
}).add
)

// make an external array with important values
// so you can acces it from all the responders if necessary
q = ()
q.note = [60,65,68,72]

(
var notecounter = 0;	// our counter
OSCresponder(nil, '/tr', {
	0.5.coin.if {		// 0.5.coin 50% chance to be true
		~sound.set(
			\note, q.note @@ notecounter,	// same as q.note.wrapAt(notecounter)
			\t_trig, 1					// and trigger it
		);
		notecounter = notecounter + 1		// counter function
	};
}).add
)

// another array for a sequence
q.rhythm = [1,1,1,1,0,0,0,1]

(
var rhythmcounter = 0;		// same procedure...
var count = 0;
OSCresponder(nil, '/tr', {
	rhythmcounter = rhythmcounter + 1;
	(q.rhythm @@ rhythmcounter).coin.if {
		~sound.set(
			\note, q.note @@ count,
			\t_trig, 1
		);
		count = count +1
	};
}).add
)


// now change the arrays esternally without having to touch the functions or nodes
q.rhythm = [1,1,1,1,0,0,0,1,0,1,1,0,1,1,1,1,0]
q.note = [60,65,68,72,53,54,68,89,100,68]
q.note = (40,43..80)
q.note = (40,43..80).mirror2
q.rhythm = { 2.rand }!20






