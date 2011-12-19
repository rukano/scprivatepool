c = ControlLoop(true) // true for debugging. default = false
c.thru = true // evaluate action when adding values (.add) -> default true
c.action_({ |v| ("loop: " ++ v).postln }); // action evaluated on play for every value

// value will be passed

(
// test GUI
w = Window("recorder", Rect(100, 100, 400, 100)).front;
x = EZSlider(w, (400@25)).action_{ |v| c.add(v.value) };
y = Button(w, Rect(0,50,400,50))
.states_([["rec", Color.black, Color.red],["play", Color.white, Color.green]])
.action_({ |v|
	if(v.value==1)
		{c.stop; c.startRecording}
		{c.stopRecording; c.play}
});
)

// manually
c.startRecording
c.stopRecording

// get the processed list
c.array

// play actions
c.play
c.stop
c.reset

// extras
c.makeBus  // make a bus which will be setted on play
c.bus      // get the bus
c.duration // get the duration of the whole loop

// get the values on a buffer (w/o time/durations)
b = c.valuesBuffer

c.makeBus
c.play
{ SinOsc.ar(c.bus.kr * 200 + 200) }.play

c.removeBus