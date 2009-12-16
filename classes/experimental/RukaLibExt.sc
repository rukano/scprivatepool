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


// array pairs as dictionary

+ Array {

	asDict {
		this.size.even.if {
			var temp = ();
			this.size.do{ |i|
				temp[this[i*2]] = this[i*2+1];
			};
			^temp;
		} {
			"The size of the array should be even".error;
			^this;
		};
	}
	
	asEvent {
		^this.asDict
	}

}


