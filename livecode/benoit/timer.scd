(
var win, cnt, uhr, clock, timer, slide, time, warnwin;
time = 60*10;		// 10 minutes
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

clock = AppClock;
timer = Task({
	inf.do{ |i|
		cnt.string_(i.asTimeString);
		uhr.string_(Date.getDate.format("%H:%M:%S"));
		win.background_(Color.red(i/time));	// turn red over 10 minutes!
		slide.value_(i/time);
		// warnings
		case(
			{ i == 0 },
				{ "performing started, CONCENTRATE!".warn },
			{ i == (time/2).round },
				{ "HALF TIME!".warn },
			{ i == (time-60) },
				{
					warnwin = Window("COME TO AN END", Window.screenBounds).front;
					StaticText(warnwin, Window.screenBounds)
						.align_(\center)
						.font_(Font("Times New Roman", 120))
						.stringColor_(Color.white)
						.string_(" p.end(60) ");
					warnwin.view.background_(Color.red);
					{
						20.do{ |i|
							warnwin.alpha_(((20-i)/20).abs);
							0.1.wait;
						};
						warnwin.close
					}.fork(clock);
				}
		);
		1.wait;
	}
}).play(clock);
CmdPeriod.doOnce({win.close});
)