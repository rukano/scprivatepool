// my own personal class extensions...

// Make Trigger Button from NodeProxy with \t_trig

+ NodeProxy {

	checkForTrigger {
		var test = false;
		
		// why at 0 ? check this out...
		// also look for t_ names... not only t_trig
		this.objects[0].synthDef.allControlNames.do{ |ctl|
			if(ctl.name == \t_trig) {
				test = true;
			};
		};
	^test;
	}

	// makes a button and if you bind it to a variable
	// you can acces the window and button instances and modify them
	
	makeTriggerButton { |size=200|
		var trigGUI;
		if ( this.checkForTrigger ) {
			trigGUI = ();
			trigGUI.window = Window("Node Trigger", Rect(100,100,size,size)).front;
			trigGUI.button = Button(trigGUI.window, (size@size))
				.states_([["TRIG ME!",Color.black,Color.white]])
				.font_(Font("Arial",(size/8).round))
//				.align_(\center)
				.action_({
					// mayber here... make other controller available?
					this.set(\t_trig, 1);
				});
			"Enjoy your triggering".postln;"";

			^trigGUI;
		} {
			"Need a NodeProxy with a 't_trig' argument".error;"";
			^this;
		}
	}
}

// Read audacity spectrum file

+ String {

	audacitySpectrum {
		var file, info, lines, array;
		file = File(this, "r");		// open the file
		info = file.readAllString;	// read the info	
		file.close;				// close the file
		lines = info.findAll("\r");	// find all RETURNs (for indexing)

		// make the array
		array = (lines.size-1).collect{ |i|
			var string;
			(i < (lines.size-1)).if{
				string = info.copyRange(lines[i]+1, lines[i+1]-1); // copy a line
				string.split($\t).asFloat; // split tab and make floats
			}
		};

		"INFO: Now you have an array with [freq-in-hz, amp-in-db] items".postln;
		^array;
	}
}

// array pairs as dictionary

+ Array {

	asDict {
		this.size.even.if {
			var temp = Dictionary.new;
			(this.size/2).do{ |i|
				temp.put(this[i*2], this[i*2+1]);
			};
			^temp;
		} {
			"The size of the array should be even".error;
			^this;
		};
	}
	
	asEvent {
		this.size.even.if {
			var temp = ();
			(this.size/2).do{ |i|
				temp[this[i*2]] = this[i*2+1];
			};
			^temp;
		} {
			"The size of the array should be even".error;
			^this;
		};
	}

}


