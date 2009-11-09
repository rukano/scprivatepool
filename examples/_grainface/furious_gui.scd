/*
Sunshining (grainface ver)
GUI - improvisations / random patch with routines and background noises
Thanks to Henry Vega
*/


(
//---GUI
var 	w, wide, high, cmd,
	bNoise, bDust,
	b1, b2, b3, b4, b5, b6,
	t1, t2, t3, t4, t5, t6,
	sfx1, sfx2,
	trighigh, bhigh, sfxhigh;

wide=	38;			/*alto de la ventana*/
high=	700;			/*ancho de la ventana*/
w = 		SCWindow("hl", Rect(0, 800, wide, high));

w.front;
w.view.background = Color.black;
bhigh = 30;
trighigh = 50;
sfxhigh = 20;

~netA = NetAddr("localhost", 57130);	//...PATRICK

/*
~netA.sendMsg('/ping/juan');
*/
//////////////GUI/////////////////////
//---BUTTONS
bNoise = SCButton (w, Rect(0, 0, wide, bhigh));
bNoise.states = [	["1", Color.white, Color.blue(0.2)],
				["1", Color.white, Color.green(0.6)]
				];
bDust = SCButton (w, Rect(0, bhigh, wide, bhigh));
bDust.states = [	["2", Color.white, Color.blue(0.2)],
				["2", Color.white, Color.green(0.6)];
				];
b1 = SCButton (w, Rect(0, bhigh*2, wide, bhigh));
b1.states = [	["Q", Color.grey(0.9), Color.black],					["Q", Color.black, Color.red(0.4)];
			];
b2 = SCButton (w, Rect(0, bhigh*3, wide, bhigh));
b2.states = [	["W", Color.grey(0.9), Color.black],
			["W", Color.black, Color.red(0.4)];
			];
b3 = SCButton (w, Rect(0, bhigh*4, wide, bhigh));
b3.states = [	["E", Color.grey(0.9), Color.black],
			["E", Color.black, Color.red(0.4)];
			];
b4 = SCButton (w, Rect(0, bhigh*5, wide, bhigh));
b4.states = [	["R", Color.grey(0.9), Color.black],
			["R", Color.black, Color.red(0.4)];
			];
			
b5 = SCButton (w, Rect(0, bhigh*6, wide, bhigh));
b5.states = [	["T", Color.grey(0.9), Color.grey(0.2)] ];

b6 = SCButton (w, Rect(0, bhigh*7, wide, bhigh));
b6.states = [	["Z", Color.grey(0.9), Color.grey(0.2)] ];

//---triggers
t1 = SCButton (w, Rect(0, bhigh*8, wide, trighigh));
t1.states = [	["A", Color.white, Color.blue(0.25)]];

t2 = SCButton (w, Rect(0, (bhigh*8)+(trighigh), wide, trighigh));
t2.states = [	["S", Color.white, Color.blue(0.25)]];

t3 = SCButton (w, Rect(0, (bhigh*8)+(trighigh*2), wide, trighigh));
t3.states = [	["D", Color.white, Color.blue(0.5)]];

t4 = SCButton (w, Rect(0, (bhigh*8)+(trighigh*3), wide, trighigh));
t4.states = [["F", Color.white, Color.blue(0.5)]];

t5 = SCButton (w, Rect(0, (bhigh*8)+(trighigh*4), wide, trighigh));
t5.states = [["G", Color.white, Color.blue(0.65)]];

t6 = SCButton (w, Rect(0, (bhigh*8)+(trighigh*5), wide, trighigh));
t6.states = [["H", Color.white, Color.blue(0.65)]];
					
//-----ACTIONS/Snyths/Routines
	bNoise.action = { |view|
		if (view.value == 1) { ~noise = Synth(\noise) };
		if (view.value == 0) { ~noise.free };
	};
	bDust.action = { |view| 
		if (view.value == 1) {~dust = Synth(\dust)};
		if (view.value == 0) {~dust.free};
	};
//---CLUSTERS
	b1.action = { |view| 
		if (view.value == 1) { Tdef(\bass).play };
		if (view.value == 0) { Tdef(\bass).stop };
	};

	b2.action = { |view| 
		if (view.value == 1) { Tdef(\midLo).play };
		if (view.value == 0) { Tdef(\midLo).stop };
	};

	b3.action = { |view| 
		if (view.value == 1) { Tdef(\midHi).play };
		if (view.value == 0) { Tdef(\midHi).stop };
	};

	b4.action = { |view| 
		if (view.value == 1) { Tdef(\hi).play };
		if (view.value == 0) { Tdef(\hi).stop };	};

//---REVERSED
	b5.action = { var duration = rrand(0.5, 3.0);
		Synth(\reversed, [\dur, duration]);
		~netA.sendMsg('/juan/reversed', duration)
	};
	b6.action = { var duration = rrand(3.0, 6.0);
		Synth(\reversed, [\dur, duration]);
		~netA.sendMsg('/juan/reversed', duration)
	};
//---Triggers
//............BASS
	t1.action = { Synth(\trig1) };
	t2.action = { Synth(\trig2) };
	t3.action = { Synth(\trig3) };	
	t4.action = { Synth(\trig4) };
	t5.action = { Synth(\trig5) };
	t6.action = { Synth(\trig6) };

//.......................primo power
w.view.keyDownAction_({|view, key, mod, u|
//	[view, key, mod, u].postln;
	~buttA.value(view, key, mod, u)  });
	~cnt0 = 0!10;
	~cnt1 = 0!10;
	~cnt2 = 0!10;
	~cnt3 = 0!10;
	~cnt4 = 0!10;
	~cnt5 = 0!10;
	~cnt6 = 0!10;
	~cnt7 = 0!10;
	~cnt8 = 0!10;
	~cnt9 = 0!10;
	~buttA = {|view, key, mod, u|                                                        
	~buttB[key.asSymbol].value(10, 20)};
	~buttB = IdentityDictionary[
		//-------'p' hpcd
		\1 -> {	{~cnt0 = ~cnt0 + 1; bNoise.valueAction_(~cnt0[3].value%2)}.defer; },
		\2 -> {	{~cnt1 = ~cnt1 + 1; bDust.valueAction_(~cnt1[3].value%2)}.defer; },
		\q -> {	{~cnt2 = ~cnt2 + 1; b1.valueAction_(~cnt2[3].value%2)}.defer; },
		\w -> {	{~cnt3 = ~cnt3 + 1; b2.valueAction_(~cnt3[3].value%2)}.defer; },
		\e -> {	{~cnt4 = ~cnt4 + 1; b3.valueAction_(~cnt4[3].value%2)}.defer; },
		\r -> {	{~cnt5 = ~cnt5 + 1; b4.valueAction_(~cnt5[3].value%2)}.defer; },
		\t -> {	{~cnt6 = ~cnt6 + 1; b5.valueAction_(~cnt6[3].value%2)}.defer; },
		\z -> {	{~cnt7 = ~cnt7 + 1; b6.valueAction_(~cnt7[3].value%2)}.defer; },
		\a -> {	{t1.valueAction_(1.value)}.defer; },
		\s -> {	{t2.valueAction_(1.value)}.defer; },
		\d -> {	{t3.valueAction_(1.value)}.defer; },
		\f -> {	{t4.valueAction_(1.value)}.defer; },
		\g -> {	{t5.valueAction_(1.value)}.defer; },
		\h -> {	{t6.valueAction_(1.value)}.defer; },
		\y -> {	{~cnt8 = ~cnt8 + 1; sfx1.valueAction_(~cnt8[3].value%2)}.defer; },
		\x -> {	{~cnt9 = ~cnt9 + 1; sfx2.valueAction_(~cnt9[3].value%2)}.defer; },

		];
//.......................end power



)
