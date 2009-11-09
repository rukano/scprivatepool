k = AppClock;
w = Window("counter", Rect(0,500,300,300)).front;
b = Button(w, Rect(0,0,300,100))
	.states_([["START"]]);

// time
t = StaticText(w, Rect(0, 100, 300, 100));
t.align = \center;
t	.font_(Font("Arial", 40))
	.string_(Date.getDate.format("%H:%m:%S"))
	.stringColor_(Color.red(0.4));

{
	inf.do{
		1.wait;
		t.string_(Date.getDate.format("%H:%m:%S"));
	}
}.fork(k);

// counter
c = StaticText(w, Rect(0, 200, 300, 100));
c.align = \center;
c.font_(Font("Arial", 40));
m = 0;
c.string_(m.asTimeString);


b.action_({
	{
		inf.do{
			1.wait;
			m = m+1;
			c.string_(m.asTimeString);
		}
	}.fork(k)
});