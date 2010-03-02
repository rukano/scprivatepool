Benoit : Object {
	classvar <instance;
	classvar <timer;

	*new {

	}
	
	*initClass {

	}

	// make clock
	// then Benoit.timer.play ... and so on
	*makeTimer { |seconds=60|
		var win, cnt, uhr, clock, slide, time=seconds, warnwin;
		timer.isNil.if {

			/* GUI */
			win = Window("benoiTime", Rect(Window.screenBounds.width-175,0,175,75), false, false).front;
			win.alwaysOnTop_(true);
			win.view.addFlowLayout(0@0,0@0);
			cnt = StaticText(win, (200@40))
				.align_(\center)
				.stringColor_(Color.white)
				.font_(Font("Arial Black", 18))
				.string_(0.asTimeString(0));
			uhr = StaticText(win, (200@25))
				.align_(\center)
				.stringColor_(Color.white)
				.font_(Font("Arial Narrow", 20))
				.string_(Date.getDate.format("%H:%M:%S"));
			slide = Slider(win, (175@10))
				.thumbSize_(4);
			
			/* TIMER */
			timer = Task({
				(time+1).do{ |i|
					cnt.string_(i.asTimeString);
					uhr.string_(Date.getDate.format("%H:%M:%S"));
					win.view.background_(Color.red(i/time)); // turn red over 10 minutes!
					slide.value_(i/time);
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