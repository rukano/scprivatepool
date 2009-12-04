~out = ~snd
~snd = { SinOsc.ar(\freq.kr(400)*[1,2]) * EnvGen.kr(Env.perc, \t_trig.kr) * \amp.kr(1)}
s.latency = nil
~snd.set(\t_trig, 1)

(
v ? v = ();
v.win = Window("big trigga", Window.centerRect(200,200)).front;
v.win.addFlowLayout((0@0), (0@0));
v.but = Button(v.win, (200@200))
	.font_(Font("Arial", 48))
	.states_([["TRIG", Color.black, Color.white]])
	.action_({
		~snd.set(\t_trig, 1);
	});
)

~snd.play

~snd.objects[0].synthDef.dump
~snd.objects[0].synthDef.allControlNames.select{ |ctl| ctl.name == \t_trig }


(
var checkTrig = {
	var test = false;
	~snd.objects[0].synthDef.allControlNames.do{ |ctl| if(ctl.name ==\t_trig) { test = true } };
	test;
};

if ( checkTrig.value ) { "makewin".postln;""; } { "Need a node with a \"t_trig\" argument".warn;""; }

)

~snd.dump

contains

~snd.dump