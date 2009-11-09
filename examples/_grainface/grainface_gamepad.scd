/*
Joystick + GUI controller
v0.5
by Juan A. Romero
(thanks to Patrick Borgeat & Henry Vega)
7. Oct. 2007
*/



(
//---GUI
var 	w, wide, high, cmd,
	b1, b2, b3, b4, b5, b6, b7, b8, b9, b10,
	c1, c2, c3, c4, c5, c6, c7, c8, c0,
	jL, jR, startB,
	big, sbig,
	t1, t2, t3, t4, t5, t6, t7, t8;

cmd=		{w.close};
wide=	600;			/*alto de la ventana*/
high=	400;			/*ancho de la ventana*/
big =	30;			/*ancho del boton*/
sbig =	150;			/*ancho del slider*/

w = 	SCWindow("gamepad", Rect(200, 800, wide, high));
w.front;
w.view.background = Color.blue(0.25);
w.onClose_({HIDDeviceService.stopEventLoop});

CmdPeriod.add(cmd);

t1 = SCTextField(w,Rect(10, 340, wide-20, 50));
t1.string =
"                       Joystick GUI controller for SuperCollider 3 v0.5
Press and hold SELECT/START to use analogue Sticks - Use the buttons to trigger other sounds
                  2007 - Juan A. Romero - Thanks to Henry Vega and Patrick Borgeat";
t1.font = Font("Monaco", 9);
t1.setProperty(\boxColor,Color.blue(0.25));
t1.setProperty(\stringColor,Color.gray(0.8));
t1.setProperty(\align, \left);

t2 = SCTextField(w,Rect((wide*0.5)-((wide/3)*0.5), 93, wide/3, 20));
t2.string =
"ACTIVE";
t2.setProperty(\boxColor,Color.blue(0.25));
t2.setProperty(\stringColor,Color.green);
t2.setProperty(\align, \center);
t2.font = Font("Helvetica", 12);

~cnt0 = 0!10;
~cnt1 = 0!10;

//----HID START----------------------------------------------------------------
HIDDeviceService.buildDeviceList;
HIDDeviceService.devices.do({arg dev;
	[dev.manufacturer, dev.product, dev.vendorID, dev.productID, dev.locID].postln;
	dev.elements.do({arg ele;
		[ele.type, ele.usage, ele.cookie, ele.min, ele.max]; //.postln
		});
	});
HIDDeviceService.devices.at(0).queueDevice;
HIDDeviceService.action_({arg productID, vendorID, locID, cookie, val;
//	[cookie, val].postln;
//----Assign Contollers to buttons---------------------------------------------
	(cookie == 5).if({{b1.valueAction_(1-val);}.defer});//...button1....
	(cookie == 6).if({{b2.valueAction_(1-val);}.defer});//...button2....
	(cookie == 7).if({{b3.valueAction_(1-val);}.defer});//...button3....
	(cookie == 8).if({{b4.valueAction_(1-val);}.defer});//...button4....
	(cookie == 9).if({{b5.valueAction_(1-val);}.defer});//...button5....
	(cookie == 10).if({{b6.valueAction_(1-val);}.defer});//...button6....
	(cookie == 11).if({{b7.valueAction_(1-val);}.defer});//...button7....
	(cookie == 12).if({{b8.valueAction_(1-val);}.defer});//...button8....
	(cookie == 13).if({
		{~cnt0 = ~cnt0 + 1; b9.valueAction_(~cnt0[3].value%2)}.defer;
		});//...button9....
	(cookie == 14).if({
		{~cnt1 = ~cnt1 + 1; b10.valueAction_(~cnt1[3].value%2)}.defer;
		});//...button10....
//....Wite Analog Joystick Funktions here --- GUI only for checking purposes
	(cookie == 18).if({
		{jL.x_((255-val)/255);}.defer;
		~jLsynth.set(\freq, val*8);
	};);//...JstickL-X....
	(cookie == 19).if({
		{jL.y_((val)/255);}.defer;
		~jLsynth.set(\fmfreq, val*8);
	};);//...JstickL-Y....
	(cookie == 20).if({
		{jR.x_((255-val)/255);}.defer;	//....GUI
		~jRsynth.set(\fmfreq, val*4);
	};);//...JstickR-X....
	(cookie == 21).if({
		{jR.y_((val)/255);}.defer; 		//...GUI
		~jRsynth.set(\freq, val*4);
	};);//...JstickR-Y....
	(cookie == 22).if({("cross:"++val);
		if(val == -1,	//--CENTER
			{{c0.valueAction_(1.value);}.defer},
			{{c0.valueAction_(0.value);}.defer});
		if(val == 7, //---UP
			{{c1.valueAction_(1.value);}.defer},
			{{c1.valueAction_(0.value);}.defer});
		if(val == 0, //---UP/LEFT
			{{c2.valueAction_(1.value);}.defer},
			{{c2.valueAction_(0.value);}.defer});
		if(val == 1, //---LEFT
			{{c3.valueAction_(1.value);}.defer},
			{{c3.valueAction_(0.value);}.defer});
		if(val == 2, //---DOWN/LEFT
			{{c4.valueAction_(1.value);}.defer},
			{{c4.valueAction_(0.value);}.defer});
		if(val == 3, //---DOWN
			{{c5.valueAction_(1.value);}.defer},
			{{c5.valueAction_(0.value);}.defer});
		if(val == 4, //---DOWN/RIGHT
			{{c6.valueAction_(1.value);}.defer},
			{{c6.valueAction_(0.value);}.defer});
		if(val == 5, //---RIGHT
			{{c7.valueAction_(1.value);}.defer},
			{{c7.valueAction_(0.value);}.defer});
		if(val == 6, //---UP/RIGHT
			{{c8.valueAction_(1.value);}.defer},
			{{c8.valueAction_(0.value);}.defer});
		});//...CROSS....

	});

HIDDeviceService.runEventLoop;
			
//~netA = NetAddr("169.254.23.126", 57140);	//...PATRICK
//~netA.sendMsg('/juan', (44.rand).postln)
//CmdPeriod.add({OSCresponder.removeAddr(s.addr);~osc.value(action:1);});

//-----------------------------------------------------------------------------
//-----BUTTONS-----------------------------------------------------------------
//-----------------------------------------------------------------------------

	startB = SCButton (w, Rect((wide/2)-((wide/3)*0.5), 10, wide/3, wide/8));
	startB.states = [	["STOP", Color.white, Color.red(0.2)],
					["RUN", Color.white, Color.blue(0.25)]
					];
	startB.font = Font("Helvetica-Bold", 50);

//---ABXY
	b1 = SCButton (w, Rect(480, 190, big, big));
	b1.states = [	["A", Color.white, Color.blue(0.7)],
				["A", Color.black, Color.red]
					];
	b2 = SCButton (w, Rect(520, 230, big, big));
	b2.states = [	["B", Color.white, Color.blue(0.7)],
				["B", Color.black, Color.red]
					];
	b3 = SCButton (w, Rect(560, 190, big, big));
	b3.states = [	["Y", Color.white, Color.blue(0.7)],
				["Y", Color.black, Color.red]
					];
	b4 = SCButton (w, Rect(520, 150, big, big));
	b4.states = [	["X", Color.white, Color.blue(0.7)],
				["X", Color.black, Color.red]
					];					
//---LR+LLRR
	b5 = SCButton (w, Rect(10, 60, big*3+20, big-5));
	b5.states = [	["L", Color.white, Color.blue(0.6)],
				["L", Color.black, Color.red]
					];
	b6 = SCButton (w, Rect(480, 60, big*3+20, big-5));
	b6.states = [	["R", Color.white, Color.blue(0.6)],
				["R", Color.black, Color.red]
					];
	b7 = SCButton (w, Rect(10, 10, big*3+20, big+10));
	b7.states = [	["LL", Color.white, Color.blue(0.5)],
				["LL", Color.black, Color.red]
					];
	b8 = SCButton (w, Rect(480, 10, big*3+20, big+10));
	b8.states = [	["RR", Color.white, Color.blue(0.5)],
				["RR", Color.black, Color.red]
					];
					
//---SELECT+START
	b9 = SCButton (w, Rect((wide/2)-(big*2)-10, 120, big*2, big-10));
	b9.states = [		["SELECT", Color.white, Color.blue(0.2)],
					["SELECT", Color.black, Color.red]
					];
	b10 = SCButton (w, Rect((wide/2)+10, 120, big*2, big-10));
	b10.states = [	["START", Color.white, Color.blue(0.2)],
					["START", Color.black, Color.red]
					];
//---CROSS
	c0 = SCButton (w, Rect(10+big+10, 190, big, big));
	c0.states = [	["o", Color.white, Color.blue(0.15)],
				["o", Color.black, Color.black]
					];
//....UP
	c1 = SCButton (w, Rect(10+big+10, 150, big, big));
	c1.states = [	["u", Color.white, Color.blue(0.6)],
				["u", Color.black, Color.red]
					];
//....UP/LEFT
	c2 = SCButton (w, Rect(10, 150, big, big));
	c2.states = [	["ul", Color.white, Color.blue(0.6)],
				["ul", Color.black, Color.red]
					];
//....LEFT
	c3 = SCButton (w, Rect(10, 150+10+big, big, big));
	c3.states = [	["l", Color.white, Color.blue(0.6)],
				["l", Color.black, Color.red]
					];
//....DOWN/LEFT
	c4 = SCButton (w, Rect(10, 150+10+big+10+big, big, big));
	c4.states = [	["dl", Color.white, Color.blue(0.6)],
				["dl", Color.black, Color.red]
					];
					
//....DOWN
	c5 = SCButton (w, Rect(10+big+10, 150+10+big+10+big, big, big));
	c5.states = [	["d", Color.white, Color.blue(0.6)],
				["d", Color.black, Color.red]
					];

//....DOWN/RIGHT
	c6 = SCButton (w, Rect(10+big+10+big+10, 150+10+big+10+big, big, big));
	c6.states = [	["dr", Color.white, Color.blue(0.6)],
				["dr", Color.black, Color.red]
					];

//....RIGHT
	c7 = SCButton (w, Rect(10+big+10+big+10, 150+10+big, big, big));
	c7.states = [	["r", Color.white, Color.blue(0.6)],
				["r", Color.black, Color.red]
					];
//....UP/RIGHT
	c8 = SCButton (w, Rect(10+big+10+big+10, 150, big, big));
	c8.states = [	["ur", Color.white, Color.blue(0.6)],
				["ur", Color.black, Color.red]
					];
//---ANALOG JOYSTICKS
	jL = SC2DSlider(w, Rect((wide*0.5)-(sbig)-5, 170, sbig, sbig))
			.x_(0.5).y_(0.5);
	jR = SC2DSlider(w, Rect((wide/2)+5, 170, sbig, sbig))
			.x_(0.5).y_(0.5);

//-----------------------------------------------------------------------------
//-----ACTIONS-----------------------------------------------------------------
//-----------------------------------------------------------------------------
//..........StartJoystick!
	startB.action = { |view| 
		if (view.value == 0) {HIDDeviceService.runEventLoop;
t2.string =
"ACTIVE";
t2.setProperty(\stringColor,Color.green);
		};
		if (view.value == 1) {HIDDeviceService.stopEventLoop;
t2.string =
"DON'T TOUCH ANY BUTTONS";
t2.setProperty(\stringColor,Color.red);
		};
	};

//-----------------------------------------------------------------------------
//-----SYNTHS-----------------------------------------------------------------
//-----------------------------------------------------------------------------

~pingA2 = Pseq(([60, 55]+24).midicps, inf).asStream;
~pingA3 = Pseq(([60, 55, 48]+24).midicps, inf).asStream;
~pingB2 = Pseq(([60, 55]).midicps, inf).asStream;
~pingB3 = Pseq(([60, 55, 48]).midicps, inf).asStream;
~bDrumP = Pseq([1,0,0,0, 1,0,0,0, 1,0,0,0, 1,1,0,1], inf).asStream;
~sDrumP = Pseq([0,0,1,0, 0,0,1,1, 0,0,1,0, 0,0,1,0], inf).asStream;


//.......PulseSynth
SynthDef(\pulseA, {|out=0, freq=200, dur=0.5, atk=0.001, pwid=0.25, pan=0, vel=0.25|
		var sal;
		sal = Pulse.ar(freq, pwid, vel);
		sal = EnvGen.ar(Env.perc(atk, dur, 1, -8), doneAction:2) * sal;
		sal = Pan2.ar(sal, pan);
	Out.ar(out, sal*0.25)}).send(s);

SynthDef(\pulseB, {|out=0, freq=200, dur=0.5, atk=0.001, pwid=0.5, pan=0, vel=0.25|
		var sal;
		sal = Pulse.ar(freq, pwid, vel);
		sal = EnvGen.ar(Env.perc(atk, dur, 1, -8), doneAction:2) * sal;
		sal = Pan2.ar(sal, pan);
	Out.ar(out, sal*0.25)}).send(s);
//........Drums
SynthDef(\bDrum, {|out=0, rq=1, freq=100, dur=0.2, atk=0.001, pan=0, vel=1, gate=0|
		var sal;
		sal = SinOsc.ar(Line.kr(freq, freq/2, dur), 0, vel);
		sal = sal + BPF.ar(PinkNoise.ar, freq, rq);
		sal = EnvGen.ar(Env.perc(atk, dur, 1, -4), gate, doneAction:2) * sal;
		sal = Pan2.ar(sal, pan);
	Out.ar(out, sal*0.35)}).send(s);

SynthDef(\sDrum, {|out=0, freq=800, rq=10, dur=0.4, atk=0.001, curve=(-8), pan=0, vel=1, gate=0|
		var sal;
		sal = WhiteNoise.ar(vel);
		sal = BPF.ar(sal, freq, rq);
		sal = EnvGen.ar(Env.perc(atk, dur, 1, curve), gate, doneAction:2) * sal;
		sal = Pan2.ar(sal, pan);
	Out.ar(out, sal*0.25)}).send(s);
//.......Bells
SynthDef(\bellA, {|out=0, freq=440, fmfreq=50, fmamp=100, amf=50, amd=0.5,pan=0, atk=0.1, dur=1|
		var sal, mod;
		mod = SinOsc.kr(fmfreq, 0, fmamp, freq);
		sal = SinOsc.ar(mod);
		sal = sal * SinOsc.kr(amf, 0, amd, 0.5);
		sal = sal * EnvGen.ar(Env.perc(atk, dur, 1, 1), doneAction:2);
		sal = Pan2.ar(sal, pan);
	Out.ar(out, sal*0.05)}).send(s);
//......JoySynths
SynthDef(\joyL, {|out=0, freq=440, fmfreq=50, fmamp=100, amf=50, amd=0.5,pan=0, atk=0.1, dur=1|
		var sal, mod;
		mod = SinOsc.kr(fmfreq, 0, fmamp, freq);
		sal = SinOsc.ar(mod);
		sal = sal * SinOsc.kr(amf, 0, amd, 0.5);
//		sal = sal * EnvGen.ar(Env.perc(atk, dur, 1, 1), doneAction:2);
		sal = Pan2.ar(sal, pan);
	Out.ar(out, sal*0.05)}).send(s);
	
SynthDef(\joyR, {|out=0, freq=440, fmfreq=50, fmamp=100, amf=50, amd=0.5,pan=0, atk=0.1, dur=1|
		var sal, mod;
		mod = SinOsc.kr(fmfreq, 0, fmamp, freq);
		sal = SinOsc.ar(mod);
		sal = sal * SinOsc.kr(amf, 0, amd, 0.5);
//		sal = sal * EnvGen.ar(Env.perc(atk, dur, 1, 1), doneAction:2);
		sal = Pan2.ar(sal, pan);
	Out.ar(out, sal*0.05)}).send(s);

/*
Synth(\joyA)
*/

//-------------------------------------------------------------------------
//----Buttons Actions------------------------------------------------------
//-------------------------------------------------------------------------

//---ABXY
	b1.action = { |view|
		if (view.value == 1) {
//				Synth(\bDrum, [\gate, 1]);
				Synth(\pulseA, [\freq, (60-24).midicps]);
		};
		if (view.value == 0) {
				Synth(\pulseA, [\freq, (60-12).midicps])
		};
	};

	b2.action = { |view|
		if (view.value == 1) {
//				Synth(\bDrum, [\gate, 1]);
				Synth(\pulseA, [\freq, (63-24).midicps]);
		};
		if (view.value == 0) {
				Synth(\pulseA, [\freq, (63-12).midicps])
		};
	};

	b3.action = { |view|
		if (view.value == 1) {
//				Synth(\bDrum, [\gate, 1]);
				Synth(\pulseA, [\freq, (56-24).midicps]);
		};
		if (view.value == 0) {
				Synth(\pulseA, [\freq, (56-12).midicps])
		};
	};

	b4.action = { |view|
		if (view.value == 1) {
//				Synth(\bDrum, [\gate, 1]);
				Synth(\pulseA, [\freq, (55-24).midicps]);
		};
		if (view.value == 0) {
				Synth(\pulseA, [\freq, (55-12).midicps])
		};
	};

//---LR+LLRR

	b5.action = { |view|
		if (view.value == 1) {
				Synth(\bDrum, [\gate, 1]);
//				Synth(\pulseB, [\freq, ~pingA2.next]);
		};
		if (view.value == 0) {nil};
	};

	b6.action = { |view|
		if (view.value == 1) {
//				Synth(\sDrum, [\gate, 1]);
				Synth(\pulseB, [\freq, ~pingB2.next]);
		};
		if (view.value == 0) {nil};
	};

	b7.action = { |view|
		if (view.value == 1) {
				Synth(\sDrum, [\gate, 1]);
//				Synth(\bDrum, [\gate, 1]);
//				Synth(\pulseB, [\freq, ~pingA3.next]);
		};
		if (view.value == 0) {nil};
	};

	b8.action = { |view|
		if (view.value == 1) {
//				Synth(\sDrum, [\gate, 1]);
				Synth(\pulseB, [\freq, ~pingB3.next]);
		};
		if (view.value == 0) {nil};
	};

//---SELECT+START

	b9.action = { |view|
		if (view.value == 1) {~jLsynth = Synth(\joyL)};
		if (view.value == 0) {~jLsynth.free};
	};

	b10.action = { |view|
		if (view.value == 1) {~jRsynth = Synth(\joyR)};
		if (view.value == 0) {~jRsynth.free};	};


/*
	b9.action = { |view|
		if (view.value == 1) {
			Synth(\bDrum, [\gate, 1])
		};
		if (view.value == 0) {nil};
	};

	b10.action = { |view|
		if (view.value == 1) {
			Synth(\sDrum, [\gate, 1])
		};
		if (view.value == 0) {nil};
	};

*/
/*
//.....Routine-Start+Stop
	b9.action = { |view|
		if (view.value == 1) {~seq = 
			Routine({loop({play({
			Synth(\bDrum, [\gate, ~bDrumP.next]);
			Synth(\sDrum, [\gate, ~sDrumP.next]);
				});(0.25).wait
			})}).play
		};
		if (view.value == 0) {nil};
	};

	b10.action = { |view|
		if (view.value == 1) {~seq.stop};
		if (view.value == 0) {nil};
	};

*///---CROSS

	c0.action = { |view|
		if (view.value == 1) {nil};
		if (view.value == 0) {nil};
	};

	c1.action = { |view|
		if (view.value == 1) {x =
			Synth(\bellA, [\freq, rrand(700.0, 800.0),
						\fmfreq, rrand(10.0, 100.0),
						\fmamp, rrand(5.0, 400.0),
						\dur, rrand(0.5, 3.0),
						\amf, rrand(10.0, 100.0),
						\amd, rrand(0.01, 0.45)])
		};
		if (view.value == 0) {nil};
	};

	c2.action = { |view|
		if (view.value == 1) {x =
			Synth(\bellA, [\freq, rrand(800.0, 1000.0),
						\fmfreq, rrand(10.0, 100.0),
						\fmamp, rrand(5.0, 400.0),
						\dur, rrand(0.5, 3.0),
						\amf, rrand(10.0, 100.0),
						\amd, rrand(0.01, 0.45)])		};
		if (view.value == 0) {nil};
	};

	c3.action = { |view|
		if (view.value == 1) {x =
			Synth(\bellA, [\freq, rrand(1000.0, 1500.0),
						\fmfreq, rrand(10.0, 100.0),
						\fmamp, rrand(5.0, 400.0),
						\dur, rrand(0.5, 3.0),
						\amf, rrand(10.0, 100.0),
						\amd, rrand(0.01, 0.45)])		};
		if (view.value == 0) {nil};
	};
	
	c4.action = { |view|
		if (view.value == 1) {x =
			Synth(\bellA, [\freq, rrand(1500.0, 2500.0),
						\fmfreq, rrand(10.0, 100.0),
						\fmamp, rrand(5.0, 400.0),
						\dur, rrand(0.5, 3.0),
						\amf, rrand(10.0, 100.0),
						\amd, rrand(0.01, 0.45)])		};
		if (view.value == 0) {nil};
	};

	c5.action = { |view|
		if (view.value == 1) {x =
			Synth(\bellA, [\freq, rrand(2500.0, 5000),
						\fmfreq, rrand(10.0, 100.0),
						\fmamp, rrand(50.0, 1000.0),
						\dur, rrand(0.5, 3.0),
						\amf, rrand(10.0, 100.0),
						\amd, rrand(0.01, 0.45)])		};
		if (view.value == 0) {nil};
	};
	
	c6.action = { |view|
		if (view.value == 1) {x =
			Synth(\bellA, [\freq, rrand(5000.0, 8000.0),
						\fmfreq, rrand(10.0, 100.0),
						\fmamp, rrand(50.0, 1000.0),
						\dur, rrand(0.5, 3.0),
						\amf, rrand(10.0, 100.0),
						\amd, rrand(0.01, 0.45)])		};
		if (view.value == 0) {nil};
	};
	
	c7.action = { |view|
		if (view.value == 1) {x =
			Synth(\bellA, [\freq, rrand(8000.0, 12000.0),
						\fmfreq, rrand(10.0, 100.0),
						\fmamp, rrand(500.0, 2000.0),
						\dur, rrand(0.5, 3.0),
						\amf, rrand(10.0, 100.0),
						\amd, rrand(0.01, 0.45)])		};
		if (view.value == 0) {nil};
	};	

	c8.action = { |view|
		if (view.value == 1) {x =
			Synth(\bellA, [\freq, rrand(12000.0, 20000.0),
						\fmfreq, rrand(10.0, 100.0),
						\fmamp, rrand(500.0, 2000.0),
						\dur, rrand(0.5, 3.0),
						\amf, rrand(10.0, 100.0),
						\amd, rrand(0.01, 0.45)])		};
		if (view.value == 0) {nil};
	};	
	
//---Define Joystic Actions/funcions in the Joystick init	

/*//.......................primo power
	~cnt9 = 0!10;
		\1 -> {	{~cnt0 = ~cnt0 + 1; bNoise.valueAction_(~cnt0[3].value%2)}.defer; },
//.......................end power*/

)

/*

TO-DO

****Joysticks verbinden (GUI -> synth control?)
	-> Maybe SEL + STR to start a synth for each analog
****Scene change - Mode button?
				SEL (-) und START (+) ?  change global variables
****OSC sends
****MIDI out






*/

