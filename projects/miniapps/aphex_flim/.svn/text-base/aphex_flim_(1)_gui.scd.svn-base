(
//q = q ? ();
q.button = ();
q.slider = ();
q.window = ();
q.color = ();
q.text = ();
q.line = ();

q.color.red = Color(0.5, 0.25, 0.4, 0.25);
q.color.blue = Color(0.2, 0.2, 0.5, 0.25);
q.color.green = Color(0.0, 0.25, 0.1, 0.25);
q.color.green2 = Color(0.5, 0.75, 0.5);

q.color.grey = Color(0.4, 0.4, 0.4, 1);

q.color.black = Color(0, 0, 0);
q.color.black2 = Color(0.1, 0.1, 0.2);
q.color.black3 = Color(0, 0, 0, 0.2);

q.color.white = Color(1, 1, 1);
q.color.white2 = Color(0.8, 0.8, 0.9);


q.window.width = 400;
q.window.height = 750;

q.line[0] = 10;
q.line[1] = 80;
q.line[2] = 0;
q.line[3] = 0;
q.line[4] = 0;
q.line[5] = 0;
q.line[6] = 0;
q.line[7] = 0;
q.line[8] = 0;
q.line[9] = 0;
q.line[10] = 170-25;
q.line[11] = 200-25;
q.line[12] = 272-25;
q.line[13] = 300-25;
q.line[14] = 0;
q.line[15] = 320;
q.line[16] = q.line[15] + 180 + 20;
q.line[17] = 0;
q.line[18] = q.line[16] + 40;
q.line[19] = 0;
q.line[20] = q.window.height - 20 - 30;
q.line[21] = q.window.height - 20;


//q.window.width = SCWindow.screenBounds.width;
//q.window.height = SCWindow.screenBounds.height;

w = Window.new("Aphex Flim Control",Rect(0, 0, q.window.width, q.window.height)).front;
w.view.background = HiliteGradient(q.color.white2, q.color.black2, \v, 128, 0.7);

//q.text.title = SCStaticText( w, Rect(q.window.width/2, 0, 200, 25) );
//q.text.title.string_("APHEX FLIM GENERATOR");

CmdPeriod.add({w.close});


//------------START / CHANGE BUTTON
q.button.start = Button.new(w, Rect(0, q.line[0], q.window.width, 60))
	.states_([
		[ "START ALL", 	q.color.black, q.color.red ],
		[ "STOP ALL", 	q.color.white, q.color.blue ]
	])
	.action_{|v| 
		( v.value == 1).if(
			{
				Pdef(\ping).play;
				Pdef(\chord).play;
				Pdef(\kick).play;
				Pdef(\bass).play;
				Pdef(\hihat).play;
				Pdef(\snare).play;
				q.button.bass.valueAction_(0);
				q.button.kick.valueAction_(0);
				q.button.snare.valueAction_(0);
				q.button.hihat.valueAction_(0);
				
			},
			{ 	Pdef(\ping).stop;
				Pdef(\chord).stop;
				Pdef(\kick).stop;
				Pdef(\bass).stop;
				Pdef(\hihat).stop;
				Pdef(\snare).stop;
				Pdef(\pong).stop;
				Pdef(\chordB).stop;
				q.button.bass.valueAction_(1);
				q.button.kick.valueAction_(1);
				q.button.snare.valueAction_(1);
				q.button.hihat.valueAction_(1);				
 			}
		)
	};

q.button.change = Button.new(w, Rect(0, q.line[1], q.window.width, 40))
	.states_([
		[ "CHANGE TO THE SECOND PART", q.color.black, q.color.red ],
		[ "CHANGE TO THE FIRST PART", q.color.white, q.color.blue ]
	])
	.action_{|v|
		( v.value == 1).if(
			{ Pdef(\ping).stop; Pdef(\chord).stop; Pdef(\pong).play; Pdef(\chordB).play; },
			{ Pdef(\ping).play; Pdef(\chord).play; Pdef(\chordB).stop; Pdef(\pong).stop; }
		)	
	};
	
	
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
q.text.reverb = StaticText(w, Rect(10, q.line[10], 60, 40))
	.string_("REVERB")
	.stringColor_(q.color.white2);

q.slider.reverb = Slider2D.new(w,Rect(10, q.line[11], 80, 80))
	.action_{ |v| q.fx.reverb.set(\room, v.x); q.fx.reverb.set(\damp, v.y) }
	.x_(0.8)
	.y_(0.8);
	
q.text.reverbMix = StaticText(w, Rect(10, q.line[12], 500, 40))
	.string_("Reverb dry / wet mix")
	.stringColor_(q.color.white2);
	
q.slider.reverbMix = Slider.new(w,Rect(10, q.line[13], q.window.width-20, 15))
	.action_{|v|
		q.fx.reverb.set(\mix, v.value)
	}
	.value_(0.5);


////////////////////////////////////////////////////////
q.text.combA = StaticText(w, Rect(110, q.line[10], 80, 40))
	.string_("COMB (short)")
	.stringColor_(q.color.white2);
	
q.slider.combA = Slider2D.new(w,Rect(110, q.line[11], 80, 80))
	.action_{ |v| q.fx.combA.set(\decay, v.x/2); q.fx.combA.set(\delay, v.y/7.5) }
	.x_(0.35*2)
	.y_(0.135);

/*q.text.combAMix = SCStaticText(w, Rect(110, q.line[12], 100, 40))
	.string_("dry / wet mix")
	.stringColor_(q.color.white2);
	
q.slider.combAMix = SCSlider.new(w,Rect(110, q.line[13], 80, 15))
	.action_{|v|
		q.fx.combA.set(\mix, v.value)
	}
	.value_(0.5);*/


////////////////////////////////////////////////////////
q.text.combB = StaticText(w, Rect(210, q.line[10], 100, 40))
	.string_("COMB (middle)")
	.stringColor_(q.color.white2);

q.slider.combB = Slider2D.new(w,Rect(210, q.line[11], 80, 80))
	.action_{ |v| q.fx.combB.set(\decay, v.x); q.fx.combB.set(\delay, v.y/7.5) }
	.x_(0.6)
	.y_(0.375);

/*q.text.combBMix = SCStaticText(w, Rect(210, q.line[12], 100, 40))
	.string_("dry / wet mix")
	.stringColor_(q.color.white2);

q.slider.combBMix = SCSlider.new(w,Rect(210, q.line[13], 80, 15))
	.action_{|v|
		q.fx.combB.set(\mix, v.value)
	}
	.value_(0.5);*/
////////////////////////////////////////////////////////
q.text.combC = StaticText(w, Rect(310, q.line[10], 80, 40))
	.string_("COMB (long)")
	.stringColor_(q.color.white2);

q.slider.combC = Slider2D.new(w,Rect(310, q.line[11], 80, 80))
	.action_{ |v| q.fx.combC.set(\decay, v.x*2); q.fx.combC.set(\delay, v.y/7.5) }
	.x_(1/2)
	.y_(0.75);

/*q.text.combCMix = SCStaticText(w, Rect(310, q.line[12], 100, 40))
	.string_("dry / wet mix")
	.stringColor_(q.color.white2);

q.slider.combCMix = SCSlider.new(w,Rect(310, q.line[13], 80, 15))
	.action_{|v|
		q.fx.combC.set(\mix, v.value)
	}
	.value_(0.5);*/
////////////////////////////////////////////////////////

q.slider.compSlopes = Slider2D.new(w,Rect(10, q.line[15], 180, 180))
	.action_{ |v| q.compressor.set(\slopeA, v.x); q.fx.combC.set(\slopeB, v.y) }
	.x_(0.1)
	.y_(1);

q.slider.compTimes = Slider2D.new(w,Rect(210, q.line[15], 180, 180))
	.action_{ |v| q.compressor.set(\clampT, v.y); q.fx.combC.set(\relaxT, v.x) }
	.x_(0.5)
	.y_(0.01);
	
q.slider.compThresh = Slider.new(w,Rect(10, q.line[16], q.window.width-20, 15))
	.action_{|v|
		q.compressor.set(\thresh, v.value)
	}
	.value_(0.8);



////////////////////////////////////////////////////////
q.text.volume = NumberBox(w, Rect(q.window.width-50, q.line[20], 40, 15)).value_(1);

q.text.volumeString = StaticText(w, Rect(10, q.line[20], 60, 15))
	.string_("VOLUME")
	.stringColor_(q.color.black2);

q.slider.volume = Slider.new(w,Rect(75, q.line[20], q.window.width-150, 15))
	.action_{|v|
		q.compressor.set(\amp, v.value*2);
		q.text.volume.value_( (v.value * 2).round(0.01) )
	}
	.value_(0.5);

////////////////////////////////////////////////////////
q.text.tempo = NumberBox(w, Rect(q.window.width-50, q.line[21], 40, 15)).value_(75);

q.text.tempoString = StaticText(w, Rect(10, q.line[21], 60, 15))
	.string_("TEMPO")
	.stringColor_(q.color.black2);

q.slider.tempo = Slider.new(w,Rect(75, q.line[21], q.window.width-150, 15))
	.action_{|v|
		TempoClock.default.tempo_(v.value + 0.2 * 2);
		q.text.tempo.value_( (v.value + 0.2 * 60 * 2).round )
	}
	.value_(0.425);
////////////////////////////////////////////////////////

q.button.bass = Button.new(w,Rect(10, q.line[18], 50, 20))
	.states_([
		[ "BASS", q.color.green2, q.color.green ],
		[ "BASS", q.color.grey, q.color.black3 ]
	])
	.action_{|v|
		( v.value == 1 ).if(
			{ Pdef(\bass).stop },
			{ Pdef(\bass).play }
		)
	};


q.button.kick = Button.new(w,Rect(10, q.line[18]+20, 50, 20))
	.states_([
		[ "KICK", q.color.green2, q.color.green ],
		[ "KICK", q.color.grey, q.color.black3 ]
	])
	.action_{|v|
		( v.value == 1 ).if(
			{ Pdef(\kick).stop },
			{ Pdef(\kick).play }
		)
	};
	

q.button.snare = Button.new(w,Rect(10, q.line[18]+40, 50, 20))
	.states_([
		[ "SNARE", q.color.green2, q.color.green ],
		[ "SNARE", q.color.grey, q.color.black3 ]
	])
	.action_{|v|
		( v.value == 1 ).if(
			{ Pdef(\snare).stop },
			{ Pdef(\snare).play }
		)	
	};


q.button.hihat = Button.new(w,Rect(10, q.line[18]+60, 50, 20))
	.states_([
		[ "HIHAT", q.color.green2, q.color.green ],
		[ "HIHAT", q.color.grey, q.color.black3 ]
	])
	.action_{|v|
		( v.value == 1 ).if(
			{ Pdef(\hihat).stop },
			{ Pdef(\hihat).play }
		)	
	};

q.button.hihat.valueAction_(1);
q.button.snare.valueAction_(1);
q.button.kick.valueAction_(1);
q.button.bass.valueAction_(1);


/*
SCButton.new(w,Rect(20, 338, 100, 20))
	.states_([ [ "Push", Color(0.0, 0.0, 0.0, 1.0), Color(1.0, 0.0, 0.0, 1.0) ], [ "Pop", Color(1.0, 1.0, 1.0, 1.0), Color(0.0, 0.0, 1.0, 1.0) ] ])
	.action_{|v| };

SCButton.new(w,Rect(21, 365, 100, 20))
	.states_([ [ "Push", Color(0.0, 0.0, 0.0, 1.0), Color(1.0, 0.0, 0.0, 1.0) ], [ "Pop", Color(1.0, 1.0, 1.0, 1.0), Color(0.0, 0.0, 1.0, 1.0) ] ])
	.action_{|v| };

SCButton.new(w,Rect(29, 64, 344, 57))
	.states_([ [ "Push", Color(0.0, 0.0, 0.0, 1.0), Color(1.0, 0.0, 0.0, 1.0) ], [ "Pop", Color(1.0, 1.0, 1.0, 1.0), Color(0.0, 0.0, 1.0, 1.0) ] ])
	.action_{|v| };

SCButton.new(w,Rect(143, 307, 100, 20))
	.states_([ [ "Push", Color(0.0, 0.0, 0.0, 1.0), Color(1.0, 0.0, 0.0, 1.0) ], [ "Pop", Color(1.0, 1.0, 1.0, 1.0), Color(0.0, 0.0, 1.0, 1.0) ] ])
	.action_{|v| };

SCButton.new(w,Rect(144, 337, 100, 20))
	.states_([ [ "Push", Color(0.0, 0.0, 0.0, 1.0), Color(1.0, 0.0, 0.0, 1.0) ], [ "Pop", Color(1.0, 1.0, 1.0, 1.0), Color(0.0, 0.0, 1.0, 1.0) ] ])
	.action_{|v| };

SCButton.new(w,Rect(273, 310, 100, 20))
	.states_([ [ "Push", Color(0.0, 0.0, 0.0, 1.0), Color(1.0, 0.0, 0.0, 1.0) ], [ "Pop", Color(1.0, 1.0, 1.0, 1.0), Color(0.0, 0.0, 1.0, 1.0) ] ])
	.action_{|v| };

SCButton.new(w,Rect(273, 337, 100, 20))
	.states_([ [ "Push", Color(0.0, 0.0, 0.0, 1.0), Color(1.0, 0.0, 0.0, 1.0) ], [ "Pop", Color(1.0, 1.0, 1.0, 1.0), Color(0.0, 0.0, 1.0, 1.0) ] ])
	.action_{|v| };

	


SCMultiSliderView.new(w,Rect(31, 237, 338, 34))
	.action_{|v| };

EZSlider

*/

);
