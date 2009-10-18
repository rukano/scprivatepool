/*
PFL
Black & White
*/

q = q ? ();
q.buffer = 4;
q.window = Window("images", Rect(0, 0, 768, 576)).front;
q.images = "images/*".resolveRelative.pathMatch.collect( SCImage.open(_) );
q.window.view.backgroundImage_(q.images[0], 10);
q.duration = 60;	// secs
q.clipTime = (q.duration div: q.images.size);

Ndef(0).fadeTime = 2;
Ndef(0, { var num = 20;
	Splay.ar(
		SinOsc.ar(
			Line.kr(40, 80, q.clipTime) +
			{ 200.rand }.dup(num) +
			LFNoise2.kr(Line.kr(1, 10, q.clipTime), 10)
		).sum *
		(1/num)
	)
});

Ndef(1).fadeTime = 4;
Ndef(1, {
	var num = 20;
	var noise = WhiteNoise.ar();
	Splay.ar(
		RLPF.ar(noise, LFNoise2.kr({rrand(0.1, 1)}.dup(num)).range(80, 500), 0.005) * (1/num)
	)
});

Ndef(2).fadeTime = 4;
Ndef(2, { var num = 20;
	Splay.ar(
		VarSaw.ar(
			Array.rand(num, 40, 44) * LFNoise2.kr(Array.rand(num, 1, 2)).range(0.9, 1.1), 
			Array.rand(num, 0.0, 1.0)
		).sum *
		(1/num) * 2 * 
		Duty.kr(0.1, 0, Drand((0.0, 0.1..1.0), inf)).lag(0.04)
	)
});


{
	(q.images.size + 1).do{ |i|
		
		if(i < q.images.size){
			q.window.view.backgroundImage_(q.images[i], 10);
			Ndef(i).play
		}{
			q.window.close;
		};
		
		if(i.coin){ Ndef(i-1).end(2) };
		
		q.clipTime.wait;
	}
}.fork(AppClock)