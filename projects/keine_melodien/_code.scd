(
"_synths.scd".loadRelative;
q = ();
q.tempo = TempoClock(45/60);
q.melody = [7,0,5,0,3,0,0,0];


Pdef(\bd, 
	Pbind(
		\instrument, \bd,
		\freq, 80,
		\amp, Pseq(
			[1,\,\,\, 1,1,\,\] * 2,
			inf
		),
		\dur, 1/8
	)
);

Pdef(\hh, 
	Pbind(
		\instrument, \hh,
		\freq, 5000,
		\amp, Pseq(
			[1,\] * 0.1,
			inf
		),
		\dur, 1/8
	)
);



q.bass = PmonoArtic(\bass,
	\scale, (0..11),
	\dur, 1/8,
	\amp, 0.5,
	\octave, 4,
	\degree, Pseq(q.melody ++ (0!8), inf),
	\legato, 0.75
);

Ppar([Pdef(\bd), Pdef(\hh), q.bass]).play(q.tempo)

)

