// a clear list for events
l = List.new

(
NoteOnResponder.removeAll;	// explains itself

// record the note ons in the list (note, time)
n = NoteOnResponder({ |s,c,n,v|
	l.add([n, Main.elapsedTime]);
},nil,nil,nil,nil)
)

// convert it to array
l = l.asArray;
x = l.flop[0];	// get midi notes
y = l.flop[1].differentiate.copyToEnd(1) ++ 1;	// get the times ans make it relative
										// ad the duration for the lat note

/*
TESTS

Now we can try to quantize the tempo

z = (1/y).round(0.5) // convert to 
y = 1/z
*/

(
Pbind(
	\instrument, \test,
	\midinote, Pseq(x, inf),			// just the notes
	\dur, Pseq(y,	inf)
	
).play
)
