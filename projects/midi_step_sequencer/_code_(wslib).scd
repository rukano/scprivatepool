(
// TODOS
// send MIDI CHANNEL!!!
// load array / save array

// load synths
("_synths.scd").loadRelative;

// global stuff
~screen = ();
~screen.width = Window.screenBounds.width;
~screen.height = Window.screenBounds.height;

~numRows = 12*2;
~numCols = 4*16;
~pointSize = 20;

// layout
~layout = ();
~layout.width = ~numCols * ~pointSize;
~layout.height = ~numRows * ~pointSize;
~layout.centerPoint = (
	( (~screen.width/2) - (~layout.width/2) ) @		// in point X
	( (~screen.height/2) - (~layout.height/2));		// in point Y
);
~layout.button = ((~layout.width/~numCols)@(~layout.height/~numRows));
~layout.center = Rect( 0, 0, ~layout.width, ~layout.height + (~layout.button.y+10));


// make win
~window = Window("MATRIX", ~layout.center, resizable:false, border:true).front;
~window.userCanClose_(false);
~window.view.background_(Color.gray(0.5));
//~window.view.background_(Color.white);
~decorator = ~window.addFlowLayout(0@0, 0@0);

// make arrays
~matrix = Array2D.new(~numRows, ~numCols);
~buttonMatrix = Array2D.new(~numRows, ~numCols);

// makeLEDS

~leds = ~numCols.collect{ |i|
		Button(~window, Rect(0, 0, ~layout.button.x, ~layout.button.y))
//			.extrude_( true )
//			.border_( 3 )
//			.moveWhenPressed_( 0 )
//			.inverse_( true )
			.states_([
				["", Color.black, Color.grey],
				["", Color.black, Color.green(0.7)]
			])
};

// separate LEDS from matrix

/**********************Separator************************/
StaticText(~window, ~layout.width@10);
/*******************************************************/

// makebuttons
~buttonMatrix.rowsDo{ |row, rowCount|
	row.do{ |item, i|
		~matrix.put(rowCount, i, 0);	// init matrix with 0s
		~buttonMatrix.put(rowCount, i, RoundButton(~window, Rect(0, 0, ~layout.button.x, ~layout.button.y))
			.extrude_( false )
			.border_( 0 )
			.moveWhenPressed_( 0 )
			.states_([
				["", Color.black, Color.white],
				["", Color.white, Color.black]
			])
			.action_({ |v|
				~matrix.put(rowCount, i, v.value);
			});
		)
	};
};

/*********************************************************/
/***********************DEFAULTS**************************/
/*********************************************************/

~synthName = \ping;
~scale = nil;
~octave = 4;
~root = 0;
~transp = 0;
~sustain = 0.2;
~amp = 0.1;
// ~scale = Scale.choose(7, 12).tuning_(Tuning.choose(12).postln);

/*********************************************************/
/*************************PLAYER**************************/
/*********************************************************/

~player = Task({
	inf.do{ |counter|
		var col = counter % ~numCols;
		
		// main func
		~matrix.colAt(col).do{ |item, pos|
			var ipos = (pos - (~numRows-1)).abs;

			if(item != 0){ 
				if(~sendType == 0){
					(
						instrument:	~synthName,
						scale:		~scale,
						amp:			~amp,
						sustain:		~sustain,
						octave:		~octave,
						root:		~root,
						ctranspose:	~transp,
						degree:		ipos
					).play;
				};
				if(~sendType == 1){
					(
						type:		\midi,
						midiout:		~midiDevice,
						scale:		~scale,
						amp:			~amp,
						sustain:		~sustain,
						octave:		~octave,
						root:		~root,
						ctranspose:	~transp,
						degree:		ipos
					).play;
				};
				if(~sendType == 2){
					(
						instrument:	~synthName,
						scale:		~scale,
						amp:			~amp,
						sustain:		~sustain,
						octave:		~octave,
						root:		~root,
						ctranspose:	~transp,
						degree:		ipos
					).play;

					(
						type:		\midi,
						midiout:		~midiDevice,
						scale:		~scale,
						amp:			~amp,
						sustain:		~sustain,
						octave:		~octave,
						root:		~root,
						ctranspose:	~transp,
						degree:		ipos
					).play;
					
				};
				
			};
		};

		// LED func
		
		if(col != 0){
			{
				~leds[col].value_(1);	// turn on actual
				~leds[col-1].value_(0);	// turn off last
			}.defer;
			
		}{
			{
				~leds[col].value_(1);
				~leds.last.value_(0);
			}.defer;
		};

		0.25.wait;		// quarter notes
	}
});


/***********************************************************/
/*********************CONTROL WIN***************************/
/***********************************************************/

~control = ();
~control.width = 1024;
~control.height = 200;

~control.window = Window("CONTROLS", Rect(
	0,
//	(~screen.width/2) - (~control.width/2),
	(~screen.height - ~control.height - 22),
	~control.width,
	~control.height),
	border:false
).front;
~control.window.userCanClose_(false);

~controlView = ~control.window.addFlowLayout(10@10, 10@0);

~control.button = ();
~control.button.width = 110;
~control.button.height = 20;
~control.button.dim = (~control.button.width@~control.button.height);

// LABELS
["SCALE", "TUNING", "SYNTH", "ROOT", "OCTAVE", "TRANSP"].do{ |label|
	StaticText(~control.window, ~control.button.dim)
		.align_(\center)
		.string_(label);
};

StaticText(~control.window, (~control.button.dim.x*2.2)@(~control.button.dim.y))
	.align_(\center)
	.string_("TEMPO");



// scale
~control.chooseScale = PopUpMenu(~control.window, ~control.button.dim)
	.items_(ScaleInfo.scales.keys.asArray.sort)
	.action_({|menu|
		~scale = ScaleInfo.at(menu.item);
		postf("\t*** Using scale: ---> %\n", menu.item.asString);
	});
~control.chooseScale.valueAction_(0);

// tuning
~control.chooseTuning = PopUpMenu(~control.window, ~control.button.dim)
	.items_(TuningInfo.tunings.keys.asArray.sort)
	.action_({|menu|
		~scale.tuning_(menu.item);
		postf("\t*** Using tuning: ---> %\n", menu.item.asString);
	});
~control.chooseScale.valueAction_(0);

// synth
~control.chooseSynth = PopUpMenu(~control.window, ~control.button.dim)
	.items_(~synthList)
	.action_({|menu|
		~synthName = menu.item;
		postf("\t*** Using synth: ---> %\n", menu.item.asString);
	});

// root
EZSlider(~control.window, ~control.button.dim, controlSpec: [0,24, \linear, 1].asSpec, initVal: ~root, numberWidth:18, gap:0@0)
	.action_({ |v|
		~root = v.value;
	});


// octave
EZSlider(~control.window, ~control.button.dim, controlSpec: [1,8, \linear, 1].asSpec, initVal: ~octave, numberWidth:12, gap:0@0)
	.action_({ |v|
		~octave = v.value;
	});

// transpose
EZSlider(~control.window, ~control.button.dim, controlSpec: [-24,24, \linear, 1].asSpec, initVal: ~transp, numberWidth:22, gap:0@0)
	.action_({ |v|
		~transp = v.value;
	});


// tempo
EZSlider(~control.window,
	~control.button.dim.x * 2.3 @ ~control.button.dim.y,
	controlSpec: [40, 240, \linear, 0.1].asSpec, initVal: 60, numberWidth:35, gap:0@0)
	.action_({ |v|
		TempoClock.default.tempo_( v.value / 60);
	})
	.valueAction_(60);

/**********************Separator************************/
StaticText(~control.window, ~control.width@10);
/*******************************************************/

// random scale
RoundButton(~control.window, ~control.button.dim)
	.states_([["rand scale", Color.white, Color.magenta(0.5)]])
	.action_({
		~control.chooseScale.valueAction_(
			~control.chooseScale.items.indexOf(~control.chooseScale.items.choose)
		);
	});

// random tuning
RoundButton(~control.window, ~control.button.dim)
	.states_([["rand tuning", Color.white, Color.magenta(0.5)]])
	.action_({
		~control.chooseTuning.valueAction_(
			~control.chooseTuning.items.indexOf(~control.chooseTuning.items.choose)
		)
	});

// random synth
RoundButton(~control.window, ~control.button.dim)
	.states_([["rand synth", Color.white, Color.magenta(0.5)]])
	.action_({
		~control.chooseSynth.valueAction_(
			~control.chooseSynth.items.indexOf(~control.chooseSynth.items.choose)
		)
	});

// randomize matrix
RoundButton(~control.window,  ~control.button.dim )
	.states_([["rand matrix", Color.white, Color.cyan(0.5)]])
	.action_({
		~buttonMatrix.colsDo{ |col, pos|
			col.do{ |item, i|
				~buttonMatrix.at(i, pos).valueAction_([1,0].wchoose([1,10].normalizeSum));
			}
		}
	});

// clear matrix
RoundButton(~control.window,  ~control.button.dim )
	.states_([["clear matrix", Color.white, Color.cyan(0.5)]])
	.action_({
		~buttonMatrix.colsDo{ |col, pos|
			col.do{ |item, i|
				~buttonMatrix.at(i, pos).valueAction_(0);
			}
		}
	});

EZSlider(~control.window,
	~control.button.dim.x * 3.4 @ ~control.button.dim.y,
	"legato (dur):   ",
	controlSpec: [0.001, 2, \linear, 0.01, 0.8].asSpec,
	initVal: 0.8, labelWidth: ~control.button.dim.x + 10, numberWidth:35, gap:0@0)
	.action_({ |v|
		~sustain = v.value;
	})
	.valueAction_(0.8);


/**********************Separator************************/
StaticText(~control.window, ~control.width@10);
/*******************************************************/

// play / pause
~playButton = RoundButton(~control.window, (~control.width / 2) - 10 @ ~control.button.dim.y)
	.states_([["PLAY", Color.black, Color.green], ["PAUSE", Color.black, Color.yellow]])
	.action_({ |v|
		if(v.value == 1){
			~player.play;
		}{
			~player.pause;
		}
	
	});

// stop
RoundButton(~control.window, (~control.width / 2) - 20 @ ~control.button.dim.y)
	.states_([["STOP", Color.black, Color.red]])
	.action_({
		~player.stop;
		~player.reset;
		~playButton.value_(0);
		~leds.do{ |led| led.value_(0) };
	});

/**********************Separator************************/
StaticText(~control.window, ~control.width@20);
/*******************************************************/


// sendmidi
~sendType = 0;

StaticText(~control.window, ~control.button.dim).string_("Send to:").align_(\center);
PopUpMenu(~control.window, ~control.button.dim)
	.items_(["SC Synth", "MIDI", "Both"])
	.action_({ |menu|
		~sendType = menu.value;
		if(menu.value != 0){
			MIDIClient.init;
			~popMidiDevice.items_(
				MIDIClient.destinations.collect{ |aDevice|
					aDevice.name.asString
				}
			);
			~midiDevice = MIDIOut(0);
		}{
			~popMidiDevice.items_(["sending to SC only"]);
		};
	});


// midi device
~midiDevice = nil;

StaticText(~control.window, ~control.button.dim).string_("MIDI Device:").align_(\center);
~popMidiDevice = PopUpMenu(~control.window, (~control.button.dim.x/3)*5 @ ~control.button.dim.y)
	.items_(["sending to SC only"])
	.action_({ |menu|
		~midiDevice = MIDIOut(menu.value);
		postf("\n\t*** Usind MIDI Device: % ---> %",
			MIDIClient.destinations[menu.value].device,
			MIDIClient.destinations[menu.value].name
		);
	});

// midi channel
~midiChannel = 0;
StaticText(~control.window, ~control.button.dim).string_("MIDI Channel:").align_(\center);
PopUpMenu(~control.window, ~control.button.dim.x/3 @ ~control.button.dim.y)
	.items_((0..15).collect{ |item| item.asString })
	.action_({ |menu|
		~midiChannel = menu.value;
	});

// midi velocity
StaticText(~control.window, ~control.button.dim)
	.string_("Note Amplitude:").align_(\center);
EZSlider(
		~control.window,
		~control.button.dim.x * 1.25 @ ~control.button.dim.y,
		numberWidth:32,
		gap: 0@0
	)
	.action_({ |v|
		~amp = v.value;
	})
	.valueAction_(0.2);


/**********************Separator************************/
StaticText(~control.window, ~control.width@20);
/*******************************************************/


RoundButton(~control.window, (~control.width-20)@~control.button.dim.y )
	.states_([["CLOSE ALL WINDOWS", Color.black, Color.grey]])
	.action_({ ~window.close; ~control.window.close; ~player.stop; });

CmdPeriod.add({ ~window.close; ~control.window.close; })
)
