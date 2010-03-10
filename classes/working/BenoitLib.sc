Benoit : Object {
	classvar <instance;
	classvar <timer;

	*new {

	}
	
	*initClass {

	}

	// make clock
	// then Benoit.timer.play ... and so on
<<<<<<< HEAD:classes/experimental/BenoitLib.sc
	*makeTimer { |time=60|
		timer.isNil.if {
			var win, cnt, uhr, clock, slide, time, warnwin;
			
=======
	*makeTimer { |seconds=60|
		var win, cnt, uhr, clock, slide, time=seconds, warnwin;
		timer.isNil.if {

>>>>>>> 7f5cafc39437ab0bf3f4f4d620cfd74b915d9e4f:classes/working/BenoitLib.sc
			/* GUI */
			win = Window("timer", Rect(Window.screenBounds.width-175,0,175,75), false, true).front;
			win.alwaysOnTop_(true);
			win.view.addFlowLayout(0@0,0@0);
			cnt = StaticText(win, (200@40))
				.align_(\center)
				.stringColor_(Color.white)
				.font_(Font("Arial Black", 22))
				.string_(0.asTimeString(0));
			uhr = StaticText(win, (200@25))
				.align_(\center)
				.stringColor_(Color.white)
				.font_(Font("Arial Narrow", 14))
				.string_(Date.getDate.format("%H:%M:%S"));
			slide = Slider(win, (175@10))
				.thumbSize_(4);
			
			/* TIMER */
			timer = Task({
				(time+1).do{ |i|
					cnt.string_(i.asTimeString);
					uhr.string_(Date.getDate.format("%H:%M:%S"));
//					win.view.background_(Color.red(i/time)); // turn red over 10 minutes!
					win.view.background_(Color.red); // turn red over 10 minutes!
					slide.value_(i/time);
<<<<<<< HEAD:classes/experimental/BenoitLib.sc
					// warnings
					case(
						{ i == 0 },
							{ "performing started, CONCENTRATE!".warn },
						{ i == (time/2).round },
							{ "HALF TIME!".warn },
						{ i == (time-(time/10)) },
							{
								"90% done ... please come to an end".warn;
//								warnwin = Window("COME TO AN END", Window.screenBounds).front;
//								StaticText(warnwin, Window.screenBounds)
//									.align_(\center)
//									.font_(Font("Times New Roman", 120))
//									.stringColor_(Color.white)
//									.string_(" p.end(60) ");
//								warnwin.view.background_(Color.red);
//								{
//									20.do{ |i|
//										warnwin.alpha_(((20-i)/20).abs);
//										0.1.wait;
//									};
//									warnwin.close
//								}.fork(AppClock);
							}
					);
=======
>>>>>>> 7f5cafc39437ab0bf3f4f4d620cfd74b915d9e4f:classes/working/BenoitLib.sc
					1.wait;
				};
				win.close;
				timer.stop;
				timer = nil;
			});
		} {
			"Timer already made, start it by accessing from Benoit.timer".warn;"";
		}
	}
	
	*startTimer { |seconds|
		timer.isNil.not.if
			{ timer.play(AppClock) }
			{ this.makeTimer(seconds); this.startTimer }
	}
	

	// send sync signal?
	// wait for signal...

	

}

// convenience methods -> shorter syntax / less typing

+ ProxySpace {

	mixer {
		ProxyMixer(this)
	}	
}